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

 Date: 15/05/2020 15:51:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_app_feedback_record
-- ----------------------------
DROP TABLE IF EXISTS `user_app_feedback_record`;
CREATE TABLE `user_app_feedback_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_app_feedback_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '与user_app_feedback表id字段匹配(多对一)',
  `msg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '沟通内容',
  `image_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片fileid，逗号分割',
  `video_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频文件ids',
  `commuication_time` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '沟通时间',
  `msg_status` int(4) NOT NULL COMMENT '消息状态(运营人员消息是否被用户读取) 0 未读 1 已读',
  `msg_from` int(4) NOT NULL COMMENT '消息来源：1 用户 0 运营人员',
  `handler` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理运营人员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 323 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'App用户与运营人员对app的意见反馈跟踪记录表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
