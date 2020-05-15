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

 Date: 15/05/2020 13:50:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件名称',
  `type` int(2) NOT NULL COMMENT '事件类型： 1：活动 2：商品',
  `status` int(2) NOT NULL DEFAULT 1 COMMENT '状态： 0：暂停 1：正常',
  `start_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '事件开始时间',
  `end_time` timestamp(0) NOT NULL COMMENT '事件结束时间',
  `create_user_id` int(32) NOT NULL COMMENT '创建人id',
  `create_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人姓名',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
