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

 Date: 15/05/2020 16:04:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_feedback_video_file
-- ----------------------------
DROP TABLE IF EXISTS `user_feedback_video_file`;
CREATE TABLE `user_feedback_video_file`  (
  `video_file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件id',
  `user_feedback_id` int(11) NOT NULL COMMENT '所属用户反馈id',
  `is_root` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是在根用户反馈(true)还是追加时上传(false)',
  `file_size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `upload_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传时间',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_type` int(5) NULL DEFAULT 35 COMMENT '文件类型 ,默认35 视频',
  `file_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `exist_in_dfs` int(1) NULL DEFAULT NULL COMMENT '文件是否存在DFS服务器 ，删除标识  1-存在   0-不存在',
  `del_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件被删除时间',
  `del_handler` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除文件者',
  PRIMARY KEY (`video_file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
