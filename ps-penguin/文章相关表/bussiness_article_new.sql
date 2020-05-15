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

 Date: 15/05/2020 14:27:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bussiness_article_new
-- ----------------------------
DROP TABLE IF EXISTS `bussiness_article_new`;
CREATE TABLE `bussiness_article_new`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '文章id',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章作者',
  `parent_article_type` int(11) NULL DEFAULT NULL COMMENT '一级文章类型',
  `article_type` int(11) NOT NULL COMMENT '二级文章类型',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章摘要',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章主题图标',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `collection_num` int(11) NULL DEFAULT 0 COMMENT '收藏数量',
  `upvote_num` int(11) NULL DEFAULT 0 COMMENT '点赞次数',
  `read_user_num` int(11) NULL DEFAULT 0 COMMENT '阅读用户数',
  `read_num` int(11) NULL DEFAULT 0 COMMENT '阅读数',
  `default_collection_num` int(11) NULL DEFAULT 0 COMMENT '默认收藏数量',
  `default_upvote_num` int(11) NULL DEFAULT 0 COMMENT '默认点赞次数',
  `default_read_num` int(11) NULL DEFAULT 0 COMMENT '默认阅读数',
  `create_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人，后台用',
  `top_flag` int(1) NULL DEFAULT 0 COMMENT '0未置顶 1置顶',
  `updator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编辑人',
  `publish_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '9999-12-31T23:59:59' COMMENT '发布时间',
  `offline_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '9999-12-31T23:59:59' COMMENT '下线时间',
  `h5_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `top_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '置顶时间',
  `is_set_rule` int(2) NULL DEFAULT 0 COMMENT '是否设置文章发布规则：0-未设置，1-已设置',
  `limit_user_type` int(2) NULL DEFAULT 0 COMMENT '限定用户类型：0-所有用户，1-仅限已配网用户，2-未配网用户，3-选择用户账号来设置',
  `limit_product_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当limit_user_type为1时，对拥有某品类的用户进行限制，该字段为空时为任意品类',
  `online_type` int(1) NULL DEFAULT 0 COMMENT '上线类型：0-立即上线，1-预约上线',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
