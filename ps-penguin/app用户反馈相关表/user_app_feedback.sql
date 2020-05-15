/*
 Navicat MySQL Data Transfer

 Source Server         : 800
 Source Server Type    : MySQL
 Source Server Version : 100116
 Source Host           : 10.112.73.38:3306
 Source Schema         : gomesmart

 Target Server Type    : MySQL
 Target Server Version : 100116
 File Encoding         : 65001

 Date: 15/05/2020 15:51:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_app_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_app_feedback`;
CREATE TABLE `user_app_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `opinion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '意见内容',
  `device_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `device_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备Id',
  `app_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'APP版本',
  `os_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统版本',
  `phone_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机机型',
  `image_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片fileid，逗分',
  `video_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频文件ids',
  `has_videos` int(1) NULL DEFAULT 0 COMMENT '标记是否有视频上传 1有 0没有',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `create_time` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `status` int(4) NULL DEFAULT 0 COMMENT '处理状态：0待处理1处理中2处理完毕',
  `handler_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人员',
  `handle_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理时间',
  `type` int(4) NULL DEFAULT NULL COMMENT '问题分类0用户操作1用户体验2设备故障3app问题4后台问题5其他',
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `end_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_user_update_time` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户app新建|追加新反馈时间',
  `app_msg_status` int(1) NOT NULL DEFAULT -1 COMMENT '运营是否读取用户新反馈标注  0--未读(用户新增或者追加)  1--已读(运营查看)  -1--默认值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3645 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户对app的意见反馈' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
