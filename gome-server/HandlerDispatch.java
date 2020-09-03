package net.machtalk.xcloud.msgqueue.dispatcher;

import net.machtalk.server.constants.ProjectConstants;
import net.machtalk.server.zookeeperclient.ZookeeperClient;
import net.machtalk.xcloud.msgqueue.threadPool.ThreadScheduler;
import net.machtalk.xcloud.msgqueue.worker.WorkerThread;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 调度
 * User: zhaop
 * Date: 15-2-3
 * Time: 下午8:46
 */
public class HandlerDispatch {
    private static final Logger log = LoggerFactory.getLogger(HandlerDispatch.class);
    private static HandlerDispatch handlerDispatch = null;
    private static Object lock = new Object();
    private boolean waiting = false; //线程是否被挂起

    private int totalThread = ZookeeperClient.getInstance().getIntegerProperty(ProjectConstants.XCLOUD_MQ_PROJECT, "TOTAL_THREAD", 50); // 总线程数
    private int curThread = 0; //当前线程数

    public static HandlerDispatch getHandlerDispatch() {
        if (null == handlerDispatch)
            synchronized (HandlerDispatch.class) {
                if (null == handlerDispatch) {
                    handlerDispatch = new HandlerDispatch();
                }
            }
        return handlerDispatch;
    }

    public void addWorker(WorkerThread abstractHanler) {
        synchronized (lock) {
            ThreadScheduler.getPool().exeThread(abstractHanler);
            curThread++;
            log.info("正在运行线程数[" + curThread + "/" + totalThread + "]");
            if (curThread >= totalThread){ // 线程数达到最大值 挂起主线程
                try {
                    log.info("运行线程数达到最大值，接收消息线程被挂起");
                    if (!waiting){
                        waiting = true;
                        lock.wait(); // 挂起
                    }
                } catch (InterruptedException e) {
                    log.error(e.getMessage(), e);
                    Thread.currentThread().interrupt();
                }
            }
        }
    }

    public void finishWorker() {
        synchronized (lock) {
            curThread--;
            log.info("正在运行线程数[" + curThread + "/" + totalThread + "]");
            if (curThread < totalThread && waiting) {
                log.info("唤醒接收消息线程");
                waiting = false;
                //lock.notifyAll();
                lock.notify();
            }
        }
    }


    public int getCurThread() {
        return curThread;
    }

    public void setCurThread(int curThread) {
        this.curThread = curThread;
    }

    public int getTotalThread() {
        return totalThread;
    }

    public void setTotalThread(int totalThread) {
        this.totalThread = totalThread;
    }


}
