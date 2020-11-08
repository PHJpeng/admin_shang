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

 Date: 22/08/2020 22:19:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_money_transfer_detail
-- ----------------------------
DROP TABLE IF EXISTS `ss_money_transfer_detail`;
CREATE TABLE `ss_money_transfer_detail`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'transfer' COMMENT '记录类型',
  `inc_money` decimal(13, 2) NOT NULL DEFAULT 0.00 COMMENT '增加金额',
  `dec_money` decimal(13, 2) NOT NULL DEFAULT 0.00 COMMENT '减少金额',
  `content` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录说明',
  `mtype` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'get_coin' COMMENT '资金种类',
  `over_money` decimal(13, 2) NULL DEFAULT NULL COMMENT '更新之后的金额',
  `datestr` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  `to_leader` tinyint(1) UNSIGNED NULL DEFAULT 2 COMMENT '接收人是否是团长，1：是；2：不是',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否后台添加',
  `admin` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员账号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`uid`, `type`) USING BTREE,
  INDEX `index2`(`uid`, `mtype`) USING BTREE,
  INDEX `index3`(`account`) USING BTREE,
  INDEX `index4`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '转账财务明细表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
