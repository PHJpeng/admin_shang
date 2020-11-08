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

 Date: 22/08/2020 21:51:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_goods_order
-- ----------------------------
DROP TABLE IF EXISTS `ss_goods_order`;
CREATE TABLE `ss_goods_order`  (
  `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `total` decimal(32, 2) NOT NULL COMMENT '订单总价格',
  `post_fee` decimal(32, 2) NOT NULL COMMENT '邮费',
  `discount` decimal(32, 2) NOT NULL COMMENT '优惠金额',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `order_status` tinyint(2) NOT NULL COMMENT '订单状态，10：创建成功未付款，20：已付款；30：等待发货；40：已发货；50：已完成；60：订单关闭取消',
  `payment_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式，wechat:微信支付;alipay:支付宝；coin：积分',
  `pay_time` int(11) NULL DEFAULT 0 COMMENT '支付时间',
  `shipping_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `shipping_company` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `shipping_number` varbinary(255) NULL DEFAULT NULL COMMENT '快递单号',
  `shipping_time` int(11) NULL DEFAULT 0 COMMENT '发货时间',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建订单时间',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_number_unique_index`(`order_number`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品订单表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
