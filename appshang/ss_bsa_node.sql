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

 Date: 22/08/2020 20:54:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_bsa_node
-- ----------------------------
DROP TABLE IF EXISTS `ss_bsa_node`;
CREATE TABLE `ss_bsa_node`  (
  `node_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `node_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '节点名称',
  `node_path` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '节点路径',
  `node_pid` int(11) NOT NULL COMMENT '所属节点',
  `node_icon` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点图标',
  `is_menu` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否是菜单项 1 不是 2 是',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`node_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '方法控制器表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_bsa_node
-- ----------------------------
INSERT INTO `ss_bsa_node` VALUES (1, '主页', '#', 0, 'layui-icon layui-icon-home', 2, '2019-09-03 14:17:38');
INSERT INTO `ss_bsa_node` VALUES (2, '后台首页', 'index/index', 1, '', 1, '2019-09-03 14:18:24');
INSERT INTO `ss_bsa_node` VALUES (3, '修改密码', 'index/editpwd', 1, '', 1, '2019-09-03 14:19:03');
INSERT INTO `ss_bsa_node` VALUES (4, '权限管理', '#', 0, 'layui-icon layui-icon-template', 2, '2019-09-03 14:19:34');
INSERT INTO `ss_bsa_node` VALUES (5, '管理员管理', 'manager/index', 4, '', 2, '2019-09-03 14:27:42');
INSERT INTO `ss_bsa_node` VALUES (6, '添加管理员', 'manager/addadmin', 5, '', 1, '2019-09-03 14:28:26');
INSERT INTO `ss_bsa_node` VALUES (7, '编辑管理员', 'manager/editadmin', 5, '', 1, '2019-09-03 14:28:43');
INSERT INTO `ss_bsa_node` VALUES (8, '删除管理员', 'manager/deladmin', 5, '', 1, '2019-09-03 14:29:14');
INSERT INTO `ss_bsa_node` VALUES (9, '日志管理', '#', 0, 'layui-icon layui-icon-template-1', 2, '2019-10-08 16:07:36');
INSERT INTO `ss_bsa_node` VALUES (10, '系统日志', 'log/system', 9, '', 2, '2019-10-08 16:24:55');
INSERT INTO `ss_bsa_node` VALUES (11, '登录日志', 'log/login', 9, '', 2, '2019-10-08 16:26:27');
INSERT INTO `ss_bsa_node` VALUES (12, '操作日志', 'log/operate', 9, '', 2, '2019-10-08 17:02:10');
INSERT INTO `ss_bsa_node` VALUES (13, '角色管理', 'role/index', 4, '', 2, '2019-10-09 21:35:54');
INSERT INTO `ss_bsa_node` VALUES (14, '添加角色', 'role/add', 13, '', 1, '2019-10-09 21:40:06');
INSERT INTO `ss_bsa_node` VALUES (15, '编辑角色', 'role/edit', 13, '', 1, '2019-10-09 21:40:53');
INSERT INTO `ss_bsa_node` VALUES (16, '删除角色', 'role/delete', 13, '', 1, '2019-10-09 21:41:07');
INSERT INTO `ss_bsa_node` VALUES (17, '权限分配', 'role/assignauthority', 13, '', 1, '2019-10-09 21:41:38');
INSERT INTO `ss_bsa_node` VALUES (18, '节点管理', 'node/index', 4, '', 2, '2019-10-09 21:42:06');
INSERT INTO `ss_bsa_node` VALUES (19, '添加节点', 'node/add', 18, '', 1, '2019-10-09 21:42:51');
INSERT INTO `ss_bsa_node` VALUES (20, '编辑节点', 'node/edit', 18, '', 1, '2019-10-09 21:43:29');
INSERT INTO `ss_bsa_node` VALUES (21, '删除节点', 'node/delete', 18, '', 1, '2019-10-09 21:43:44');
INSERT INTO `ss_bsa_node` VALUES (22, '用户管理', '#', 0, 'layui-icon layui-icon-user', 2, '2020-06-29 17:45:49');
INSERT INTO `ss_bsa_node` VALUES (25, '用户列表', 'users/index', 22, '', 2, '2020-07-03 10:44:22');
INSERT INTO `ss_bsa_node` VALUES (29, '用户编辑', 'users/edit', 25, '', 1, '2020-07-07 16:45:23');
INSERT INTO `ss_bsa_node` VALUES (30, '用户状态', 'users/status', 25, '', 1, '2020-07-07 16:46:12');
INSERT INTO `ss_bsa_node` VALUES (31, '用户财富', 'users/store', 25, '', 1, '2020-07-07 16:46:33');
INSERT INTO `ss_bsa_node` VALUES (32, '配置管理', '#', 0, 'layui-icon layui-icon-set', 2, '2020-07-07 18:23:50');
INSERT INTO `ss_bsa_node` VALUES (33, '配置列表', 'adminconfig/index', 32, '', 2, '2020-07-07 18:25:34');
INSERT INTO `ss_bsa_node` VALUES (34, '认证管理', '#', 0, 'layui-icon layui-icon-auz', 2, '2020-07-08 21:28:42');
INSERT INTO `ss_bsa_node` VALUES (35, '实名认证', 'Realname/index', 34, '', 2, '2020-07-08 21:30:40');
INSERT INTO `ss_bsa_node` VALUES (36, '财务管理', '#', 0, 'layui-icon layui-icon-rmb', 2, '2020-07-10 15:36:43');
INSERT INTO `ss_bsa_node` VALUES (37, '资金记录', 'moneydetaile/index', 36, '', 2, '2020-07-10 15:38:30');
INSERT INTO `ss_bsa_node` VALUES (38, '导出开户', 'moneydetaile/export', 36, '', 2, '2020-07-10 15:39:33');
INSERT INTO `ss_bsa_node` VALUES (39, '自动转账', 'moneydetaile/automatic', 36, '', 2, '2020-07-10 15:40:36');
INSERT INTO `ss_bsa_node` VALUES (40, '申请打赏', 'moneydetaile/applyreward', 36, '', 2, '2020-07-10 15:41:18');
INSERT INTO `ss_bsa_node` VALUES (41, '申请记录', 'moneydetaile/applyjilu', 36, '', 2, '2020-07-10 15:41:58');
INSERT INTO `ss_bsa_node` VALUES (42, '轮播图管理', '#', 0, 'layui-icon layui-icon-carousel', 2, '2020-07-20 11:15:46');
INSERT INTO `ss_bsa_node` VALUES (43, '轮播图列表', 'banner/index', 42, '', 2, '2020-07-20 11:16:09');
INSERT INTO `ss_bsa_node` VALUES (44, '申请高级会员', 'moneydetaile/userlevel', 36, '', 2, '2020-07-21 11:13:09');
INSERT INTO `ss_bsa_node` VALUES (45, '商户管理', '#', 0, '', 2, '2020-07-21 15:31:49');
INSERT INTO `ss_bsa_node` VALUES (46, '分类列表', 'merchant/shoptype', 45, '', 2, '2020-07-21 15:36:07');
INSERT INTO `ss_bsa_node` VALUES (48, '商家列表', 'merchant/shoplist', 45, '', 2, '2020-07-21 15:37:33');
INSERT INTO `ss_bsa_node` VALUES (49, '商品管理', '#', 0, '', 2, '2020-07-22 14:20:11');
INSERT INTO `ss_bsa_node` VALUES (50, '商品分类', 'goods/goodcate', 49, '', 2, '2020-07-22 14:20:43');
INSERT INTO `ss_bsa_node` VALUES (51, '商品列表', 'goods/goodlist', 49, '', 2, '2020-07-22 14:21:22');
INSERT INTO `ss_bsa_node` VALUES (52, '订单管理', '#', 0, '', 2, '2020-07-22 14:21:36');
INSERT INTO `ss_bsa_node` VALUES (53, '订单列表', 'order/orderlist', 52, '', 2, '2020-07-22 14:22:57');
INSERT INTO `ss_bsa_node` VALUES (54, '配置添加', 'adminconfig/add', 33, '', 1, '2020-07-28 13:36:34');
INSERT INTO `ss_bsa_node` VALUES (55, '配置修改', 'adminconfig/edit', 33, '', 1, '2020-07-28 13:37:13');
INSERT INTO `ss_bsa_node` VALUES (56, '配置删除', 'adminconfig/delete', 33, '', 1, '2020-07-28 13:37:56');
INSERT INTO `ss_bsa_node` VALUES (57, '编辑配置状态', 'adminconfig/status', 33, '', 1, '2020-07-28 13:38:29');
INSERT INTO `ss_bsa_node` VALUES (58, '一键审核', 'realname/yijianshenhe', 35, '', 1, '2020-07-28 13:41:06');
INSERT INTO `ss_bsa_node` VALUES (59, '审核通过', 'realname/shenhe', 35, '', 1, '2020-07-28 13:41:45');
INSERT INTO `ss_bsa_node` VALUES (60, '审核不通过', 'realname/noshenhe', 35, '', 1, '2020-07-28 13:42:11');
INSERT INTO `ss_bsa_node` VALUES (61, '激活状态', 'moneydetaile/jihuo', 40, '', 1, '2020-07-28 13:45:24');
INSERT INTO `ss_bsa_node` VALUES (62, '冻结状态', 'moneydetaile/dongjie', 40, '', 1, '2020-07-28 13:45:49');
INSERT INTO `ss_bsa_node` VALUES (63, '审核会员', 'moneydetaile/level', 44, '', 1, '2020-07-28 13:47:26');
INSERT INTO `ss_bsa_node` VALUES (64, '新增轮播', 'banner/add', 43, '', 1, '2020-07-28 13:48:29');
INSERT INTO `ss_bsa_node` VALUES (65, '编辑轮播', 'banner/edit', 43, '', 1, '2020-07-28 13:49:02');
INSERT INTO `ss_bsa_node` VALUES (66, '删除轮播', 'banner/delete', 43, '', 1, '2020-07-28 13:49:31');
INSERT INTO `ss_bsa_node` VALUES (67, '编辑轮播状态', 'banner/status', 43, '', 1, '2020-07-28 13:49:58');
INSERT INTO `ss_bsa_node` VALUES (68, '编辑分类', 'merchant/shoptypestatus', 46, '', 1, '2020-07-28 13:51:38');
INSERT INTO `ss_bsa_node` VALUES (69, '添加商家', 'merchant/shopadd', 48, '', 1, '2020-07-28 13:53:17');
INSERT INTO `ss_bsa_node` VALUES (70, '编辑商家', 'merchant/shopedit', 48, '', 1, '2020-07-28 13:53:42');
INSERT INTO `ss_bsa_node` VALUES (71, '编辑商家状态', 'merchant/shopstatus', 48, '', 1, '2020-07-28 13:54:19');
INSERT INTO `ss_bsa_node` VALUES (72, '删除商家', 'merchant/shopdelete', 48, '', 1, '2020-07-28 13:54:55');
INSERT INTO `ss_bsa_node` VALUES (73, '新增分类', 'goods/goodcateadd', 50, '', 1, '2020-07-28 13:55:58');
INSERT INTO `ss_bsa_node` VALUES (74, '修改分类', 'goods/goodcateedit', 50, '', 1, '2020-07-28 13:56:31');
INSERT INTO `ss_bsa_node` VALUES (75, '编辑状态', 'goods/goodcatestatus', 50, '', 1, '2020-07-28 13:56:59');
INSERT INTO `ss_bsa_node` VALUES (76, '删除分类', 'goods/goodcatedelete', 50, '', 1, '2020-07-28 13:57:41');
INSERT INTO `ss_bsa_node` VALUES (77, '新增商品', 'goods/goodadd', 51, '', 1, '2020-07-28 14:00:44');
INSERT INTO `ss_bsa_node` VALUES (78, '编辑商品', 'goods/goodedit', 51, '', 1, '2020-07-28 14:01:06');
INSERT INTO `ss_bsa_node` VALUES (79, '编辑商品状态', 'goods/goodstatus', 51, '', 1, '2020-07-28 14:01:37');
INSERT INTO `ss_bsa_node` VALUES (80, '删除商品', 'goods/gooddelete', 51, '', 1, '2020-07-28 14:02:01');
INSERT INTO `ss_bsa_node` VALUES (81, '订单详情', 'order/orderdetaile', 53, '', 1, '2020-07-28 14:03:10');
INSERT INTO `ss_bsa_node` VALUES (82, '发货', 'order/ordersent', 53, '', 1, '2020-07-28 14:03:39');
INSERT INTO `ss_bsa_node` VALUES (83, '任务管理', '#', 0, '', 2, '2020-07-28 15:12:39');
INSERT INTO `ss_bsa_node` VALUES (84, '任务列表', 'task/index', 83, '', 2, '2020-07-28 15:13:04');
INSERT INTO `ss_bsa_node` VALUES (85, '添加任务', 'task/add', 84, '', 1, '2020-07-28 15:13:25');
INSERT INTO `ss_bsa_node` VALUES (86, '编辑任务', 'task/edit', 84, '', 1, '2020-07-28 15:13:45');
INSERT INTO `ss_bsa_node` VALUES (87, '删除任务', 'task/delete', 84, '', 1, '2020-07-28 16:23:23');
INSERT INTO `ss_bsa_node` VALUES (88, '编辑任务状态', 'task/status', 84, '', 1, '2020-07-28 16:23:48');
INSERT INTO `ss_bsa_node` VALUES (89, '任务奖励记录', 'task/taskdetail', 83, '', 2, '2020-08-19 11:32:48');
INSERT INTO `ss_bsa_node` VALUES (90, '消息管理', '#', 0, '', 2, '2020-08-20 11:49:34');
INSERT INTO `ss_bsa_node` VALUES (91, '消息列表', 'notice/index', 90, '', 2, '2020-08-20 11:49:56');
INSERT INTO `ss_bsa_node` VALUES (92, '导出高级会员', 'moneydetaile/levelexport', 36, '', 2, '2020-08-20 17:52:58');

SET FOREIGN_KEY_CHECKS = 1;
