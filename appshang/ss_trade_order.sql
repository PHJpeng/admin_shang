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

 Date: 23/08/2020 08:54:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_trade_order
-- ----------------------------
DROP TABLE IF EXISTS `ss_trade_order`;
CREATE TABLE `ss_trade_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL COMMENT '昵称',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `type` tinyint(1) NOT NULL COMMENT '类型 0购买 1卖出',
  `num` decimal(12, 2) NOT NULL COMMENT '购买数量',
  `img` int(11) NOT NULL DEFAULT 0 COMMENT '打款凭证',
  `status` tinyint(1) NOT NULL COMMENT '状态 0待处理 1已完成 2已拒绝',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `finsh_time` int(11) NOT NULL DEFAULT 0 COMMENT '完成时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `alipay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付宝',
  `pay_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
