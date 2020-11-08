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

 Date: 22/08/2020 22:21:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_shop_type
-- ----------------------------
DROP TABLE IF EXISTS `ss_shop_type`;
CREATE TABLE `ss_shop_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `cover` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '封面图',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_shop_type
-- ----------------------------
INSERT INTO `ss_shop_type` VALUES (1, '活动类', '/upload/20200815/e5872811e362afd021c87a3e500a2990.jpg', 1571041359, 1588398415, 0, 1);
INSERT INTO `ss_shop_type` VALUES (2, '企业类', '/upload/20200815/080bd796e3884c9232387a9c4acdcd60.jpg', 1571041436, 1588398402, 0, 1);
INSERT INTO `ss_shop_type` VALUES (3, '经济类', '/upload/20200815/5cf2fabff602b2a21d8838c4a6a95289.jpg', 1571041453, 1588763990, 0, 1);
INSERT INTO `ss_shop_type` VALUES (4, '美容类', '/upload/20200815/ab85a8eaf47b5da41504bf452799fa9a.jpg', 1571041469, 1588398374, 0, 1);
INSERT INTO `ss_shop_type` VALUES (5, '保健类', '/upload/20200815/00299453e0c1f7b9bfc011ab74e220c0.jpg', 1571041488, 1588763895, 0, 1);
INSERT INTO `ss_shop_type` VALUES (6, '电商类', '/upload/20200815/e7e605155f2d08d444af5024a956cc1c.jpg', 1571041510, 1588398348, 0, 1);
INSERT INTO `ss_shop_type` VALUES (7, '地产类', '/upload/20200815/f28e846d7889be7257889cb138c738b7.jpg', 1571041526, 1588398329, 0, 1);
INSERT INTO `ss_shop_type` VALUES (8, '酒店类', '/upload/20200815/42e491f9c33f381fec4e2016d69e53a6.jpg', 1571041541, 1588398305, 0, 1);
INSERT INTO `ss_shop_type` VALUES (9, '新媒类', '/upload/20200815/ba9bb5325ae9197b69e641019bda6397.jpg', 1571041559, 1588398292, 0, 1);
INSERT INTO `ss_shop_type` VALUES (10, '新奇类', '/upload/20200815/26596e552d3ebcc2d2919886d31251cc.jpg', 1571041578, 1588398275, 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
