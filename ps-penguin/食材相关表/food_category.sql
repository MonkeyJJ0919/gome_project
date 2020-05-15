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

 Date: 15/05/2020 16:23:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for food_category
-- ----------------------------
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食材分类id（主键）',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '食材分类名称',
  `default_storage_flag` tinyint(2) NULL DEFAULT NULL COMMENT '默认存储方式：0为冷冻，1为冷藏',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '食材分类表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
