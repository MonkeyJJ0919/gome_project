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

 Date: 15/05/2020 14:02:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_advertisement_img
-- ----------------------------
DROP TABLE IF EXISTS `t_advertisement_img`;
CREATE TABLE `t_advertisement_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `adv_id` int(11) NOT NULL COMMENT '广告id',
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '尺寸，如：750*1334',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '启动页广告图片表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
