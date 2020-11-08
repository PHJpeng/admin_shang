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

 Date: 22/08/2020 21:53:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_goods_order_item
-- ----------------------------
DROP TABLE IF EXISTS `ss_goods_order_item`;
CREATE TABLE `ss_goods_order_item`  (
  `item_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单商品明细id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_number` varbinary(64) NOT NULL COMMENT '订单号',
  `good_id` int(11) UNSIGNED NOT NULL COMMENT '商品id',
  `good_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `good_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品封面图',
  `good_price` decimal(16, 2) NOT NULL COMMENT '下单时的商品价格',
  `quantity` int(10) NOT NULL COMMENT '下单商品数量',
  `total_price` decimal(16, 2) NOT NULL COMMENT '商品总价',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `order_id_index`(`order_id`, `order_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品订单详情表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
