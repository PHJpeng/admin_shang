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

 Date: 22/08/2020 20:54:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_agreement_type
-- ----------------------------
DROP TABLE IF EXISTS `ss_agreement_type`;
CREATE TABLE `ss_agreement_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可用 0不可用 1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '协议分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_agreement_type
-- ----------------------------
INSERT INTO `ss_agreement_type` VALUES (1, '用户协议', 1587535102, 1587535102, 1);
INSERT INTO `ss_agreement_type` VALUES (2, '隐私协议', 1587535115, 1587535115, 1);

SET FOREIGN_KEY_CHECKS = 1;
