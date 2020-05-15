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

 Date: 15/05/2020 16:23:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_food_management
-- ----------------------------
DROP TABLE IF EXISTS `user_food_management`;
CREATE TABLE `user_food_management`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `device_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户冰箱设备id',
  `food_id` int(11) NULL DEFAULT NULL COMMENT '食物模板id',
  `food_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '食物名称',
  `food_image_file_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义食物图片id',
  `food_image_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义食物图片地址',
  `food_class_id` int(11) NOT NULL COMMENT '食物分类id',
  `storage_time` date NOT NULL COMMENT '放入时间',
  `expired_time` date NOT NULL COMMENT '预计过期时间',
  `is_expired` int(1) NULL DEFAULT 0 COMMENT '是否过期 默认0--没过期  1--已过期',
  `is_delete` int(1) NULL DEFAULT 0 COMMENT '是否删除 默认0--没删除  1--已删除',
  `storage_flag` int(1) NOT NULL COMMENT '存储方式  1--冷藏   0--冷冻',
  `is_customer` int(1) NOT NULL DEFAULT 0 COMMENT '是否自定义食材 1--自定义  0--系统',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户冰箱存储食材表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
