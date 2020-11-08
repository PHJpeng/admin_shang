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

 Date: 22/08/2020 20:53:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_admin_post
-- ----------------------------
DROP TABLE IF EXISTS `ss_admin_post`;
CREATE TABLE `ss_admin_post`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID',
  `title` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `cover` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '封面',
  `abstract` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '摘要',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `view_count` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `is_system` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否系统预置0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_admin_post
-- ----------------------------
INSERT INTO `ss_admin_post` VALUES (10, 1, '赚钱攻略', 0, '赚钱攻略', '<p>\r\n	<img alt=\"\" src=\"/uploads/admin/image/2019-10-15/5da5992220a62.jpg\" /> \r\n</p>\r\n<h2 style=\"text-align:center;\">\r\n	<span style=\"color: rgb(229, 51, 51); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;background-color:#ffffff;\"=\"\">寻找赏金达人</span> \r\n</h2>\r\n<p>\r\n	<span style=\"color:#FFFFFF;background-color:#FFFFFF;\"><span style=\"color:#000000;background-color:#FFFFFF;\"> Hi</span><span style=\"color:#000000;background-color:#FFFFFF;\"> <span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\"> 听说过赏金达人吗？</span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;background-color:#FFFFFF;\"><span style=\"color:#000000;background-color:#FFFFFF;\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\">只要完成特定的任务，他们就可以获得高额的赏金</span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;background-color:#FFFFFF;\"><span style=\"color:#000000;background-color:#FFFFFF;\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\">现在头条君邀请你成为赏金达人</span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;background-color:#FFFFFF;\"><span style=\"color:#000000;background-color:#FFFFFF;\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\">一个简单的动作便可以坐享‘巨额赏金’每天<span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\">签到都可以领导1枚DS币哦，币价会天天上涨</span></span></span></span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;background-color:#FFFFFF;\"><span style=\"color:#000000;background-color:#FFFFFF;\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\">话不多说，先上赏金</span></span></span></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;background-color:#FFFFFF;\"><span style=\"color:#000000;background-color:#FFFFFF;\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\">邀请好友福利多多，详细请看悬赏制度</span></span></span></span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;background-color:#FFFFFF;\"><span style=\"color:#000000;background-color:#FFFFFF;\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\"><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\">免费注册会员-</span><span style=\"color: rgb(34, 34, 34); font-family: Consolas,;\" font-size:12px;white-space:pre-wrap;\"=\"\">领10枚DS币哦</span></span></span></span>\r\n</p>', 0, 1571133960, 1572950385, 0, 1, 1);
INSERT INTO `ss_admin_post` VALUES (11, 6, '打赏赚钱', 0, '打赏赚钱', '<p>\r\n	<img alt=\"\" src=\"/uploads/admin/image/2019-10-15/5da59a45e68eb.jpg\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p align=\"center\" style=\"margin:0pt;text-align:center;mso-pagination:widow-orphan;\">\r\n	<span style=\"color:#222222;font-family:微软雅黑;font-size:9pt;mso-spacerun:&quot;yes&quot;;mso-bidi-font-family:宋体;mso-font-kerning:0.0000pt;\"><span style=\"font-family:微软雅黑;\">平台开放期间，所有的用户都为邀请制，需要提供邀请码才可以注册并需要实名认证。</span></span>\r\n</p>\r\n<ol style=\"list-style-type:decimal;direction:ltr;\">\r\n	<li style=\"color:#222222;font-family:微软雅黑;font-size:9pt;font-style:normal;font-weight:normal;\">\r\n		<p align=\"center\" style=\"text-align:center;color:#000000;font-family:宋体;font-size:12pt;font-style:normal;font-weight:normal;margin-top:1em;margin-bottom:1em;mso-pagination:widow-orphan;mso-char-indent-count:0.0000;mso-list:l0 level1 lfo1;\">\r\n			<span style=\"color:#222222;font-family:微软雅黑;font-size:9pt;mso-spacerun:&quot;yes&quot;;mso-bidi-font-family:宋体;mso-font-kerning:0.0000pt;\"><span style=\"font-family:微软雅黑;\">用户可点击任意商家进行打赏，打赏会获得商家奖励的打赏金，最高获得奖励</span>2</span><span style=\"color:#222222;font-family:微软雅黑;font-size:9pt;mso-spacerun:&quot;yes&quot;;mso-bidi-font-family:宋体;mso-font-kerning:0.0000pt;\">00</span><span style=\"color:#222222;font-family:微软雅黑;font-size:9pt;mso-spacerun:&quot;yes&quot;;mso-bidi-font-family:宋体;mso-font-kerning:0.0000pt;\"><span style=\"font-family:微软雅黑;\">打赏金；</span></span>\r\n		</p>\r\n	</li>\r\n	<li style=\"color:#222222;font-family:微软雅黑;font-size:9pt;font-style:normal;font-weight:normal;\">\r\n		<p align=\"center\" style=\"text-align:center;color:#000000;font-family:宋体;font-size:12pt;font-style:normal;font-weight:normal;margin-top:1em;margin-bottom:1em;mso-pagination:widow-orphan;mso-char-indent-count:0.0000;mso-list:l0 level1 lfo1;\">\r\n			<span style=\"color:#222222;font-family:微软雅黑;font-size:9pt;mso-spacerun:&quot;yes&quot;;mso-bidi-font-family:宋体;mso-font-kerning:0.0000pt;\"><span style=\"font-family:微软雅黑;\">一个用户在一天内只能给一个商家进行一次打赏；</span></span>\r\n		</p>\r\n	</li>\r\n	<li style=\"color:#222222;font-family:微软雅黑;font-size:9pt;font-style:normal;font-weight:normal;\">\r\n		<p align=\"center\" style=\"text-align:center;color:#000000;font-family:宋体;font-size:12pt;font-style:normal;font-weight:normal;margin-top:1em;margin-bottom:1em;mso-pagination:widow-orphan;mso-char-indent-count:0.0000;mso-list:l0 level1 lfo1;\">\r\n			<span style=\"color:#222222;font-family:微软雅黑;font-size:9pt;mso-spacerun:&quot;yes&quot;;mso-bidi-font-family:宋体;mso-font-kerning:0.0000pt;\"><span style=\"font-family:微软雅黑;\">当天所有打赏金和奖励的打赏金在第二个工作日全额结算</span></span>\r\n		</p>\r\n	</li>\r\n</ol>', 0, 1571134089, 1573626070, 0, 1, 1);
INSERT INTO `ss_admin_post` VALUES (12, 7, '合伙赚钱', 0, '合伙赚钱', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 0, 1571134240, 1573894223, 0, 1, 1);
INSERT INTO `ss_admin_post` VALUES (13, 8, '保存平台', 0, '保存平台', '<p>\r\n	<img src=\"/uploads/admin/image/2019-10-15/5da59b48a0c7f.jpg\" alt=\"\" />\r\n</p>\r\n<br />\r\n<p>\r\n	<span style=\"color:#222222;font-family:Consolas, \"font-size:12px;white-space:pre-wrap;\">打开浏览器，输入xxxx下载</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#222222;font-family:Consolas, \"font-size:12px;white-space:pre-wrap;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 0, 1571134400, 1572950754, 0, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
