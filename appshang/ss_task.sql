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

 Date: 23/08/2020 08:53:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_task
-- ----------------------------
DROP TABLE IF EXISTS `ss_task`;
CREATE TABLE `ss_task`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `task_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '任务类型  1每日任务 2会员任务 3超级任务',
  `task_species` tinyint(1) NOT NULL DEFAULT 1 COMMENT '任务种类 1广告信息 2激励视频 3开屏广告',
  `task_num` int(5) NOT NULL DEFAULT 0 COMMENT '任务个数数量',
  `task_reward` int(5) NOT NULL DEFAULT 0 COMMENT '任务奖励数量',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '任务状态 1正常  2冻结',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_task
-- ----------------------------
INSERT INTO `ss_task` VALUES (1, 1, 1, 2, 2, 1, 1595922349);
INSERT INTO `ss_task` VALUES (2, 2, 1, 5, 2, 1, 1595922366);
INSERT INTO `ss_task` VALUES (3, 3, 2, 5, 10, 1, 1595922385);
INSERT INTO `ss_task` VALUES (4, 2, 2, 4, 3, 1, 1595922398);
INSERT INTO `ss_task` VALUES (5, 1, 2, 2, 1, 1, 1595922413);
INSERT INTO `ss_task` VALUES (6, 1, 3, 4, 1, 1, 1595922426);
INSERT INTO `ss_task` VALUES (8, 2, 3, 4, 3, 1, 1597814585);

SET FOREIGN_KEY_CHECKS = 1;
