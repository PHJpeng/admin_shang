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

 Date: 23/08/2020 08:54:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_user_order_pay_jilu
-- ----------------------------
DROP TABLE IF EXISTS `ss_user_order_pay_jilu`;
CREATE TABLE `ss_user_order_pay_jilu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录用户订单支付id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '订单编号',
  `order_total_price` decimal(10, 2) NOT NULL COMMENT '订单支付总金额',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户支付订单记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_user_order_pay_jilu
-- ----------------------------
INSERT INTO `ss_user_order_pay_jilu` VALUES (1, 25414, 196, 'B202005061703379476467813', 299.00, 1588755832);
INSERT INTO `ss_user_order_pay_jilu` VALUES (2, 15019, 386, 'B202005090915197072930821', 3200.00, 1588986957);
INSERT INTO `ss_user_order_pay_jilu` VALUES (3, 10606, 409, 'B202005121916256774712327', 3200.00, 1589282196);
INSERT INTO `ss_user_order_pay_jilu` VALUES (4, 14245, 865, 'B202006172133364152345733', 3200.00, 1592400832);
INSERT INTO `ss_user_order_pay_jilu` VALUES (5, 73023, 885, 'B202006191237503644209331', 1190.00, 1592541488);
INSERT INTO `ss_user_order_pay_jilu` VALUES (6, 10826, 965, 'B202006271430561917654722', 6400.00, 1593239479);
INSERT INTO `ss_user_order_pay_jilu` VALUES (7, 16275, 1140, 'B202007240637416824966516', 3200.00, 1595543910);
INSERT INTO `ss_user_order_pay_jilu` VALUES (8, 12942, 973, 'B202008161618499479072608', -463.00, 1597567110);
INSERT INTO `ss_user_order_pay_jilu` VALUES (9, 90301, 984, 'B202008170030162876237827', 9900.00, 1597595427);
INSERT INTO `ss_user_order_pay_jilu` VALUES (10, 90301, 986, 'B202008171556038394022032', 999.00, 1597650965);
INSERT INTO `ss_user_order_pay_jilu` VALUES (11, 90301, 988, 'B202008171556399216381516', 999.00, 1597651041);
INSERT INTO `ss_user_order_pay_jilu` VALUES (12, 90301, 983, 'B202008170022452453524735', 999.00, 1597652488);
INSERT INTO `ss_user_order_pay_jilu` VALUES (13, 10033, 605, 'B202005271850532091920037', 26000.00, 1597828023);

SET FOREIGN_KEY_CHECKS = 1;
