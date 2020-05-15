/*
 Navicat MySQL Data Transfer

 Source Server         : 300
 Source Server Type    : MySQL
 Source Server Version : 100210
 Source Host           : 10.112.80.4:3306
 Source Schema         : gomesmart

 Target Server Type    : MySQL
 Target Server Version : 100210
 File Encoding         : 65001

 Date: 15/05/2020 17:38:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for d_warm_service
-- ----------------------------
DROP TABLE IF EXISTS `d_warm_service`;
CREATE TABLE `d_warm_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备Gid',
  `set_periodic` tinyint(1) NOT NULL COMMENT '设置定期检测',
  `set_trouble` tinyint(1) NOT NULL COMMENT '设置故障检测',
  `set_electricity` tinyint(1) NOT NULL COMMENT '设置电量统计',
  `updater` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑人id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gid_index`(`gid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
