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

 Date: 15/05/2020 14:27:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bussiness_article_type_new
-- ----------------------------
DROP TABLE IF EXISTS `bussiness_article_type_new`;
CREATE TABLE `bussiness_article_type_new`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章类型名称',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父类类型id',
  `sort_num` int(11) NULL DEFAULT 0 COMMENT '排序数字（从小到大递增）',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `updator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章类型新表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
