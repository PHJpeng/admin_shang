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

 Date: 22/08/2020 22:19:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_order
-- ----------------------------
DROP TABLE IF EXISTS `ss_order`;
CREATE TABLE `ss_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_uid` int(11) NOT NULL COMMENT '买入uid',
  `buy_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买入账号',
  `buy_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买入手机号',
  `buy_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买入真实姓名',
  `num` decimal(14, 2) NOT NULL COMMENT '买入数量',
  `sell_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出售者账号',
  `sell_uid` int(11) NOT NULL COMMENT '出售者uid',
  `sell_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出售者手机号',
  `sell_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出售者真实姓名',
  `ali_code` int(11) NOT NULL DEFAULT 0 COMMENT '支付宝收款二维码',
  `zhifubao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付宝收款账户',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0待打款 1待收款 2已完成 3超时未打款',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `pay_time` int(11) NOT NULL DEFAULT 0 COMMENT '打款时间',
  `over_time` int(11) NOT NULL COMMENT '完成时间',
  `pay_img` int(255) NOT NULL DEFAULT 0 COMMENT '支付凭证',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
