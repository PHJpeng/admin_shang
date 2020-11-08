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

 Date: 22/08/2020 20:54:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_admin_slider
-- ----------------------------
DROP TABLE IF EXISTS `ss_admin_slider`;
CREATE TABLE `ss_admin_slider`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '幻灯ID',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0banner图 1活动专栏 2商学院',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `cover` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '封面图',
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#ff0000' COMMENT '首页banner背景颜色',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '点击链接',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '幻灯切换表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_admin_slider
-- ----------------------------
INSERT INTO `ss_admin_slider` VALUES (6, 0, 'ban1', '/upload/20200821/3f538be94750291204ec77b105dd58ed.jpg', '#5314db', '', 1573651722, 1578137257, 0, 1);
INSERT INTO `ss_admin_slider` VALUES (7, 0, 'ban2', '/upload/20200817/f1d677af0accc8edf787cf0331709b79.jpg', '#7f7171', '', 1573651745, 1586793424, 0, 1);
INSERT INTO `ss_admin_slider` VALUES (10, 0, 'ban5', '/upload/20200817/fa7a93f2e83c5139d57d86e1a8660d83.jpg', '#d26591', '', 1573651853, 1578137209, 0, 1);
INSERT INTO `ss_admin_slider` VALUES (11, 0, 'ban4', '/upload/20200821/2ecb597798c1d5a9639a85d974fc12bb.jpg', '#dca7d9', '', 1576032261, 1586793478, 95, 1);
INSERT INTO `ss_admin_slider` VALUES (12, 0, 'ban8', '/upload/20200817/b1ca8ed301ba49f895b79c8195da3f40.jpg', '#b43c4e', '', 1576032281, 1588410119, 97, 1);
INSERT INTO `ss_admin_slider` VALUES (13, 2, '商城1', '/upload/20200821/0c4007e1d61f9dabf5293a1f366e3f09.jpg', '#3e176e', '', 1578861689, 1588410033, 98, 1);
INSERT INTO `ss_admin_slider` VALUES (14, 2, '商城2', '/upload/20200817/602835540b647ec5cff09aba55127289.jpg', '#8e5757', '', 1578861741, 1588410025, 99, 1);
INSERT INTO `ss_admin_slider` VALUES (15, 2, '商城3', '/upload/20200815/123c0d2131f6bb0a41ef739d54236e1a.jpg', '#a33838', '', 1597470694, 0, 10, 1);
INSERT INTO `ss_admin_slider` VALUES (16, 2, '商城4', '/upload/20200821/51911399244fd9f100c4e7942a76337a.jpg', '#7e7272', 'qq', 1598019268, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
