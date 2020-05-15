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

 Date: 15/05/2020 16:23:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for food_template
-- ----------------------------
DROP TABLE IF EXISTS `food_template`;
CREATE TABLE `food_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '食材名称',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '食材图片链接',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '食材分类（与ingredient_category字典表关联）',
  `storage_flag` tinyint(255) NULL DEFAULT NULL COMMENT '存储方式：0 为冷冻，1 为冷藏',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人id',
  `image_file_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片fileId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '食材表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
