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

 Date: 22/08/2020 21:51:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_goods_cate
-- ----------------------------
DROP TABLE IF EXISTS `ss_goods_cate`;
CREATE TABLE `ss_goods_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父id',
  `cate_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品分类名称',
  `cate_sort` int(5) UNSIGNED NOT NULL COMMENT '商品分类排序',
  `cate_status` tinyint(2) NOT NULL COMMENT '商品分类状态',
  `cate_create_time` int(11) UNSIGNED NOT NULL COMMENT '商品分类创建时间',
  `cate_cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封面图s',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_name_UNIQUE`(`cate_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_goods_cate
-- ----------------------------
INSERT INTO `ss_goods_cate` VALUES (1, 0, '美妆护肤', 0, 1, 1587554290, '/upload/20200817/a552d4f0f3c519fd36d13d2ea138403a.jpg');
INSERT INTO `ss_goods_cate` VALUES (2, 1, '口红', 0, 1, 1587554311, '/upload/20200815/309e16f42d1322530aaedbcc61132730.jpg');
INSERT INTO `ss_goods_cate` VALUES (3, 1, '美白', 0, 1, 1587554328, '/upload/20200817/61d7bc60116596362c13759ab37c27d1.jpg');
INSERT INTO `ss_goods_cate` VALUES (4, 1, '防晒', 0, 1, 1587554370, '/upload/20200817/9ed90f73d097dacd110df762110c388e.jpg');
INSERT INTO `ss_goods_cate` VALUES (5, 1, '护肤套装', 0, 1, 1587554407, '/upload/20200817/e44006e4dea99c7ef9ca4062314385d5.jpg');
INSERT INTO `ss_goods_cate` VALUES (6, 1, '面膜', 0, 1, 1587554426, '/upload/20200817/2dc3d8bcce5cb32e97276d8f2fe501b3.jpg');
INSERT INTO `ss_goods_cate` VALUES (7, 1, '面霜', 0, 1, 1587554671, '/upload/20200817/70be331ba8ed575bcb74bf8b8667b25e.jpg');
INSERT INTO `ss_goods_cate` VALUES (8, 1, '卸妆', 0, 1, 1587554688, '/upload/20200817/06712a3394d9b02f60855cc19eb93d31.jpg');
INSERT INTO `ss_goods_cate` VALUES (9, 0, '个人护理', 0, 1, 1587554810, '/upload/20200817/f950c4a3eefbc153334672f5c6383d4b.jpg');
INSERT INTO `ss_goods_cate` VALUES (10, 9, '洗手液', 0, 1, 1587554844, '/upload/20200817/e2918f35e1b077bee3bd8ef2bd844d0c.png');
INSERT INTO `ss_goods_cate` VALUES (11, 9, '漱口水', 0, 1, 1587554864, '16962');
INSERT INTO `ss_goods_cate` VALUES (15, 9, '牙膏', 0, 1, 1587555032, '16984');
INSERT INTO `ss_goods_cate` VALUES (16, 9, '止汗露', 0, 1, 1587555050, '16985');
INSERT INTO `ss_goods_cate` VALUES (17, 0, '电脑办公', 0, 1, 1587555199, '16986');
INSERT INTO `ss_goods_cate` VALUES (18, 17, '平板电脑', 0, 1, 1587555242, '16987');
INSERT INTO `ss_goods_cate` VALUES (19, 17, '鼠标', 0, 1, 1587555264, '16988');
INSERT INTO `ss_goods_cate` VALUES (20, 17, '投影仪', 0, 1, 1587555282, '16989');
INSERT INTO `ss_goods_cate` VALUES (21, 17, '显卡', 0, 1, 1587555300, '16964');
INSERT INTO `ss_goods_cate` VALUES (22, 17, '显示器', 0, 1, 1587555721, '16965');
INSERT INTO `ss_goods_cate` VALUES (23, 17, '主机', 0, 1, 1587555735, '16966');
INSERT INTO `ss_goods_cate` VALUES (24, 0, '家用电器', 0, 1, 1587555993, '16836');
INSERT INTO `ss_goods_cate` VALUES (25, 24, '冰箱', 0, 1, 1587556097, '16835');
INSERT INTO `ss_goods_cate` VALUES (26, 24, '电视', 0, 1, 1587556121, '16967');
INSERT INTO `ss_goods_cate` VALUES (27, 24, '空调', 0, 1, 1587556136, '16968');
INSERT INTO `ss_goods_cate` VALUES (28, 24, '商用电视', 0, 1, 1587556200, '16970');
INSERT INTO `ss_goods_cate` VALUES (29, 24, '台式空调', 0, 0, 1587556224, '16969');
INSERT INTO `ss_goods_cate` VALUES (30, 24, '洗衣机', 0, 1, 1587556240, '16971');
INSERT INTO `ss_goods_cate` VALUES (38, 0, '母婴用品', 0, 1, 1587556649, '16983');
INSERT INTO `ss_goods_cate` VALUES (39, 38, '口水巾', 0, 1, 1587556666, '16820');
INSERT INTO `ss_goods_cate` VALUES (40, 38, '米粉', 0, 1, 1587556704, '16972');
INSERT INTO `ss_goods_cate` VALUES (41, 38, '奶粉', 0, 1, 1587557236, '16827');
INSERT INTO `ss_goods_cate` VALUES (42, 38, '奶瓶', 0, 1, 1587557278, '16973');
INSERT INTO `ss_goods_cate` VALUES (43, 38, '腰凳', 0, 1, 1587557295, '16974');
INSERT INTO `ss_goods_cate` VALUES (44, 38, '枕头', 0, 1, 1587557315, '16975');
INSERT INTO `ss_goods_cate` VALUES (45, 0, '生鲜食品', 0, 1, 1587557677, '16826');
INSERT INTO `ss_goods_cate` VALUES (46, 45, '坚果', 0, 1, 1587557744, '16821');
INSERT INTO `ss_goods_cate` VALUES (47, 45, '咖啡', 0, 1, 1587557823, '16822');
INSERT INTO `ss_goods_cate` VALUES (48, 45, '膨化食品', 0, 1, 1587557843, '16823');
INSERT INTO `ss_goods_cate` VALUES (49, 45, '巧克力', 0, 1, 1587557873, '16824');
INSERT INTO `ss_goods_cate` VALUES (50, 45, '月饼', 0, 1, 1587557889, '16825');
INSERT INTO `ss_goods_cate` VALUES (51, 45, '粽子', 0, 1, 1587557973, '16817');
INSERT INTO `ss_goods_cate` VALUES (52, 0, '数码设备', 0, 1, 1587558085, '16976');
INSERT INTO `ss_goods_cate` VALUES (53, 52, '充电头', 0, 1, 1587558106, '16977');
INSERT INTO `ss_goods_cate` VALUES (54, 52, '耳机', 0, 1, 1587558127, '16979');
INSERT INTO `ss_goods_cate` VALUES (55, 52, '头戴耳机', 0, 1, 1587558160, '16978');
INSERT INTO `ss_goods_cate` VALUES (56, 52, '手机', 0, 1, 1587558181, '16833');
INSERT INTO `ss_goods_cate` VALUES (57, 52, '手机壳', 0, 1, 1587558206, '16980');
INSERT INTO `ss_goods_cate` VALUES (58, 52, '手机支架', 0, 1, 1587558221, '16981');
INSERT INTO `ss_goods_cate` VALUES (66, 0, '服装鞋子', 0, 1, 1588132152, '16819');
INSERT INTO `ss_goods_cate` VALUES (67, 66, '服装', 0, 1, 1588132523, '16818');
INSERT INTO `ss_goods_cate` VALUES (68, 66, '鞋子', 0, 1, 1588132553, '16830');
INSERT INTO `ss_goods_cate` VALUES (69, 66, '首饰', 0, 1, 1588138377, '16982');
INSERT INTO `ss_goods_cate` VALUES (70, 24, '早餐机', 0, 1, 1588138541, '16828');
INSERT INTO `ss_goods_cate` VALUES (71, 38, '纸尿裤', 0, 1, 1588138649, '16831');
INSERT INTO `ss_goods_cate` VALUES (73, 45, '小龙虾', 0, 1, 1588138867, '16832');

SET FOREIGN_KEY_CHECKS = 1;
