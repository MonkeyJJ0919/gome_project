/*
 Navicat MySQL Data Transfer

 Source Server         : 200
 Source Server Type    : MySQL
 Source Server Version : 100116
 Source Host           : 10.112.80.3:3306
 Source Schema         : gomesmart

 Target Server Type    : MySQL
 Target Server Version : 100116
 File Encoding         : 65001

 Date: 15/05/2020 15:27:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bind_record
-- ----------------------------
DROP TABLE IF EXISTS `t_bind_record`;
CREATE TABLE `t_bind_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsc_ins_order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '安装单号',
  `bind_type` int(2) NULL DEFAULT NULL COMMENT '1、云对端 WiFi 配网； 2、云对云 WiFi 配网； 3、蓝牙配网； 4、网关配网；',
  `app_os` int(1) NULL DEFAULT NULL COMMENT '手机系统 0 Android 1 IOS',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '配网开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '配网结束时间',
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机号',
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备did',
  `status` int(2) NULL DEFAULT NULL COMMENT '配网结果，0 失败 1 成功  2 未配网',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成功状态无需原因，失败需要有原因;0 失败 1成功',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '智能-商品品类id',
  `brand_id` int(64) NULL DEFAULT NULL COMMENT '智能-商品品牌id',
  `model_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '智能-商品型号id',
  `gsc_copartner_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '(安装)合作师傅手机号',
  `gsc_copartner_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '(安装)合作师傅姓名',
  `gsc_copartner_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '(安装)合作师傅编码',
  `gsc_customer_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户家庭住址',
  `gsc_good_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `gsc_good_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `gsc_goods_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `gsc_category_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品类编码\n\n商品品类编码',
  `gsc_category_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品类名称',
  `gsc_good_spec` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品型号',
  `gsc_store_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线下门店编码',
  `gsc_store_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线下门店名称',
  `gsc_brand_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌编码',
  `gsc_brand_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌名称',
  `gsc_sale_company_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售组织编码',
  `gsc_sale_company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售组织名称',
  `gsc_after_sale_company_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售后公司编码',
  `gsc_after_sale_company_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售后公司编码\n\n售后公司名称',
  `gsc_station_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网点编码',
  `gsc_station_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网点名称',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `gsc_worker_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '师傅手机号',
  `gsc_worker_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '师傅名称',
  `gsc_worker_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '师傅编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid_index`(`uid`) USING BTREE,
  INDEX `create_time_index`(`create_time`) USING BTREE,
  INDEX `gsc_worker_phone_index`(`gsc_worker_phone`) USING BTREE,
  INDEX `gsc_ins_order_id_index`(`gsc_ins_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12836 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备绑定记录表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
