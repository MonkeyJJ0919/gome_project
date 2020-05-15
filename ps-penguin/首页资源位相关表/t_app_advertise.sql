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

 Date: 15/05/2020 14:14:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_app_advertise
-- ----------------------------
DROP TABLE IF EXISTS `t_app_advertise`;
CREATE TABLE `t_app_advertise`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告名称',
  `img_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告图片',
  `link_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `skip_type` tinyint(1) NULL DEFAULT NULL COMMENT '跳转类型：1、无跳转\r\n2、跳转内部h5\r\n3、跳转系统浏览器\r\n*不识别的无跳转',
  `is_online` bit(1) NULL DEFAULT NULL COMMENT '是否结束（上下架）：0未结束（上架），1结束（下架）',
  `is_closeable` bit(1) NULL DEFAULT NULL COMMENT '是否可关闭：0不可关闭，1可关闭（此字段目前忽略）',
  `is_all_visiable` tinyint(1) NULL DEFAULT NULL COMMENT '可见类型：0:全部用户 1：配网用户 2： 指定用户',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '活动起始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '活动截止时间',
  `create_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建id',
  `create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `showend` tinyint(2) NOT NULL DEFAULT 1 COMMENT '展示端：1 表示手机端，2 表示冰箱端',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'app首页广告资源位' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
