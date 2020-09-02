package net.machtalk.server.encode;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.ByteBufUtil;
import io.netty.buffer.EmptyByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;
import net.machtalk.server.channel.ChannelWrapper;
import net.machtalk.server.codec.BasePackage;
import net.machtalk.server.constant.ConstantKey;
import net.machtalk.server.constant.PackageType;
import net.machtalk.server.message.BasePackageCoder;
import net.machtalk.server.utils.ByteUtils;
import net.machtalk.server.utils.MessageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/**
 * 基本包解码器,将二进制数据解码成JAVA对象
 * Created by liupeizhi on 2015/12/12.
 */
public class BasePackageDecoder extends ByteToMessageDecoder {
    private final static Logger logger = LoggerFactory.getLogger(BasePackageDecoder.class);

    private Charset encode;

    ByteBuf abyteBuf = null;

    public BasePackageDecoder(Charset encode) {
        this.encode = encode;
        abyteBuf = Unpooled.buffer();
    }

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
//        super.channelReadComplete(ctx);
        logger.debug("读取完毕：" + ByteBufUtil.hexDump(abyteBuf));
        List<BasePackage> basePackages = new ArrayList<BasePackage>();
        ChannelWrapper channelWrapper = new ChannelWrapper(ctx.channel());
        //判断abyteBuf是否有可以读取的数据
        if (abyteBuf.writerIndex() > 0) {
            //从channel中获取key
            String key = channelWrapper.getValue(ConstantKey.PWD_KEY);
            byte[] keys = null;
            if (key != null) {
                keys = key.getBytes();
                logger.debug("设置KEY：" + ByteUtils.byteToString(keys));
            }
            //abyteBuf的前7位为数据的头部，后面的数据才是真正的数据体。此处判断分割标志0xAA、OxBB，并且abyteBuf的可读数据长度要大于7
            if (abyteBuf.getByte(0) == MessageUtils.DELIMITER[0] && abyteBuf.getByte(1) == MessageUtils.DELIMITER[1] && abyteBuf.readableBytes() > 7) {
                //读取第三个字节，判断数据的类型
                byte type = abyteBuf.getByte(2);
                //如果数据类型为json
                if (type == PackageType.JSON_PACK) {
                    //读取第5个字节，为左半包的长度
                    byte llength = abyteBuf.getByte(5);
                    //读取第6个字节，为右半包的长度
                    byte rlength = abyteBuf.getByte(6);
                    //组合上述的两个长度为完整包的长度
                    int dataLength = ByteUtils.toUnsignedByte(rlength) + ByteUtils.toUnsignedByte(llength) * 256;
                    //如果abyteBuf中可读的字节数 小于 完整包长度+7 ，则说明 当前的abyteBuf 为 半包
                    if (abyteBuf.readableBytes() < dataLength + 7) {
                        //将半包先放在缓存中（channel中），继续读取下一个包
                        ByteBuf byteBuf = Unpooled.buffer();
                        byteBuf.writeBytes(abyteBuf);
                        channelWrapper.setValue(ConstantKey.HALFPACK, byteBuf);
                        logger.debug("长消息前半部分读取：" + ByteBufUtil.hexDump(byteBuf));
                        abyteBuf = Unpooled.buffer();
                        return;
                    } else {//如果abyteBuf可读字节数大于 完整包长度+7，则说明可以 读一个完整的包
                        channelWrapper.setValue(ConstantKey.HALFPACK, null);
                    }
                }
            }
            ByteBuf byteBuf = Unpooled.buffer();
            //此处判断为，缓存中是否有半包
            if (channelWrapper.getValue(ConstantKey.HALFPACK) != null) {
                //缓存中有半包则执行如下的逻辑：先获取半包
                byteBuf = channelWrapper.getValue(ConstantKey.HALFPACK);
                if (byteBuf.getByte(0) == MessageUtils.DELIMITER[0] && byteBuf.getByte(1) == MessageUtils.DELIMITER[1] && byteBuf.readableBytes() > 7) {
                    //获取 左半包的长度
                    byte llength = byteBuf.getByte(5);
                    //获取右半包的长度
                    byte rlength = byteBuf.getByte(6);
                    //获取包的类型
                    byte type = byteBuf.getByte(2);
                    //判断是否为json类型
                    if (type == PackageType.JSON_PACK) {
                        //组合左半包长度和右半包长度为完整包长度
                        int dataLength = ByteUtils.toUnsignedByte(rlength) + ByteUtils.toUnsignedByte(llength) * 256;
                        logger.debug("长消息前非前部分读取：" + byteBuf.readableBytes() + ":" + abyteBuf.readableBytes() + ":" + dataLength);
                        //如果 缓存包可读字节数+新的包的可读字节数 <  完整包的长度+7 ，说明依然不能拼接成一个完整的包，需要继续读取下一个包
                        if (byteBuf.readableBytes() + abyteBuf.readableBytes() < dataLength + 7) {
                            ByteBuf byteBuf2 = Unpooled.buffer();
                            byteBuf2.writeBytes(abyteBuf);
                            byteBuf.writeBytes(byteBuf2);
                            channelWrapper.setValue(ConstantKey.HALFPACK, byteBuf);
                            logger.debug("长消息前非前部分读取1：" + ByteBufUtil.hexDump(byteBuf));
                            abyteBuf = Unpooled.buffer();
                            return;
                        }
                        //如果 缓存包可读字节数+新的包的可读字节数 = 完整包的长度+7，说明恰好可以拼接成一个完整的包
                        if (byteBuf.readableBytes() + abyteBuf.readableBytes() == dataLength + 7) {
                            ByteBuf byteBuf2 = Unpooled.buffer();

                            byteBuf2.writeBytes(abyteBuf);
                            byteBuf.writeBytes(byteBuf2);
                            abyteBuf = Unpooled.buffer();
                            logger.debug("长消息前非前部分读取2：" + ByteBufUtil.hexDump(byteBuf));
                            channelWrapper.setValue(ConstantKey.HALFPACK, null);
                        }
                        //如果 缓存包可读字节数+新的包的可读字节数 > 完整包的长度+7，说明 拼接成一个完整的包之后，还有多余的数据。
                        if (byteBuf.readableBytes() + abyteBuf.readableBytes() > dataLength + 7) {
                            byte[] ext = ByteUtils.subBytes(abyteBuf.array(), dataLength + 7 - byteBuf.readableBytes(), byteBuf.readableBytes() + abyteBuf.readableBytes() - dataLength - 7);
                            ByteBuf byteBuf2 = Unpooled.buffer();
                            byteBuf2.writeBytes(ext);
                            byteBuf.writeBytes(abyteBuf);
                            channelWrapper.setValue(ConstantKey.HALFPACK, byteBuf2);
                            logger.debug("长消息前非前部分读取3：" + ByteBufUtil.hexDump(byteBuf));
                            abyteBuf = Unpooled.buffer();
                            logger.info("多余的信息：" + ByteBufUtil.hexDump(byteBuf2));
                        }

                    }
                }  else {
                    channelWrapper.setValue(ConstantKey.HALFPACK, null);
                }
            }
            //将完整的包转为BasePackage对象
            if (byteBuf.readableBytes() > 0) {
                basePackages = BasePackageCoder.decode(byteBuf, keys);
            } else {
                basePackages = BasePackageCoder.decode(abyteBuf, keys);
            }

            if (basePackages != null && basePackages.size() > 0) {
                for (BasePackage basePackage : basePackages) {
                    //如果不是心跳数据，则进行包id的处理。
                    if (basePackage.getPtype() != PackageType.PING && basePackage.getPtype() != PackageType.PONG) {
                        Integer pid = channelWrapper.getValue(ConstantKey.CUR_PACK_ID);
                        if (pid == null) {
                            channelWrapper.setValue(ConstantKey.CUR_PACK_ID, basePackage.getPid());
                            logger.debug("设置包ID:" + basePackage.getPid());
                        } else {
                            int bpid = basePackage.getPid();
                            int qpid1 = pid + 1;
                            int qpid2 = pid + 2;
                            int qpid3 = pid + 3;
                            int qpid4 = pid + 4;
                            int qpid5 = pid + 5;

                            if (qpid1 > 65535) {
                                qpid1 -= 65535;
                            }
                            if (qpid2 > 65535) {
                                qpid2 -= 65535;
                            }
                            if (qpid3 > 65535) {
                                qpid3 -= 65535;
                            }
                            if (qpid4 > 65535) {
                                qpid4 -= 65535;
                            }
                            if (qpid5 > 65535) {
                                qpid5 -= 65535;
                            }
                            logger.debug("下一个消息ID应该是：" + qpid1 + "," + qpid2 + "," + qpid3 + "," + qpid4 + "," + qpid5 + " 实际上是：" + bpid);
                            if (qpid1 == bpid || qpid2 == bpid || qpid3 == bpid || qpid4 == bpid || qpid5 == bpid) {
                                channelWrapper.setValue(ConstantKey.CUR_PACK_ID, basePackage.getPid());
                            } else {
                                Integer badIds = channelWrapper.getValue(ConstantKey.BAD_PACK_ID_TIMES);
                                if (badIds == null) {
                                    channelWrapper.setValue(ConstantKey.BAD_PACK_ID_TIMES, 1);
                                } else {
                                    if (badIds == 2) {
                                        logger.debug("已经第三次包ID错误，关闭连接：" + ctx.channel());
                                        ctx.channel().close();
                                    } else {
                                        channelWrapper.setValue(ConstantKey.BAD_PACK_ID_TIMES, badIds + 1);
                                    }
                                }

                            }
                        }
                    }

                    if (basePackage != null) {
                        channelWrapper.setValue(ConstantKey.MSG_READ, basePackage);
                        super.channelReadComplete(ctx);
                    }
                }
            }
        } else {
            logger.debug("收到的消息为空！");
        }
        abyteBuf = Unpooled.buffer();
    }

    /**
     * 该方法在channelReadComplete方法之前调用，将byteBuf中的数据放入到abyteBuf中。
     * @param channelHandlerContext
     * @param byteBuf
     * @param list
     * @throws Exception
     */
    @Override
    protected void decode(ChannelHandlerContext channelHandlerContext, ByteBuf byteBuf, List<Object> list) throws Exception {


        try {
            if (!(byteBuf instanceof EmptyByteBuf)) {

                logger.debug("abyteBuf.sizebefore=" + abyteBuf.capacity() + "abyteBuf=" + abyteBuf + "abyteBuf.readableBytes()=" + abyteBuf.readableBytes() + "byteBuf.readableBytes()=" + byteBuf.readableBytes());
//                if(abyteBuf.writableBytes()<byteBuf.readableBytes()){
//                    abyteBuf.capacity(abyteBuf.capacity() + byteBuf.writerIndex()+byteBuf.writableBytes());
//                    logger.info("abyteBuf.sizeafter="+ abyteBuf.capacity() +"abyteBuf="+ abyteBuf+"abyteBuf.writableBytes()="+abyteBuf.writableBytes()+"byteBuf.readableBytes()="+byteBuf.readableBytes());
//                }

                logger.debug("读取消息：" + ByteBufUtil.hexDump(byteBuf));
                abyteBuf.writeBytes(byteBuf);
                logger.debug("abyteBuf.sizeafter=" + abyteBuf.capacity() + "abyteBuf=" + abyteBuf + "abyteBuf.readableBytes()=" + abyteBuf.readableBytes() + "byteBuf.readableBytes()=" + byteBuf.readableBytes());


            } else {
                logger.debug("收到空包：" + byteBuf);
            }

        } catch (Throwable e) {
//            list.add(null);
            logger.error(e.getMessage() + "MSG:" + byteBuf, e);
        }

    }
}
