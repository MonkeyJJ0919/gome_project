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

 Date: 15/05/2020 15:27:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bind_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_bind_feedback`;
CREATE TABLE `t_bind_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(4) NULL DEFAULT NULL COMMENT '问题分类5其他 6 配网异常 7 产品建议 8 设备异常 9 安全问题 10 管理问题',
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `device_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备Id',
  `opinion` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '意见内容',
  `product_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备品类id',
  `brand_id` int(64) NULL DEFAULT NULL COMMENT '设备品牌id',
  `model_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备型号id',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gsc_ins_order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装单号',
  `product_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品类名称',
  `brand_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `model_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '型号名称',
  `device_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33557 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户对app的意见反馈' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
