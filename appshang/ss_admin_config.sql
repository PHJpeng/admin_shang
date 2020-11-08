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

 Date: 22/08/2020 20:53:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `ss_admin_config`;
CREATE TABLE `ss_admin_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值',
  `group` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分组',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_admin_config
-- ----------------------------
INSERT INTO `ss_admin_config` VALUES (1, '站点开关', 'TOGGLE_WEB_SITE', '1', 1, 'toggle', '0:关闭\r\n1:开启', '站点关闭后将不能访问', 1378898976, 1406992386, 1, 1);
INSERT INTO `ss_admin_config` VALUES (2, '网站标题', 'WEB_SITE_TITLE', '赏头条', 1, 'text', '', '网站标题前台显示标题', 1378898976, 1379235274, 4, 1);
INSERT INTO `ss_admin_config` VALUES (3, '网站口号', 'WEB_SITE_SLOGAN', '赏头条', 1, 'text', '', '网站口号、宣传标语、一句话介绍', 1434081649, 1434081649, 4, 1);
INSERT INTO `ss_admin_config` VALUES (4, '网站LOGO', 'WEB_SITE_LOGO', '', 1, 'picture', '', '网站LOGO', 1407003397, 1407004692, 5, 1);
INSERT INTO `ss_admin_config` VALUES (5, '网站反色LOGO', 'WEB_SITE_LOGO_INVERSE', '', 1, 'picture', '', '匹配深色背景上的LOGO', 1476700797, 1476700797, 6, 1);
INSERT INTO `ss_admin_config` VALUES (6, '网站描述', 'WEB_SITE_DESCRIPTION', '赏头条', 1, 'textarea', '', '网站搜索引擎描述', 1378898976, 1379235841, 7, 1);
INSERT INTO `ss_admin_config` VALUES (7, '网站关键字', 'WEB_SITE_KEYWORD', '赏头条', 1, 'textarea', '', '网站搜索引擎关键字', 1378898976, 1381390100, 8, 1);
INSERT INTO `ss_admin_config` VALUES (8, '版权信息', 'WEB_SITE_COPYRIGHT', '', 1, 'text', '', '设置在网站底部显示的版权信息，如“版权所有 © 2014-2015 xxx网络科技”', 1406991855, 1406992583, 9, 1);
INSERT INTO `ss_admin_config` VALUES (9, '网站备案号', 'WEB_SITE_ICP', '', 1, 'text', '', '设置在网站底部显示的备案号，如“粤ICP备15028888号\"', 1378900335, 1415983236, 10, 1);
INSERT INTO `ss_admin_config` VALUES (10, '站点统计', 'WEB_SITE_STATISTICS', '', 1, 'textarea', '', '支持百度、Google、cnzz等所有Javascript的统计代码', 1378900335, 1415983236, 11, 1);
INSERT INTO `ss_admin_config` VALUES (11, '公司名称', 'COMPANY_TITLE', 'XXX有限公司', 3, 'text', '', '', 1481014715, 1481014715, 1, 1);
INSERT INTO `ss_admin_config` VALUES (12, '公司地址', 'COMPANY_ADDRESS', 'XXXX', 3, 'text', '', '', 1481014768, 1481014768, 2, 1);
INSERT INTO `ss_admin_config` VALUES (13, '公司邮箱', 'COMPANY_EMAIL', '8888888@qq.com', 3, 'text', '', '', 1481014914, 1481014914, 3, 1);
INSERT INTO `ss_admin_config` VALUES (14, '公司电话', 'COMPANY_PHONE', '400-888-8888', 3, 'text', '', '', 1481014961, 1481014961, 4, 1);
INSERT INTO `ss_admin_config` VALUES (15, '公司QQ', 'COMPANY_QQ', '8888888', 3, 'text', '', '', 1481015016, 1481015016, 5, 1);
INSERT INTO `ss_admin_config` VALUES (16, '公司QQ群', 'COMPANY_QQQUN', '8888888', 3, 'text', '', '', 1481015198, 1481015198, 6, 1);
INSERT INTO `ss_admin_config` VALUES (17, '网站二维码', 'QR_CODE', '', 3, 'picture', '', '', 1481009623, 1481009623, 7, 1);
INSERT INTO `ss_admin_config` VALUES (18, 'IOS二维码', 'QR_IOS', '', 3, 'picture', '', '', 1481009623, 1481009623, 8, 1);
INSERT INTO `ss_admin_config` VALUES (19, '支付宝二维码', 'QR_ANDROID', '', 3, 'picture', '', '', 1481009921, 1481009921, 9, 1);
INSERT INTO `ss_admin_config` VALUES (20, '客服二维码', 'QR_WEIXIN', '1704', 3, 'picture', '', '', 1481009959, 1481009959, 20, 1);
INSERT INTO `ss_admin_config` VALUES (21, '文件上传大小', 'UPLOAD_FILE_SIZE', '20', 5, 'num', '', '文件上传大小单位：MB', 1428681031, 1428681031, 1, 1);
INSERT INTO `ss_admin_config` VALUES (22, '图片上传大小', 'UPLOAD_IMAGE_SIZE', '10', 5, 'num', '', '图片上传大小单位：MB', 1428681071, 1428681071, 2, 1);
INSERT INTO `ss_admin_config` VALUES (23, '后台多标签', 'ADMIN_TABS', '0', 5, 'toggle', '0:关闭\r\n1:开启', '', 1453445526, 1453445526, 3, 1);
INSERT INTO `ss_admin_config` VALUES (24, '分页数量', 'ADMIN_PAGE_ROWS', '10', 5, 'num', '', '分页时每页的记录数', 1434019462, 1434019481, 4, 1);
INSERT INTO `ss_admin_config` VALUES (25, '后台主题', 'ADMIN_THEME', 'aliyun', 5, 'select', 'admin:默认主题\r\naliyun:阿里云风格', '后台界面主题', 1436678171, 1436690570, 5, 1);
INSERT INTO `ss_admin_config` VALUES (26, '导航分组', 'NAV_GROUP_LIST', 'top:顶部导航\r\nmain:主导航\r\nbottom:底部导航\r\nwap_bottom:Wap底部导航', 5, 'array', '', '导航分组', 1458382037, 1458382061, 6, 1);
INSERT INTO `ss_admin_config` VALUES (27, '配置分组', 'CONFIG_GROUP_LIST', '1:基本\r\n3:关于\r\n5:系统\r\n9:常规配置', 5, 'array', '', '配置分组', 1379228036, 1426930700, 7, 1);
INSERT INTO `ss_admin_config` VALUES (28, '开发模式', 'DEVELOP_MODE', '0', 7, 'toggle', '1:开启\r\n0:关闭', '开发模式下会显示菜单管理、配置管理、数据字典等开发者工具', 1432393583, 1432393583, 1, 1);
INSERT INTO `ss_admin_config` VALUES (29, '页面Trace', 'APP_TRACE', '0', 7, 'toggle', '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 2, 1);
INSERT INTO `ss_admin_config` VALUES (30, '站点头像', 'WEB_SITE_AVATAR', '1701', 3, 'picture', '', '', 1481009959, 1481009959, 50, 1);
INSERT INTO `ss_admin_config` VALUES (31, '注册实名赠送币', 'GET_REWARD', '100', 9, 'num', '', '注册实名赠送多少币', 1481009959, 1481009959, 0, 1);
INSERT INTO `ss_admin_config` VALUES (32, '签到赠送币', 'SIGN_MONEY', '2', 9, 'num', '', '签到赠送赏金', 1481009959, 1573906710, 0, 1);
INSERT INTO `ss_admin_config` VALUES (33, '直推奖(%)', 'PUSH_MONEY', '5', 9, 'num', '', '直推奖(%)', 1481009959, 1481009959, 0, 1);
INSERT INTO `ss_admin_config` VALUES (35, '团队长奖(%)', 'TEAM_MONEY', '2', 9, 'num', '', '团队长奖(%)', 1481009959, 1481009959, 0, 1);
INSERT INTO `ss_admin_config` VALUES (41, '微信二维码', 'WX_CODE', '', 3, 'picture', '', '微信二维码', 1481009959, 1481009959, 10, 1);
INSERT INTO `ss_admin_config` VALUES (42, '钱包地址收款码', 'MONEY_CODE', '', 3, 'picture', '', '钱包地址收款码', 1481009959, 1481009959, 11, 1);
INSERT INTO `ss_admin_config` VALUES (43, '每日静态收益', 'STATIC_MONEY', '200', 9, 'num', '', '每日静态收益', 1481009959, 1574064830, 0, 1);
INSERT INTO `ss_admin_config` VALUES (44, '转账手续费(%)', 'ZHUANZHANG_FEE', '0', 9, 'num', '', '转账手续费(%)', 1481009959, 1481009959, 0, 1);
INSERT INTO `ss_admin_config` VALUES (45, '每日打赏次数', 'DAY_NUM', '1', 9, 'num', '', '每日打赏次数', 1481009959, 1481009959, 0, 1);
INSERT INTO `ss_admin_config` VALUES (46, '转账可交易打赏金数量', 'MONEY_PRICE', '1600', 9, 'num', '', '转账 6000   1次转账 2000  可交易打赏金', 1588933912, 1588933912, 0, 1);
INSERT INTO `ss_admin_config` VALUES (47, '大转盘', 'RETURN_TABLE', '5,5,10,10,20,20,0,0', 9, 'array', '', '大转盘', 1588933912, 1588933912, 0, 1);
INSERT INTO `ss_admin_config` VALUES (48, '连续签到赠送币', 'CONTINUED_SIGN_MONEY', '3', 9, 'array', '', '连续签到赠送赏金', 1588933912, 1588933912, 0, 1);
INSERT INTO `ss_admin_config` VALUES (49, '客服数据', 'KEFU_DATA', '{\"tel\":\"13300001111\",\"qq\":\"999999999\",\"list\":[{\"question\":\"积分的获取\",\"answer\":\"签到、抽奖、每日任务，均可获取积分\"},{\"question\":\"积分的作用\",\"answer\":\"积分可以换购商品\"}]}', 9, 'text', '', '客服数据配置', 1588933912, 1588933912, 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
