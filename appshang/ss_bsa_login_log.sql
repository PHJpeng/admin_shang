/*
 Navicat Premium Data Transfer

 Source Server         : 新服务器8.210.237.100
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : rm-j6cl5jij0m628n6sdoo.mysql.rds.aliyuncs.com:3306
 Source Schema         : app_shang

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 22/08/2020 20:54:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_bsa_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ss_bsa_login_log`;
CREATE TABLE `ss_bsa_login_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `login_user` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录用户',
  `login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录ip',
  `login_area` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地区',
  `login_user_agent` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录设备头',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `login_status` tinyint(1) NULL DEFAULT 1 COMMENT '登录状态 1 成功 2 失败',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_bsa_login_log
-- ----------------------------
INSERT INTO `ss_bsa_login_log` VALUES (1, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', '2019-10-11 16:03:07', 1);
INSERT INTO `ss_bsa_login_log` VALUES (2, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-06-29 17:35:15', 1);
INSERT INTO `ss_bsa_login_log` VALUES (3, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-06-29 17:54:42', 1);
INSERT INTO `ss_bsa_login_log` VALUES (4, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-06-29 17:57:26', 2);
INSERT INTO `ss_bsa_login_log` VALUES (5, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-06-29 17:57:38', 1);
INSERT INTO `ss_bsa_login_log` VALUES (6, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-06-30 13:16:51', 1);
INSERT INTO `ss_bsa_login_log` VALUES (7, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-06-30 16:59:18', 1);
INSERT INTO `ss_bsa_login_log` VALUES (8, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-01 13:24:41', 1);
INSERT INTO `ss_bsa_login_log` VALUES (9, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-01 13:25:36', 1);
INSERT INTO `ss_bsa_login_log` VALUES (10, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-02 14:01:50', 1);
INSERT INTO `ss_bsa_login_log` VALUES (11, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-02 14:06:58', 1);
INSERT INTO `ss_bsa_login_log` VALUES (12, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-03 10:23:48', 1);
INSERT INTO `ss_bsa_login_log` VALUES (13, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-03 10:24:43', 1);
INSERT INTO `ss_bsa_login_log` VALUES (14, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-06 13:43:15', 1);
INSERT INTO `ss_bsa_login_log` VALUES (15, 'peng', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 15:44:31', 1);
INSERT INTO `ss_bsa_login_log` VALUES (16, 'peng', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 15:48:07', 1);
INSERT INTO `ss_bsa_login_log` VALUES (17, '小白', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 15:48:52', 1);
INSERT INTO `ss_bsa_login_log` VALUES (18, '小白', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 15:49:50', 1);
INSERT INTO `ss_bsa_login_log` VALUES (19, '小白', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 15:55:34', 1);
INSERT INTO `ss_bsa_login_log` VALUES (20, '小白', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 15:59:16', 1);
INSERT INTO `ss_bsa_login_log` VALUES (21, 'peng1', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:00:06', 1);
INSERT INTO `ss_bsa_login_log` VALUES (22, 'peng1', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:03:17', 1);
INSERT INTO `ss_bsa_login_log` VALUES (23, 'peng1', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:07:54', 1);
INSERT INTO `ss_bsa_login_log` VALUES (24, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:10:14', 1);
INSERT INTO `ss_bsa_login_log` VALUES (25, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:10:58', 1);
INSERT INTO `ss_bsa_login_log` VALUES (26, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:12:30', 1);
INSERT INTO `ss_bsa_login_log` VALUES (27, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:13:02', 1);
INSERT INTO `ss_bsa_login_log` VALUES (28, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:14:55', 1);
INSERT INTO `ss_bsa_login_log` VALUES (29, 'peng', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:18:24', 1);
INSERT INTO `ss_bsa_login_log` VALUES (30, 'peng', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:19:35', 1);
INSERT INTO `ss_bsa_login_log` VALUES (31, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:28:08', 1);
INSERT INTO `ss_bsa_login_log` VALUES (32, 'peng1', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:35:22', 1);
INSERT INTO `ss_bsa_login_log` VALUES (33, 'peng1', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:41:24', 1);
INSERT INTO `ss_bsa_login_log` VALUES (34, 'peng1', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:42:56', 1);
INSERT INTO `ss_bsa_login_log` VALUES (35, 'peng', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 16:48:04', 1);
INSERT INTO `ss_bsa_login_log` VALUES (36, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 17:00:43', 1);
INSERT INTO `ss_bsa_login_log` VALUES (37, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 17:07:17', 1);
INSERT INTO `ss_bsa_login_log` VALUES (38, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 17:42:22', 1);
INSERT INTO `ss_bsa_login_log` VALUES (39, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-07 21:17:21', 1);
INSERT INTO `ss_bsa_login_log` VALUES (40, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-09 10:29:28', 1);
INSERT INTO `ss_bsa_login_log` VALUES (41, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-09 11:04:39', 1);
INSERT INTO `ss_bsa_login_log` VALUES (42, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-11 08:34:31', 1);
INSERT INTO `ss_bsa_login_log` VALUES (43, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-12 15:58:29', 1);
INSERT INTO `ss_bsa_login_log` VALUES (44, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-14 10:46:55', 1);
INSERT INTO `ss_bsa_login_log` VALUES (45, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-14 18:14:47', 1);
INSERT INTO `ss_bsa_login_log` VALUES (46, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', '2020-07-15 15:55:57', 1);
INSERT INTO `ss_bsa_login_log` VALUES (47, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-20 11:06:20', 1);
INSERT INTO `ss_bsa_login_log` VALUES (48, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-21 10:19:08', 1);
INSERT INTO `ss_bsa_login_log` VALUES (49, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-21 18:41:04', 1);
INSERT INTO `ss_bsa_login_log` VALUES (50, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-22 06:45:40', 1);
INSERT INTO `ss_bsa_login_log` VALUES (51, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-23 10:07:35', 1);
INSERT INTO `ss_bsa_login_log` VALUES (52, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-23 15:52:47', 1);
INSERT INTO `ss_bsa_login_log` VALUES (53, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-23 16:25:06', 1);
INSERT INTO `ss_bsa_login_log` VALUES (54, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-23 16:43:10', 1);
INSERT INTO `ss_bsa_login_log` VALUES (55, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-23 18:42:43', 1);
INSERT INTO `ss_bsa_login_log` VALUES (56, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-23 18:49:07', 1);
INSERT INTO `ss_bsa_login_log` VALUES (57, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-23 22:18:05', 1);
INSERT INTO `ss_bsa_login_log` VALUES (58, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-23 22:22:18', 1);
INSERT INTO `ss_bsa_login_log` VALUES (59, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-24 09:57:42', 1);
INSERT INTO `ss_bsa_login_log` VALUES (60, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-25 13:30:48', 1);
INSERT INTO `ss_bsa_login_log` VALUES (61, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-25 14:42:32', 1);
INSERT INTO `ss_bsa_login_log` VALUES (62, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-25 14:49:07', 1);
INSERT INTO `ss_bsa_login_log` VALUES (63, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-28 10:07:03', 1);
INSERT INTO `ss_bsa_login_log` VALUES (64, 'peng', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-28 11:47:19', 1);
INSERT INTO `ss_bsa_login_log` VALUES (65, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-28 11:47:46', 1);
INSERT INTO `ss_bsa_login_log` VALUES (66, 'peng', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-28 14:06:43', 1);
INSERT INTO `ss_bsa_login_log` VALUES (67, 'peng1', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-28 14:09:26', 1);
INSERT INTO `ss_bsa_login_log` VALUES (68, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', '2020-07-28 14:09:50', 1);
INSERT INTO `ss_bsa_login_log` VALUES (69, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-07-31 15:44:11', 1);
INSERT INTO `ss_bsa_login_log` VALUES (70, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-01 13:54:32', 1);
INSERT INTO `ss_bsa_login_log` VALUES (71, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-02 15:41:26', 1);
INSERT INTO `ss_bsa_login_log` VALUES (72, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-03 14:08:23', 1);
INSERT INTO `ss_bsa_login_log` VALUES (73, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-10 11:20:33', 1);
INSERT INTO `ss_bsa_login_log` VALUES (74, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2020-08-15 00:33:31', 1);
INSERT INTO `ss_bsa_login_log` VALUES (75, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2020-08-18 07:15:26', 1);
INSERT INTO `ss_bsa_login_log` VALUES (76, 'admin', '127.0.0.1', '内网IP-内网IP', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36', '2020-08-20 10:24:13', 1);
INSERT INTO `ss_bsa_login_log` VALUES (77, 'admin', '221.216.239.191', '中国-北京-北京市-联通', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2020-08-21 00:47:23', 1);
INSERT INTO `ss_bsa_login_log` VALUES (78, 'admin', '221.216.239.191', '中国-北京-北京市-联通', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36', '2020-08-21 02:16:50', 1);
INSERT INTO `ss_bsa_login_log` VALUES (79, 'admin', '14.127.249.240', '中国-广东省-深圳市-电信', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.92 Safari/537.36', '2020-08-21 10:30:27', 1);

SET FOREIGN_KEY_CHECKS = 1;
