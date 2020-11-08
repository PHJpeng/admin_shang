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

 Date: 23/08/2020 08:54:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_user_address
-- ----------------------------
DROP TABLE IF EXISTS `ss_user_address`;
CREATE TABLE `ss_user_address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '收货地址ID',
  `uid` int(11) NOT NULL COMMENT '系统用户ID',
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人',
  `mobile` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址名字',
  `address_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '楼号门牌号',
  `detailed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货地址',
  `is_default` tinyint(2) NOT NULL COMMENT '是否是默认地址',
  `addtime` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '添加时间',
  `prerate_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户的地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_user_address
-- ----------------------------
INSERT INTO `ss_user_address` VALUES (2, 12942, '22222', '13333333333', '北京北京市东城区', '1111111111', '1', '1111111111北京北京市东城区1', 0, '1598109573', '');
INSERT INTO `ss_user_address` VALUES (3, 14645, '刘志伟', '13132435522', '河北省衡水市故城县', '建国镇', '1', '建国镇河北省衡水市故城县1', 0, '1598074791', '');
INSERT INTO `ss_user_address` VALUES (4, 17779, '程学文', '17701207310', '北京市北京市丰台区', '东高地小区8号乙门602', '1', '东高地小区8号乙门602北京市北京市丰台区1', 0, '1598079257', '');
INSERT INTO `ss_user_address` VALUES (5, 90817, '可他', '15858585858', '北京市北京市东城区', '邋遢噜噜噜姑', '1', '邋遢噜噜噜姑北京市北京市东城区1', 0, '1598080789', '');
INSERT INTO `ss_user_address` VALUES (6, 15896, '阿比尔且', '13037771163', '江苏省常州市钟楼区', '新庆丰万家福超市', '1', '新庆丰万家福超市江苏省常州市钟楼区1', 0, '1598081247', '');
INSERT INTO `ss_user_address` VALUES (7, 33370, '王晓丽', '15635399996', '山西省太原市万柏林区', '长风西街千峰南路126号保利海德公园', '1', '长风西街千峰南路126号保利海德公园山西省太原市万柏林区1', 0, '1598086980', '');
INSERT INTO `ss_user_address` VALUES (8, 12942, '2222', '13666666666', '北京北京市崇文区', '666666666', '1', '666666666北京北京市崇文区1', 0, '1598089175', '');
INSERT INTO `ss_user_address` VALUES (9, 90818, '回家', '13011111111', '北京市北京市东城区', '你到家', '1', '你到家北京市北京市东城区1', 0, '1598091938', '');
INSERT INTO `ss_user_address` VALUES (10, 16915, '李晓霞', '18235315966', '山西省阳泉市盂  县', '金龙街金龙佳苑', '1', '金龙街金龙佳苑山西省阳泉市盂  县1', 0, '1598097720', '');
INSERT INTO `ss_user_address` VALUES (11, 26223, '郭志伟', '18234850080', '山西省吕梁市临  县', '南通花苑', '1', '南通花苑山西省吕梁市临  县1', 0, '1598106875', '');
INSERT INTO `ss_user_address` VALUES (12, 10570, '付电波', '15105135708', '江苏省连云港市连云区', '江苏省连云港市连云区东辛农场耕耘路西洋社区23区382号', '1', '江苏省连云港市连云区东辛农场耕耘路西洋社区23区382号江苏省连云港市连云区1', 0, '1598123543', '');

SET FOREIGN_KEY_CHECKS = 1;
