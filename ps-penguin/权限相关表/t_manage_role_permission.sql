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

 Date: 15/05/2020 10:48:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_manage_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_manage_role_permission`;
CREATE TABLE `t_manage_role_permission`  (
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
