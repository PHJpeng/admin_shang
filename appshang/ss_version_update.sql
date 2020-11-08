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

 Date: 23/08/2020 08:55:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_version_update
-- ----------------------------
DROP TABLE IF EXISTS `ss_version_update`;
CREATE TABLE `ss_version_update`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '版本更新id',
  `version_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '版本号',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '版本路径',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '版本更新表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_version_update
-- ----------------------------
INSERT INTO `ss_version_update` VALUES (1, '100', '/uploads/apk/__UNI__566DC4B_0423163148.apk', 1587479014);
INSERT INTO `ss_version_update` VALUES (2, '101', '/uploads/apk/__UNI__72BF552_0501171445.apk', 1587480706);
INSERT INTO `ss_version_update` VALUES (3, '102', '/uploads/apk/__UNI__72BF552_0503181046.apk', 1588501956);
INSERT INTO `ss_version_update` VALUES (4, '103', '/uploads/apk/__UNI__72BF552_0506184517.apk', 1588762531);
INSERT INTO `ss_version_update` VALUES (5, '104', '/uploads/apk/__UNI__72BF552_0516161157.apk', 1589618297);
INSERT INTO `ss_version_update` VALUES (6, '106', '/uploads/apk/__UNI__72BF552_0804152544.apk', 1596770986);

SET FOREIGN_KEY_CHECKS = 1;
