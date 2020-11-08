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

 Date: 22/08/2020 21:53:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_level_status
-- ----------------------------
DROP TABLE IF EXISTS `ss_level_status`;
CREATE TABLE `ss_level_status`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员uid',
  `status` tinyint(1) NOT NULL COMMENT '会员处理状态   1未处理  2同意  3拒绝',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_index`(`uid`) USING BTREE COMMENT '用户唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请高级会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_level_status
-- ----------------------------
INSERT INTO `ss_level_status` VALUES (1, 26830, 1, 1598081365);

SET FOREIGN_KEY_CHECKS = 1;
