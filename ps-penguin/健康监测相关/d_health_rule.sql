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

 Date: 15/05/2020 17:00:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for d_health_rule
-- ----------------------------
DROP TABLE IF EXISTS `d_health_rule`;
CREATE TABLE `d_health_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brand_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `unit` int(2) NOT NULL COMMENT '1:次;2:天;3:小时',
  `create_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2682 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
