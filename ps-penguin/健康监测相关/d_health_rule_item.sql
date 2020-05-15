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

 Date: 15/05/2020 17:00:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for d_health_rule_item
-- ----------------------------
DROP TABLE IF EXISTS `d_health_rule_item`;
CREATE TABLE `d_health_rule_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL COMMENT '1:良好;2:一般 ;3:透用',
  `min_val` int(11) NULL DEFAULT NULL,
  `max_val` int(11) NULL DEFAULT NULL,
  `health_rule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8230 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
