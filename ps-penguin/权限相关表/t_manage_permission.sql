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

 Date: 15/05/2020 10:48:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_manage_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_manage_permission`;
CREATE TABLE `t_manage_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '父节点id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'icon路径或者class',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `menu_order` int(255) NULL DEFAULT 0 COMMENT '顺序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '跳转链接',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '1 普通菜单  2 权限',
  `action` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'permission:create',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
