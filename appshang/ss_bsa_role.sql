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

 Date: 22/08/2020 20:55:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_bsa_role
-- ----------------------------
DROP TABLE IF EXISTS `ss_bsa_role`;
CREATE TABLE `ss_bsa_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_node` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色拥有的权限节点',
  `role_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '角色状态 1 启用 2 禁用',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_bsa_role
-- ----------------------------
INSERT INTO `ss_bsa_role` VALUES (1, '超级管理员', '#', 1);
INSERT INTO `ss_bsa_role` VALUES (5, 'DBA', '1,2,3,22,25,34,35,59,60,36,37,42,43,67', 1);
INSERT INTO `ss_bsa_role` VALUES (6, '研发', '1,2,3,4,5,6,7,8,13,14,15,16,17,18,19,20,21,9,10,11,12,22,25,29,30,31', 1);
INSERT INTO `ss_bsa_role` VALUES (16, '部门经理', '1,2,3,4,5,6,7,8', 1);
INSERT INTO `ss_bsa_role` VALUES (17, '会计', '1,2,3,4,5,6,7,8,13,14,15,16,17,18,19,20,21', 1);
INSERT INTO `ss_bsa_role` VALUES (18, '厂长', '2,3,5,6,7,8,13', 1);
INSERT INTO `ss_bsa_role` VALUES (19, '部门经理11', '1,2,3', 1);

SET FOREIGN_KEY_CHECKS = 1;
