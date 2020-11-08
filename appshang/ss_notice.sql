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

 Date: 22/08/2020 22:19:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_notice
-- ----------------------------
DROP TABLE IF EXISTS `ss_notice`;
CREATE TABLE `ss_notice`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通知消息ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封面图',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `publisher` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布人',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '消息状态  0关闭 1打开',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_notice
-- ----------------------------
INSERT INTO `ss_notice` VALUES (1, '推广方式', '/upload/20200821/f800b78fb8eb0b1226a0b56f01161087.png', '<p><img src=\"http://shang.shangtout.com/uploads/admin/image/2020-06-24/5ef2f916e807f.png\" alt=\"\"/><strong>一:&nbsp;推广方式</strong></p><p>团长在&quot;我的&quot; 点击&nbsp; &quot;分享有礼抽大奖&quot;&nbsp; 可获得本人推广二维码. 新用户扫描二维码成 为团长成员.</p><p><br/></p><p>团长可点击 &quot;推广赚积分&quot; 查看团队成员</p><p><br/></p><p>团长成员为高级会员方式:</p><p>团长点击 &quot;推广赚积分&quot; - &quot;普通会员&quot; 列表 点击升级成为高级会员, 后台审核通过并扣除团长6000积分后,该普通会员就可以升级为高级会员.</p><p><br/></p><p><strong>二: 积分获取方式:</strong><br/></p><p>1):&nbsp; 普通会员可完成每日任务获取积分</p><p>2):&nbsp; 高级会员可完成每日任务和会员任务来获取积分.</p><p><br/></p><p><strong>三: 任务完成方式:</strong></p><p>1): 开屏广告任务: 用户打开 &quot;赏头条APP&quot; 时, 会弹出开屏广告, 观看开屏广告并点击广告页面即完成开屏广告任务.</p><p><br/></p><p>2): banner广告: &quot;赏头条APP&quot; 轮播图内会不定时插入banner广告,点击并观看轮播图广告即完成banner广告任务.</p><p><br/></p><p>3): 信息流广告: &quot;赏头条APP&quot; -- &quot;商家&quot; 页面 商家介绍会插入信息流广告, 用户通过点击观看信息流广告即完成信息流广告任务.</p><p><br/></p><p>4): 激励视频: &quot;赏头条APP&quot; 首页右侧&nbsp; 点击激励视频浮窗会自动弹出激励视频,观看激励视频,点击进入二级页面即完成激励视频任务.</p><p><br/></p>', '后台管理员', 1, 1597896521);

SET FOREIGN_KEY_CHECKS = 1;
