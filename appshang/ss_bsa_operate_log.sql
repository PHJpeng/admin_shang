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

 Date: 22/08/2020 20:55:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_bsa_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `ss_bsa_operate_log`;
CREATE TABLE `ss_bsa_operate_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `operator` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作用户',
  `operator_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作者ip',
  `operate_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作方法',
  `operate_desc` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作简述',
  `operate_time` datetime(0) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_bsa_operate_log
-- ----------------------------
INSERT INTO `ss_bsa_operate_log` VALUES (1, 'admin', '127.0.0.1', 'manager/editadmin', '编辑管理员小白', '2019-10-11 14:19:21');
INSERT INTO `ss_bsa_operate_log` VALUES (2, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限6', '2019-10-11 14:19:37');
INSERT INTO `ss_bsa_operate_log` VALUES (3, 'admin', '127.0.0.1', 'role/edit', '编辑角色研发', '2019-10-11 14:19:40');
INSERT INTO `ss_bsa_operate_log` VALUES (4, 'admin', '127.0.0.1', 'role/edit', '编辑角色：部门经理', '2019-10-11 14:21:33');
INSERT INTO `ss_bsa_operate_log` VALUES (5, 'admin', '127.0.0.1', 'node/edit', '编辑节点：主页', '2019-10-11 14:22:18');
INSERT INTO `ss_bsa_operate_log` VALUES (6, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：6', '2020-06-29 17:42:16');
INSERT INTO `ss_bsa_operate_log` VALUES (7, 'admin', '127.0.0.1', 'node/add', '添加节点：用户管理', '2020-06-29 17:45:49');
INSERT INTO `ss_bsa_operate_log` VALUES (8, 'admin', '127.0.0.1', 'node/add', '添加节点：用户列表', '2020-06-29 17:46:29');
INSERT INTO `ss_bsa_operate_log` VALUES (9, 'admin', '127.0.0.1', 'node/edit', '编辑节点：用户管理', '2020-06-29 17:47:02');
INSERT INTO `ss_bsa_operate_log` VALUES (10, 'admin', '127.0.0.1', 'node/edit', '编辑节点：用户管理', '2020-06-29 17:47:36');
INSERT INTO `ss_bsa_operate_log` VALUES (11, 'admin', '127.0.0.1', 'node/edit', '编辑节点：用户列表', '2020-06-29 17:49:33');
INSERT INTO `ss_bsa_operate_log` VALUES (12, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：6', '2020-06-29 17:50:38');
INSERT INTO `ss_bsa_operate_log` VALUES (13, 'admin', '127.0.0.1', 'manager/addadmin', '添加管理员：admin', '2020-06-30 17:04:35');
INSERT INTO `ss_bsa_operate_log` VALUES (14, 'admin', '127.0.0.1', 'role/add', '添加角色：a', '2020-06-30 17:48:09');
INSERT INTO `ss_bsa_operate_log` VALUES (15, 'admin', '127.0.0.1', 'role/delete', '删除角色：3', '2020-07-01 17:07:49');
INSERT INTO `ss_bsa_operate_log` VALUES (16, 'admin', '127.0.0.1', 'role/add', '添加角色：会计', '2020-07-01 17:08:26');
INSERT INTO `ss_bsa_operate_log` VALUES (17, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：17', '2020-07-01 17:08:45');
INSERT INTO `ss_bsa_operate_log` VALUES (18, 'admin', '127.0.0.1', 'node/edit', '编辑节点：用户管理', '2020-07-02 15:50:41');
INSERT INTO `ss_bsa_operate_log` VALUES (19, 'admin', '127.0.0.1', 'node/delete', '删除节点：25', '2020-07-02 15:51:14');
INSERT INTO `ss_bsa_operate_log` VALUES (20, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：5', '2020-07-03 11:24:45');
INSERT INTO `ss_bsa_operate_log` VALUES (21, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：5', '2020-07-03 11:26:16');
INSERT INTO `ss_bsa_operate_log` VALUES (22, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：5', '2020-07-03 11:28:32');
INSERT INTO `ss_bsa_operate_log` VALUES (23, 'admin', '127.0.0.1', 'node/add', '添加节点：用户编辑', '2020-07-07 15:41:56');
INSERT INTO `ss_bsa_operate_log` VALUES (24, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑用户状态', '2020-07-07 15:42:31');
INSERT INTO `ss_bsa_operate_log` VALUES (25, 'admin', '127.0.0.1', 'node/add', '添加节点：用户财富', '2020-07-07 15:42:53');
INSERT INTO `ss_bsa_operate_log` VALUES (26, 'admin', '127.0.0.1', 'manager/addadmin', '添加管理员：peng', '2020-07-07 15:43:51');
INSERT INTO `ss_bsa_operate_log` VALUES (27, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：5', '2020-07-07 15:44:16');
INSERT INTO `ss_bsa_operate_log` VALUES (28, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：5', '2020-07-07 16:34:56');
INSERT INTO `ss_bsa_operate_log` VALUES (29, 'peng1', '127.0.0.1', 'node/add', '添加节点：用户编辑', '2020-07-07 16:45:23');
INSERT INTO `ss_bsa_operate_log` VALUES (30, 'peng1', '127.0.0.1', 'node/edit', '编辑节点：用户编辑', '2020-07-07 16:45:35');
INSERT INTO `ss_bsa_operate_log` VALUES (31, 'peng1', '127.0.0.1', 'node/add', '添加节点：用户状态', '2020-07-07 16:46:12');
INSERT INTO `ss_bsa_operate_log` VALUES (32, 'peng1', '127.0.0.1', 'node/add', '添加节点：用户财富', '2020-07-07 16:46:33');
INSERT INTO `ss_bsa_operate_log` VALUES (33, 'peng1', '127.0.0.1', 'node/delete', '删除节点：26', '2020-07-07 16:47:11');
INSERT INTO `ss_bsa_operate_log` VALUES (34, 'peng1', '127.0.0.1', 'node/delete', '删除节点：27', '2020-07-07 16:47:15');
INSERT INTO `ss_bsa_operate_log` VALUES (35, 'peng1', '127.0.0.1', 'node/delete', '删除节点：28', '2020-07-07 16:47:18');
INSERT INTO `ss_bsa_operate_log` VALUES (36, 'peng1', '127.0.0.1', 'role/assignauthority', '分配权限：6', '2020-07-07 16:47:32');
INSERT INTO `ss_bsa_operate_log` VALUES (37, 'admin', '127.0.0.1', 'node/add', '添加节点：配置管理', '2020-07-07 18:23:50');
INSERT INTO `ss_bsa_operate_log` VALUES (38, 'admin', '127.0.0.1', 'node/add', '添加节点：配置列表', '2020-07-07 18:25:34');
INSERT INTO `ss_bsa_operate_log` VALUES (39, 'admin', '127.0.0.1', 'node/add', '添加节点：实名认证', '2020-07-08 21:28:42');
INSERT INTO `ss_bsa_operate_log` VALUES (40, 'admin', '127.0.0.1', 'node/edit', '编辑节点：认证管理', '2020-07-08 21:29:10');
INSERT INTO `ss_bsa_operate_log` VALUES (41, 'admin', '127.0.0.1', 'node/add', '添加节点：实名认证', '2020-07-08 21:30:40');
INSERT INTO `ss_bsa_operate_log` VALUES (42, 'admin', '127.0.0.1', 'node/add', '添加节点：财务管理', '2020-07-10 15:36:43');
INSERT INTO `ss_bsa_operate_log` VALUES (43, 'admin', '127.0.0.1', 'node/add', '添加节点：资金记录', '2020-07-10 15:38:30');
INSERT INTO `ss_bsa_operate_log` VALUES (44, 'admin', '127.0.0.1', 'node/add', '添加节点：导出开户', '2020-07-10 15:39:33');
INSERT INTO `ss_bsa_operate_log` VALUES (45, 'admin', '127.0.0.1', 'node/add', '添加节点：自动转账', '2020-07-10 15:40:36');
INSERT INTO `ss_bsa_operate_log` VALUES (46, 'admin', '127.0.0.1', 'node/add', '添加节点：申请打赏', '2020-07-10 15:41:18');
INSERT INTO `ss_bsa_operate_log` VALUES (47, 'admin', '127.0.0.1', 'node/add', '添加节点：申请记录', '2020-07-10 15:41:58');
INSERT INTO `ss_bsa_operate_log` VALUES (48, 'admin', '127.0.0.1', 'node/add', '添加节点：轮播图管理', '2020-07-20 11:15:46');
INSERT INTO `ss_bsa_operate_log` VALUES (49, 'admin', '127.0.0.1', 'node/add', '添加节点：轮播图列表', '2020-07-20 11:16:09');
INSERT INTO `ss_bsa_operate_log` VALUES (50, 'admin', '127.0.0.1', 'node/add', '添加节点：申请高级会员', '2020-07-21 11:13:09');
INSERT INTO `ss_bsa_operate_log` VALUES (51, 'admin', '127.0.0.1', 'node/edit', '编辑节点：申请高级会员', '2020-07-21 11:22:01');
INSERT INTO `ss_bsa_operate_log` VALUES (52, 'admin', '127.0.0.1', 'node/add', '添加节点：商户管理', '2020-07-21 15:31:49');
INSERT INTO `ss_bsa_operate_log` VALUES (53, 'admin', '127.0.0.1', 'node/add', '添加节点：分类列表', '2020-07-21 15:36:07');
INSERT INTO `ss_bsa_operate_log` VALUES (54, 'admin', '127.0.0.1', 'node/add', '添加节点：商家列表', '2020-07-21 15:36:53');
INSERT INTO `ss_bsa_operate_log` VALUES (55, 'admin', '127.0.0.1', 'node/delete', '删除节点：47', '2020-07-21 15:37:08');
INSERT INTO `ss_bsa_operate_log` VALUES (56, 'admin', '127.0.0.1', 'node/add', '添加节点：商家列表', '2020-07-21 15:37:33');
INSERT INTO `ss_bsa_operate_log` VALUES (57, 'admin', '127.0.0.1', 'node/add', '添加节点：商品管理', '2020-07-22 14:20:11');
INSERT INTO `ss_bsa_operate_log` VALUES (58, 'admin', '127.0.0.1', 'node/add', '添加节点：商品分类', '2020-07-22 14:20:43');
INSERT INTO `ss_bsa_operate_log` VALUES (59, 'admin', '127.0.0.1', 'node/add', '添加节点：商品列表', '2020-07-22 14:21:22');
INSERT INTO `ss_bsa_operate_log` VALUES (60, 'admin', '127.0.0.1', 'node/add', '添加节点：订单管理', '2020-07-22 14:21:36');
INSERT INTO `ss_bsa_operate_log` VALUES (61, 'admin', '127.0.0.1', 'node/add', '添加节点：订单列表', '2020-07-22 14:22:57');
INSERT INTO `ss_bsa_operate_log` VALUES (62, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：19', '2020-07-24 17:45:00');
INSERT INTO `ss_bsa_operate_log` VALUES (63, 'admin', '127.0.0.1', 'node/add', '添加节点：配置添加', '2020-07-28 13:36:34');
INSERT INTO `ss_bsa_operate_log` VALUES (64, 'admin', '127.0.0.1', 'node/add', '添加节点：配置修改', '2020-07-28 13:37:13');
INSERT INTO `ss_bsa_operate_log` VALUES (65, 'admin', '127.0.0.1', 'node/add', '添加节点：配置删除', '2020-07-28 13:37:56');
INSERT INTO `ss_bsa_operate_log` VALUES (66, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑配置状态', '2020-07-28 13:38:29');
INSERT INTO `ss_bsa_operate_log` VALUES (67, 'admin', '127.0.0.1', 'node/add', '添加节点：一键审核', '2020-07-28 13:41:06');
INSERT INTO `ss_bsa_operate_log` VALUES (68, 'admin', '127.0.0.1', 'node/add', '添加节点：审核通过', '2020-07-28 13:41:45');
INSERT INTO `ss_bsa_operate_log` VALUES (69, 'admin', '127.0.0.1', 'node/add', '添加节点：审核不通过', '2020-07-28 13:42:11');
INSERT INTO `ss_bsa_operate_log` VALUES (70, 'admin', '127.0.0.1', 'node/add', '添加节点：激活状态', '2020-07-28 13:45:24');
INSERT INTO `ss_bsa_operate_log` VALUES (71, 'admin', '127.0.0.1', 'node/add', '添加节点：冻结状态', '2020-07-28 13:45:49');
INSERT INTO `ss_bsa_operate_log` VALUES (72, 'admin', '127.0.0.1', 'node/add', '添加节点：审核会员', '2020-07-28 13:47:26');
INSERT INTO `ss_bsa_operate_log` VALUES (73, 'admin', '127.0.0.1', 'node/add', '添加节点：新增轮播', '2020-07-28 13:48:29');
INSERT INTO `ss_bsa_operate_log` VALUES (74, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑轮播', '2020-07-28 13:49:02');
INSERT INTO `ss_bsa_operate_log` VALUES (75, 'admin', '127.0.0.1', 'node/add', '添加节点：删除轮播', '2020-07-28 13:49:31');
INSERT INTO `ss_bsa_operate_log` VALUES (76, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑轮播状态', '2020-07-28 13:49:58');
INSERT INTO `ss_bsa_operate_log` VALUES (77, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑分类', '2020-07-28 13:51:38');
INSERT INTO `ss_bsa_operate_log` VALUES (78, 'admin', '127.0.0.1', 'node/add', '添加节点：添加商家', '2020-07-28 13:53:17');
INSERT INTO `ss_bsa_operate_log` VALUES (79, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑商家', '2020-07-28 13:53:42');
INSERT INTO `ss_bsa_operate_log` VALUES (80, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑商家状态', '2020-07-28 13:54:19');
INSERT INTO `ss_bsa_operate_log` VALUES (81, 'admin', '127.0.0.1', 'node/add', '添加节点：删除商家', '2020-07-28 13:54:55');
INSERT INTO `ss_bsa_operate_log` VALUES (82, 'admin', '127.0.0.1', 'node/add', '添加节点：新增分类', '2020-07-28 13:55:58');
INSERT INTO `ss_bsa_operate_log` VALUES (83, 'admin', '127.0.0.1', 'node/add', '添加节点：修改分类', '2020-07-28 13:56:31');
INSERT INTO `ss_bsa_operate_log` VALUES (84, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑状态', '2020-07-28 13:56:59');
INSERT INTO `ss_bsa_operate_log` VALUES (85, 'admin', '127.0.0.1', 'node/add', '添加节点：删除分类', '2020-07-28 13:57:41');
INSERT INTO `ss_bsa_operate_log` VALUES (86, 'admin', '127.0.0.1', 'node/edit', '编辑节点：编辑状态', '2020-07-28 13:57:52');
INSERT INTO `ss_bsa_operate_log` VALUES (87, 'admin', '127.0.0.1', 'node/edit', '编辑节点：编辑状态', '2020-07-28 13:59:45');
INSERT INTO `ss_bsa_operate_log` VALUES (88, 'admin', '127.0.0.1', 'node/add', '添加节点：新增商品', '2020-07-28 14:00:44');
INSERT INTO `ss_bsa_operate_log` VALUES (89, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑商品', '2020-07-28 14:01:06');
INSERT INTO `ss_bsa_operate_log` VALUES (90, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑商品状态', '2020-07-28 14:01:37');
INSERT INTO `ss_bsa_operate_log` VALUES (91, 'admin', '127.0.0.1', 'node/add', '添加节点：删除商品', '2020-07-28 14:02:01');
INSERT INTO `ss_bsa_operate_log` VALUES (92, 'admin', '127.0.0.1', 'node/add', '添加节点：订单详情', '2020-07-28 14:03:10');
INSERT INTO `ss_bsa_operate_log` VALUES (93, 'admin', '127.0.0.1', 'node/add', '添加节点：发货', '2020-07-28 14:03:39');
INSERT INTO `ss_bsa_operate_log` VALUES (94, 'admin', '127.0.0.1', 'role/assignauthority', '分配权限：5', '2020-07-28 14:06:25');
INSERT INTO `ss_bsa_operate_log` VALUES (95, 'admin', '127.0.0.1', 'node/add', '添加节点：任务管理', '2020-07-28 15:12:39');
INSERT INTO `ss_bsa_operate_log` VALUES (96, 'admin', '127.0.0.1', 'node/add', '添加节点：任务列表', '2020-07-28 15:13:04');
INSERT INTO `ss_bsa_operate_log` VALUES (97, 'admin', '127.0.0.1', 'node/add', '添加节点：添加任务', '2020-07-28 15:13:25');
INSERT INTO `ss_bsa_operate_log` VALUES (98, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑任务', '2020-07-28 15:13:45');
INSERT INTO `ss_bsa_operate_log` VALUES (99, 'admin', '127.0.0.1', 'node/add', '添加节点：删除任务', '2020-07-28 16:23:23');
INSERT INTO `ss_bsa_operate_log` VALUES (100, 'admin', '127.0.0.1', 'node/add', '添加节点：编辑任务状态', '2020-07-28 16:23:48');
INSERT INTO `ss_bsa_operate_log` VALUES (101, 'admin', '127.0.0.1', 'node/add', '添加节点：导出新增会员', '2020-08-10 11:30:16');
INSERT INTO `ss_bsa_operate_log` VALUES (102, 'admin', '127.0.0.1', 'node/add', '添加节点：任务奖励记录', '2020-08-19 11:00:31');
INSERT INTO `ss_bsa_operate_log` VALUES (103, 'admin', '127.0.0.1', 'node/add', '添加节点：消息管理', '2020-08-20 11:01:41');
INSERT INTO `ss_bsa_operate_log` VALUES (104, 'admin', '127.0.0.1', 'node/add', '添加节点：消息列表', '2020-08-20 11:02:02');

SET FOREIGN_KEY_CHECKS = 1;
