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

 Date: 22/08/2020 20:54:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_admin_posttype
-- ----------------------------
DROP TABLE IF EXISTS `ss_admin_posttype`;
CREATE TABLE `ss_admin_posttype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可用 0不可用 1可用',
  `is_system` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否系统内置 0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_admin_posttype
-- ----------------------------
INSERT INTO `ss_admin_posttype` VALUES (1, '赚钱攻略', 1570435003, 1571133576, 0, 1, 1);
INSERT INTO `ss_admin_posttype` VALUES (6, '打赏赚钱', 1571133588, 1571133588, 0, 1, 1);
INSERT INTO `ss_admin_posttype` VALUES (7, '合伙赚钱', 1571133599, 1571133599, 0, 1, 1);
INSERT INTO `ss_admin_posttype` VALUES (8, '保存平台', 1571133622, 1571133622, 0, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
