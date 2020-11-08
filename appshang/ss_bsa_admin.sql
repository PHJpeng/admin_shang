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

 Date: 22/08/2020 20:54:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_bsa_admin
-- ----------------------------
DROP TABLE IF EXISTS `ss_bsa_admin`;
CREATE TABLE `ss_bsa_admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `admin_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名字',
  `admin_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '所属角色',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 禁用 1 启用',
  `add_time` datetime(0) NOT NULL COMMENT '添加时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员用户信息\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_bsa_admin
-- ----------------------------
INSERT INTO `ss_bsa_admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '2019-09-03 13:31:20', '2020-08-21 10:30:27', NULL);
INSERT INTO `ss_bsa_admin` VALUES (3, 'dan', 'e10adc3949ba59abbe56e057f20f883e', 19, 1, '0000-00-00 00:00:00', '2020-07-28 14:09:26', NULL);
INSERT INTO `ss_bsa_admin` VALUES (4, 'zhao', 'e10adc3949ba59abbe56e057f20f883e', 5, 1, '0000-00-00 00:00:00', '2020-07-28 14:06:43', NULL);

SET FOREIGN_KEY_CHECKS = 1;
