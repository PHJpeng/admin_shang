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

 Date: 22/08/2020 22:19:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_settled
-- ----------------------------
DROP TABLE IF EXISTS `ss_settled`;
CREATE TABLE `ss_settled`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户uid',
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `to_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `youname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '称呼',
  `shop_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户类型',
  `money` decimal(16, 2) NOT NULL COMMENT '预计推广费',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '说明',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家入驻表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_settled
-- ----------------------------
INSERT INTO `ss_settled` VALUES (1, 10000, '15000000000', '15000000000', 'Huang', '1000', '的哈', '教育类', 0.00, '666', 1571137252);
INSERT INTO `ss_settled` VALUES (2, 14804, '13108785299', '13108785299', '斌斌', '3000', '啊斌', '电商类', 0.00, '，', 1580962209);
INSERT INTO `ss_settled` VALUES (3, 15268, '13022078398', '13022078398', '林秋茹', '3000', '林秋茹', '美容类', 0.00, '，', 1581176230);
INSERT INTO `ss_settled` VALUES (4, 14876, '15277260376', '15277260376', '闭德飞', '3000', '阿闭', '电商类', 0.00, '打造属于我们自己的未来', 1581289313);
INSERT INTO `ss_settled` VALUES (5, 18783, '18784383837', '18784383837', '王兆祖', '3000', '王兆祖', '医疗类', 0.00, '国药准字OTC的（药酒），主治:各种腰腿疼痛，四支麻木，通经活络。', 1584545658);
INSERT INTO `ss_settled` VALUES (6, 20288, '15135341197', '15135341197', '一切随缘', '3000', '一切随缘', '美容类', 0.00, '希望不会失望，努力努力在努力', 1584584589);
INSERT INTO `ss_settled` VALUES (7, 22096, '13571014776', '13571014776', 'kxz', '3000', '张先生', '企业类', 0.00, '大型公司企业需要点投资', 1584843769);
INSERT INTO `ss_settled` VALUES (8, 22096, '13571014776', '13571014776', 'kxz', '3000', '张先生', '企业类', 0.00, '大型公司企业需要点投资', 1584843774);
INSERT INTO `ss_settled` VALUES (9, 24228, '15333580108', '15333580108', '韩林材', '3000', '正', '电商类', 0.00, '电锅', 1585321863);
INSERT INTO `ss_settled` VALUES (10, 25684, '13834754269', '13834754269', '刘正东', '3000', '王建明', '企业类', 0.00, '培优教育', 1585694604);
INSERT INTO `ss_settled` VALUES (11, 23752, '19940767470', '19940767470', '舒钦斌', '3000', '四叶草', '活动类', 0.00, '，，，', 1586249891);
INSERT INTO `ss_settled` VALUES (12, 10026, '15141155678', '15141155678', '小胖', '3000', '哈哈哈', '金融类', 0.00, '！！！', 1586678261);
INSERT INTO `ss_settled` VALUES (13, 28846, '13463633768', '13463633768', '赵玉顺', '3000', '赵玉顺', '活动类', 0.00, '挣钱', 1587888149);
INSERT INTO `ss_settled` VALUES (14, 28846, '13463633768', '13463633768', '赵玉顺', '3000', '赵玉顺', '活动类', 0.00, '挣钱', 1587888155);
INSERT INTO `ss_settled` VALUES (15, 28846, '13463633768', '13463633768', '赵玉顺', '3000', '赵玉顺', '活动类', 0.00, '推广', 1588034089);
INSERT INTO `ss_settled` VALUES (16, 27856, '13522286980', '13522286980', '单景华2', '13522286980', '单景华', '活动类', 6000.00, '6000', 1588698657);
INSERT INTO `ss_settled` VALUES (17, 10086, '13466356789', '13466356789', '杨海涛', '13466356789', '杨海涛', '企业类', 6000.00, '争创佳绩，打造未来，成就梦想！', 1588700431);
INSERT INTO `ss_settled` VALUES (18, 28464, '18435178385', '18435178385', '张改梅', '18435178385', '张改梅', '活动类', 1500.00, '入住', 1588730927);
INSERT INTO `ss_settled` VALUES (19, 25449, '15033235759', '15033235759', '宋增芳', '15033235759', '宋增芳', '新媒类', 6000.00, '赏头条', 1588733174);
INSERT INTO `ss_settled` VALUES (20, 12942, '13200009999', '13200009999', '李斯', '10600009999', 'dsa', '活动类', 500000.00, '测试手机号', 1588756453);
INSERT INTO `ss_settled` VALUES (21, 12942, '13200009999', '13200009999', '李斯', '16600009999', 'helloworld', '活动类', 500000.00, '321', 1588760524);
INSERT INTO `ss_settled` VALUES (22, 34337, '13796356290', '13796356290', '开心快乐', '13796356290', '于凤起', '活动类', 6000.00, '努力奋斗', 1588761602);
INSERT INTO `ss_settled` VALUES (23, 10990, '13683560301', '13683560301', '郝玉珍', '13683560301', '郝玉珍', '活动类', 6000.00, '一', 1588808723);
INSERT INTO `ss_settled` VALUES (24, 27222, '17380597205', '17380597205', '罗祥', '15910213638', '罗祥', '企业类', 6000.00, '晶源国际优选商城', 1588810408);
INSERT INTO `ss_settled` VALUES (25, 34468, '13069943486', '13069943486', '梦想成真', '13069943486', '尚忠武', '活动类', 6000.00, '商家', 1588828043);
INSERT INTO `ss_settled` VALUES (26, 34346, '13583199599', '13583199599', '昊烜', '19819883134', '姬炜晔', '活动类', 6000.00, '青少年视力养护', 1588828608);
INSERT INTO `ss_settled` VALUES (27, 33354, '18601342398', '18601342398', '崔宗艳', '18601342398', '崔宗艳', '活动类', 6000.00, '一千五', 1588903225);
INSERT INTO `ss_settled` VALUES (28, 34336, '15910107758', '15910107758', '张志', '15910107758', '張至堾', '活动类', 6000.00, '惠民多社区，为人民谋幸福，让生活更美好', 1588920001);
INSERT INTO `ss_settled` VALUES (29, 34336, '15910107758', '15910107758', '张志', '15910107758', '張至堾', '企业类', 500000.00, '惠民多社区，为人民谋幸福，让生活更美好', 1588920115);
INSERT INTO `ss_settled` VALUES (30, 24369, '18903580707', '18903580707', '任纪平', '18903580707', '任纪平', '活动类', 6000.00, '空调鞋子', 1588931641);
INSERT INTO `ss_settled` VALUES (31, 34336, '15910107758', '15910107758', '张志', '15910107758', '張至堾', '电商类', 500000.00, '企业宣传', 1588942525);
INSERT INTO `ss_settled` VALUES (32, 35271, '13546279725', '13546279725', '福安驾校', '13546279725', '高二龙', '企业类', 6000.00, '福安驾校', 1588958751);
INSERT INTO `ss_settled` VALUES (33, 34468, '13069943486', '13069943486', '尚忠武', '13069943486', '尚忠武', '活动类', 6000.00, '商家', 1588987280);
INSERT INTO `ss_settled` VALUES (34, 24853, '15844683460', '15844683460', '张福', '15844683460', '张福', '活动类', 6000.00, '描述什么呀？', 1589027430);
INSERT INTO `ss_settled` VALUES (35, 10128, '13552690736', '13552690736', '李境秀', '13552690736', '李境秀', '活动类', 6000.00, '打赏头条', 1589140317);
INSERT INTO `ss_settled` VALUES (36, 25297, '13552669253', '13552669253', '任献珍', '13552669253', '任献珍', '活动类', 6000.00, '赏头条打打赏', 1589140603);
INSERT INTO `ss_settled` VALUES (37, 10128, '13552690736', '13552690736', '李境秀', '13552690736', '李境秀', '活动类', 6000.00, '打赏', 1589141179);
INSERT INTO `ss_settled` VALUES (38, 10128, '13552690736', '13552690736', '李境秀', '13552690736', '李境秀', '活动类', 6000.00, '签到‘', 1589144138);
INSERT INTO `ss_settled` VALUES (39, 30075, '15034292598', '15034292598', '博爱', '15034292598', '李建安', '活动类', 10000.00, '兴旺发达', 1589151150);
INSERT INTO `ss_settled` VALUES (40, 10350, '15911172587', '15911172587', '张新志', '17823587688', '刘', '活动类', 6000.00, '一家专门坑人的门店', 1589159432);
INSERT INTO `ss_settled` VALUES (41, 41439, '13681321200', '13681321200', '刘国霞', '13681321200', '紫玉', '美容类', 6000.00, '美容', 1589173521);
INSERT INTO `ss_settled` VALUES (42, 10128, '13552690736', '13552690736', '李境秀', '13552690736', '李境秀213552690736', '活动类', 6000.00, '打赏', 1589226799);
INSERT INTO `ss_settled` VALUES (43, 25297, '13552669253', '13552669253', '任献珍', '13552669253', '任献珍', '活动类', 6000.00, '打赏', 1589227077);
INSERT INTO `ss_settled` VALUES (44, 10128, '13552690736', '13552690736', '李境秀', '13552690736', '李境秀', '活动类', 6000.00, '签到', 1589227414);
INSERT INTO `ss_settled` VALUES (45, 47381, '18279993188', '18279993188', '刘超', '18279993188', '刘超', '活动类', 6000.00, '我要入驻电脑办公类目', 1589235298);
INSERT INTO `ss_settled` VALUES (46, 34336, '15910107758', '15910107758', '张志', '15910107758', '張至堾', '电商类', 500000.00, '密码破解器', 1589244141);
INSERT INTO `ss_settled` VALUES (47, 33354, '18601342398', '18601342398', '崔宗艳', '18601342398', '崔宗艳', '活动类', 6000.00, '我想看看，商家产品', 1589248235);
INSERT INTO `ss_settled` VALUES (48, 35709, '13001084839', '13001084839', '春晓', '13001084839', '春晓王淑美', '电商类', 6000.00, '打赏', 1589281883);
INSERT INTO `ss_settled` VALUES (49, 10128, '13552690736', '13552690736', '李境秀', '13552690736', '李境秀', '活动类', 6000.00, '签到', 1589312192);
INSERT INTO `ss_settled` VALUES (50, 10128, '13552690736', '13552690736', '李境秀', '13552690736', '李境秀', '活动类', 6000.00, '打赏', 1589312296);
INSERT INTO `ss_settled` VALUES (51, 25297, '13552669253', '13552669253', '任献珍', '13552669253', '任献珍', '活动类', 6000.00, '打赏', 1589313544);
INSERT INTO `ss_settled` VALUES (52, 70099, '13407162920', '13407162920', '壮志凌云', '13407162920', '盛凌云', '酒店类', 10000.00, '不忘初心牢记使命', 1589379631);
INSERT INTO `ss_settled` VALUES (53, 10128, '13552690736', '13552690736', '李境秀', '13552690736', '李境秀', '活动类', 6000.00, '签到打赏', 1589399960);
INSERT INTO `ss_settled` VALUES (54, 25297, '13552669253', '13552669253', '任献珍', '13552669253', '任献珍', '活动类', 6000.00, '打赏', 1589400181);
INSERT INTO `ss_settled` VALUES (55, 16064, '19910532182', '19910532182', '胡德胜', '19910532182', '胡德胜', '活动类', 6000.00, '不错挺好', 1589402097);
INSERT INTO `ss_settled` VALUES (56, 49361, '13796353286', '13796353286', '大雁', '13796353586', '大雁', '保健类', 6000.00, '注重养生，身体健康！', 1589405202);
INSERT INTO `ss_settled` VALUES (57, 16024, '15163565181', '15163565181', '商艳红', '15163565181', '商艳红', '活动类', 6000.00, '打赏金', 1589406392);
INSERT INTO `ss_settled` VALUES (58, 33354, '18601342398', '18601342398', '崔宗艳', '18601342398', '崔宗艳', '经济类', 6000.00, '。！！！我', 1589428823);
INSERT INTO `ss_settled` VALUES (59, 66577, '15264013404', '15264013404', '我的梦', '15264013404', '崔自成', '活动类', 6000.00, '鉴到', 1589457998);
INSERT INTO `ss_settled` VALUES (60, 71347, '13438877215', '13438877215', '我是我', '13438877215', '刘程', '活动类', 500000.00, '中式比特币', 1589458896);
INSERT INTO `ss_settled` VALUES (61, 10128, '13552690736', '13552690736', '李境秀', '13552690736', '李境秀', '活动类', 6000.00, '笤剂打赏', 1589484242);
INSERT INTO `ss_settled` VALUES (62, 25297, '13552669253', '13552669253', '任献珍', '13552669253', '任献珍', '活动类', 6000.00, '打赏', 1589486741);
INSERT INTO `ss_settled` VALUES (63, 30075, '15034292598', '15034292598', '博爱', '15034292598', '李建安', '活动类', 10000.00, '认真做好每一件事情。', 1589497685);
INSERT INTO `ss_settled` VALUES (64, 33354, '18601342398', '18601342398', '崔宗艳', '18601342398', '崔宗艳', '酒店类', 6000.00, '我喜欢看闪头条', 1589507028);
INSERT INTO `ss_settled` VALUES (65, 33354, '18601342398', '18601342398', '崔宗艳', '18601342398', '崔宗燕', '经济类', 6000.00, '我爱看闪头条', 1589507127);
INSERT INTO `ss_settled` VALUES (66, 38509, '15686290298', '15686290298', 'yn', '15686290298', '张亚妮', '活动类', 6000.00, '，，，', 1589508560);
INSERT INTO `ss_settled` VALUES (67, 71941, '15235542141', '15235542141', '艳的两个宝贝', '15235542141', '申艳峰', '活动类', 6000.00, '母婴用品', 1589526606);
INSERT INTO `ss_settled` VALUES (68, 72266, '13753859525', '13753859525', '冯哥', '13753859525', '冯永平', '活动类', 6000.00, '我想挣钱', 1589601368);
INSERT INTO `ss_settled` VALUES (69, 40583, '15604541766', '15604541766', '张淑芬', '15604541766', '张淑芬', '活动类', 50000.00, '描述', 1589697994);
INSERT INTO `ss_settled` VALUES (70, 33211, '13943647273', '13943647273', '执着任性', '13943647273', '贺继伟', '活动类', 6000.00, '签到', 1589703673);
INSERT INTO `ss_settled` VALUES (71, 23768, '13848914791', '13848914791', '吃喝玩乐', '13848914791', '康二拴', '活动类', 6000.00, '抽红包', 1589755846);
INSERT INTO `ss_settled` VALUES (72, 72135, '15536440228', '15536440228', '刘自力', '15536440228', '刘自力', '活动类', 6000.00, '好谢谢了', 1589917767);
INSERT INTO `ss_settled` VALUES (73, 71935, '13335166626', '13335166626', '刘宝', '13335166626', '刘宝', '经济类', 6000.00, '很好的项目，', 1589927726);
INSERT INTO `ss_settled` VALUES (74, 23685, '15187951608', '15187951608', '一生不长', '15187951608', '魏真武', '活动类', 10000.00, '为商家推广和打赏', 1589946172);
INSERT INTO `ss_settled` VALUES (75, 49157, '13303587399', '13303587399', '贺建珍', '13303587399', '贺建珍', '美容类', 6000.00, '做省体，减肥', 1589963052);
INSERT INTO `ss_settled` VALUES (76, 49157, '13303587399', '13303587399', '贺建珍', '13303587399', '贺建珍', '美容类', 6000.00, '美容，做身体', 1589965746);
INSERT INTO `ss_settled` VALUES (77, 54121, '13643583938', '13643583938', '王旭丽', '13643583938', '王旭丽', '保健类', 6000.00, '英派斯健身，北京同仁堂', 1589969929);
INSERT INTO `ss_settled` VALUES (78, 20445, '15108473682', '15108473682', '李才彬', '15108473682', '李才彬', '电商类', 6000.00, '你好', 1589975167);
INSERT INTO `ss_settled` VALUES (79, 72518, '15853155526', '15853155526', '王安昌', '15853155526', '王安昌', '活动类', 30000.00, '身体健康是人类共同的愿望，在创建人类命运共同体的理念中，消费增值、倍增是中国现代趋势的必然产物！', 1590037114);
INSERT INTO `ss_settled` VALUES (80, 74276, '19987414653', '19987414653', '相逢何必曾相识', '19987414653', '李文珍', '活动类', 6000.00, '我想过好每一天', 1590070850);
INSERT INTO `ss_settled` VALUES (81, 74336, '13811972363', '13811972363', '夏影', '13811972363', '夏影', '活动类', 30000.00, '平安保险。贷款。', 1590107076);
INSERT INTO `ss_settled` VALUES (82, 73860, '19819883213', '19819883213', '大爱无疆', '19819883213', '刘铭', '保健类', 30000.00, '花乡牌保健红花籽油全国招商', 1590186325);
INSERT INTO `ss_settled` VALUES (83, 10943, '15573532141', '15573532141', '胡满英', '15573532141', '胡满英', '活动类', 6000.00, '打赏', 1590406598);
INSERT INTO `ss_settled` VALUES (84, 76602, '18268198943', '18268198943', '懂么', '18268198943', '张家金', '活动类', 6000.00, '努力赚钱', 1590429799);
INSERT INTO `ss_settled` VALUES (85, 77337, '18203489945', '18203489945', '相逢是缘', '18203489945', '高国平', '活动类', 6000.00, '6000', 1590503175);
INSERT INTO `ss_settled` VALUES (86, 77337, '18203489945', '18203489945', '相逢是缘', '18203489945', '高国平', '活动类', 6000.00, '6000', 1590503275);
INSERT INTO `ss_settled` VALUES (87, 29150, '17888826325', '17888826325', '高鹤', '15611237328', '蒋锐', '活动类', 6000.00, '中老年高品质旅游', 1590520625);
INSERT INTO `ss_settled` VALUES (88, 77337, '18203489945', '18203489945', '相逢是缘', '18203489945', '高国平', '保健类', 6000.00, '看一看', 1590569774);
INSERT INTO `ss_settled` VALUES (89, 25630, '18610078340', '18610078340', '贾彬', '18610078340', '贾彬', '活动类', 6000.00, '打球:', 1590590446);
INSERT INTO `ss_settled` VALUES (90, 25630, '18610078340', '18610078340', '贾彬', '18610078340', '贾彬', '活动类', 6000.00, '打球', 1590590528);
INSERT INTO `ss_settled` VALUES (91, 25630, '18610078340', '18610078340', '贾彬', '18610078340', '贾彬', '活动类', 6000.00, '打球', 1590591397);
INSERT INTO `ss_settled` VALUES (92, 34467, '13520928872', '13520928872', '法淑华', '13520928872', '法淑华', '新奇类', 6000.00, '中国老龄委', 1590598084);
INSERT INTO `ss_settled` VALUES (93, 10193, '13146823960', '13146823960', '陈玉玲', '13146823960', '陈玉华', '活动类', 10000.00, '打赏', 1590710737);
INSERT INTO `ss_settled` VALUES (94, 37257, '18135841644', '18135841644', '薛根平', '18135841644', '薛根平', '企业类', 6000.00, '我的手机号', 1590727399);
INSERT INTO `ss_settled` VALUES (95, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '打赏', 1590762099);
INSERT INTO `ss_settled` VALUES (96, 28844, '13071155952', '13071155952', '刘燕英', '13071155952', '刘燕英', '企业类', 6000.00, '打赏', 1590762250);
INSERT INTO `ss_settled` VALUES (97, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '签到打赏', 1590805822);
INSERT INTO `ss_settled` VALUES (98, 72254, '17812032590', '17812032590', '郭万深', '17812032590', '郭万深', '企业类', 6000.00, '签到', 1590809866);
INSERT INTO `ss_settled` VALUES (99, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '打赏签到', 1590812985);
INSERT INTO `ss_settled` VALUES (100, 72251, '13661074923', '13661074923', '高连安', '13661074923', '高连安', '活动类', 6000.00, '打赏签到', 1590814422);
INSERT INTO `ss_settled` VALUES (101, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '打赏签到', 1590848533);
INSERT INTO `ss_settled` VALUES (102, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '打赏签到', 1590946111);
INSERT INTO `ss_settled` VALUES (103, 23778, '13703518769', '13703518769', '牛林珍', '13703518769', '牛林珍', '活动类', 6000.00, '产品非常美', 1590952146);
INSERT INTO `ss_settled` VALUES (104, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '打赏签到', 1590959113);
INSERT INTO `ss_settled` VALUES (105, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '签到打赏', 1590986799);
INSERT INTO `ss_settled` VALUES (106, 79226, '13874485683', '13874485683', '都尉', '13874485683', '都尉', '电商类', 10000.00, '认真提供好的福利', 1591006021);
INSERT INTO `ss_settled` VALUES (107, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '签到打赏', 1591022465);
INSERT INTO `ss_settled` VALUES (108, 28844, '13071155952', '13071155952', '刘燕英', '13071155952', '刘燕英', '企业类', 6000.00, '打赏', 1591022572);
INSERT INTO `ss_settled` VALUES (109, 79219, '13691163200', '13691163200', '李艳良', '13691163200', '李艳良', '活动类', 6000.00, '个人', 1591070152);
INSERT INTO `ss_settled` VALUES (110, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '打赏签到', 1591113281);
INSERT INTO `ss_settled` VALUES (111, 28844, '13071155952', '13071155952', '刘燕英', '13071155952', '刘燕英', '企业类', 6000.00, '打赏', 1591113396);
INSERT INTO `ss_settled` VALUES (112, 79322, '13555029180', '13555029180', '聂伟', '13555029180', '聂伟', '活动类', 6000.00, '好', 1591132010);
INSERT INTO `ss_settled` VALUES (113, 79674, '13844016890', '13844016890', '王阔', '13844016890', '王阔', '活动类', 10000.00, '电商尝试', 1591161105);
INSERT INTO `ss_settled` VALUES (114, 25621, '13693514858', '13693514858', '刘燕英', '13693514858', '刘燕英', '企业类', 6000.00, '签到', 1591180601);
INSERT INTO `ss_settled` VALUES (115, 33354, '18601342398', '18601342398', '崔宗艳', '18601342398', '崔宗燕', '经济类', 500000.00, '111', 1591193309);
INSERT INTO `ss_settled` VALUES (116, 24321, '13620613931', '13620613931', '婷小姐', '13620613931', '熊曼廷', '活动类', 6000.00, '带货', 1591201258);
INSERT INTO `ss_settled` VALUES (117, 78619, '18660008326', '18660008326', '孙德兆', '18660008326', '孙德兆', '活动类', 30000.00, '绿叶惠购', 1591234906);
INSERT INTO `ss_settled` VALUES (118, 16024, '15163565181', '15163565181', '商艳红', '15163565181', '商艳红', '活动类', 6000.00, '赏头条', 1591243673);
INSERT INTO `ss_settled` VALUES (119, 80573, '15966783677', '15966783677', '孙立志', '15966783677', '孙立志', '活动类', 6000.00, '哈哈', 1591366347);
INSERT INTO `ss_settled` VALUES (120, 80573, '15966783677', '15966783677', '孙立志', '15966783677', '孙立志', '活动类', 6000.00, '东北', 1591400223);
INSERT INTO `ss_settled` VALUES (121, 80573, '15966783677', '15966783677', '孙立志', '15966783677', '孙立志', '活动类', 6000.00, '是', 1591416639);
INSERT INTO `ss_settled` VALUES (122, 77389, '17710319150', '17710319150', '张富桂', '17710319150', '张富桂', '经济类', 6000.00, '旅游', 1591434425);
INSERT INTO `ss_settled` VALUES (123, 77389, '17710319150', '17710319150', '张富桂', '17710319150', '张富贵', '活动类', 6000.00, '经济旅游', 1591498007);
INSERT INTO `ss_settled` VALUES (124, 77389, '17710319150', '17710319150', '张富桂', '17710319150', '张富贵', '经济类', 6000.00, '旅游经济', 1591498122);
INSERT INTO `ss_settled` VALUES (125, 30075, '15034292598', '15034292598', '李建安', '15034292598', '李建安', '经济类', 10000.00, '发展企业经济，维持社会生活稳定秩序，保护个生活保障。', 1591569668);
INSERT INTO `ss_settled` VALUES (126, 77389, '17710319150', '17710319150', '张富桂', '17710319150', '张富贵', '经济类', 6000.00, '旅游', 1591572772);
INSERT INTO `ss_settled` VALUES (127, 10699, '15954335551', '15954335551', '尹洪国', '15954335551', '尹洪国', '活动类', 6000.00, '手机', 1591592494);
INSERT INTO `ss_settled` VALUES (128, 34323, '15653107235', '15653107235', '段文学', '15653107235', '段文学', '保健类', 10000.00, '妇科产品', 1591593954);
INSERT INTO `ss_settled` VALUES (129, 33354, '18601342398', '18601342398', '崔宗艳', '18601342398', '崔钟晏', '活动类', 6000.00, '我愿意看赏头条', 1591681624);
INSERT INTO `ss_settled` VALUES (130, 81616, '15016109833', '15016109833', 'sun何', '15016109833', '何穗生', '电商类', 6000.00, '家电', 1591756321);
INSERT INTO `ss_settled` VALUES (131, 80627, '15386986726', '15386986726', '张保华', '15386986726', '张保华', '保健类', 10000.00, '保健品', 1591777478);
INSERT INTO `ss_settled` VALUES (132, 82360, '15611870765', '15611870765', '刘文禄', '15611870765', '刘文禄', '活动类', 6000.00, '逐步', 1591873506);
INSERT INTO `ss_settled` VALUES (133, 82360, '15611870765', '15611870765', '刘文禄', '15611870765', '刘文禄', '活动类', 6000.00, '逐步增加', 1591873714);
INSERT INTO `ss_settled` VALUES (134, 82350, '13661241327', '13661241327', '刘文禄', '13661241327', '刘文禄', '活动类', 6000.00, '逐步增加', 1591874038);
INSERT INTO `ss_settled` VALUES (135, 82742, '13831637132', '13831637132', '千纸鹤', '13831637132', '千纸鹤', '保健类', 10000.00, '成为别人生命中的天使', 1591947576);
INSERT INTO `ss_settled` VALUES (136, 82742, '13831637132', '13831637132', '千纸鹤', '13831637132', '千纸鹤', '保健类', 10000.00, '成为别人生命中的天使', 1591947618);
INSERT INTO `ss_settled` VALUES (137, 25750, '15122997095', '15122997095', '王嘉福', '13122134153', '王强', '活动类', 50000.00, '广告', 1591956419);
INSERT INTO `ss_settled` VALUES (138, 81534, '15601348753', '15601348753', '高淑惠', '15601348753', '髙淑惠', '活动类', 6000.00, '|', 1591971433);
INSERT INTO `ss_settled` VALUES (139, 82445, '13596075311', '13596075311', '美丽', '13596075311', '董广春', '企业类', 6000.00, '医院检查', 1591971717);
INSERT INTO `ss_settled` VALUES (140, 82445, '13596075311', '13596075311', '美丽', '13596075311', '董广春', '活动类', 6000.00, '美丽', 1591976183);
INSERT INTO `ss_settled` VALUES (141, 26464, '15348422732', '15348422732', '宋国进', '15348422732', '宋国进', '企业类', 30000.00, '酿酒访', 1592277652);
INSERT INTO `ss_settled` VALUES (142, 84329, '13621320975', '13621320975', '杨金玲', '13621320975', '杨金玲', '活动类', 6000.00, '购买需要物品', 1592371268);
INSERT INTO `ss_settled` VALUES (143, 84329, '13621320975', '13621320975', '杨金玲', '13621320975', '杨金玲', '活动类', 6000.00, '购买需要物品', 1592371382);
INSERT INTO `ss_settled` VALUES (144, 63996, '13888116544', '13888116544', '刘晓龙', '13888116544', '刘峻呈', '活动类', 6000.00, '126', 1592491084);
INSERT INTO `ss_settled` VALUES (145, 84763, '13331122799', '13331122799', '成秀芝', '13331122799', '成秀芝', '活动类', 500000.00, '报到', 1592524543);
INSERT INTO `ss_settled` VALUES (146, 14326, '18211826898', '18211826898', '白林正', '18211826898', '白林正', '活动类', 6000.00, '赏头条，支持你，加油。', 1592576051);
INSERT INTO `ss_settled` VALUES (147, 72811, '15601112721', '15601112721', '孙新兰', '15601112721', '孙新兰', '活动类', 6000.00, '多少商家', 1592612522);
INSERT INTO `ss_settled` VALUES (148, 84623, '13941089930', '13941089930', '高香芹', '13941089930', '高香芹', '活动类', 50000.00, '赏头条', 1592616630);
INSERT INTO `ss_settled` VALUES (149, 84763, '13331122799', '13331122799', '成秀芝', '13331122799', '成秀芝', '活动类', 30000.00, '签到', 1592622650);
INSERT INTO `ss_settled` VALUES (150, 84763, '13331122799', '13331122799', '成秀芝', '13331122799', '成秀芝', '活动类', 6000.00, '签到', 1592630366);
INSERT INTO `ss_settled` VALUES (151, 85128, '18235841023', '18235841023', '幸福', '18235841023', '李凤伶', '经济类', 6000.00, '签到', 1592835435);
INSERT INTO `ss_settled` VALUES (152, 14200, '13439441046', '13439441046', '任丽霞', '13439441046', '任丽霞', '经济类', 6000.00, '中国银行', 1592927362);
INSERT INTO `ss_settled` VALUES (153, 79219, '13691163200', '13691163200', '李艳良', '13691163200', '李艳良', '活动类', 6000.00, '签到', 1593118826);
INSERT INTO `ss_settled` VALUES (154, 83412, '13261825262', '13261825262', '海滨', '13261825262', '闫海滨', '活动类', 6000.00, '话动', 1593163225);
INSERT INTO `ss_settled` VALUES (155, 86064, '13831272735', '13831272735', '王占云', '13831272735', '王占云', '活动类', 10000.00, '不知道怎么办', 1593386381);
INSERT INTO `ss_settled` VALUES (156, 27789, '13835824564', '13835824564', '陈晋绥', '13835824564', '陈晋绥', '企业类', 500000.00, '泰化石油', 1593421162);
INSERT INTO `ss_settled` VALUES (157, 24594, '17795524799', '17795524799', '马福梅', '17695236150', '马维兵', '活动类', 500000.00, '兄弟', 1593491963);
INSERT INTO `ss_settled` VALUES (158, 86975, '15303483825', '15303483825', '吉祥如意', '15303483825', '吉祥如意', '活动类', 6000.00, '努力奋斗', 1593589805);
INSERT INTO `ss_settled` VALUES (159, 24853, '15844683460', '15844683460', '张福', '15844683460', '张福', '活动类', 6000.00, '参与赏头条', 1593608236);
INSERT INTO `ss_settled` VALUES (160, 24853, '15844683460', '15844683460', '张福', '15844683460', '张福', '活动类', 6000.00, '参与赏头条', 1593608237);
INSERT INTO `ss_settled` VALUES (161, 18525, '15293214161', '15293214161', '丁军', '15293214161', '丁军', '活动类', 6000.00, '商家', 1593648216);
INSERT INTO `ss_settled` VALUES (162, 25449, '15033235759', '15033235759', '宋增芳', '15227050058', '王双进', '新媒类', 6000.00, '赏头条', 1593741390);
INSERT INTO `ss_settled` VALUES (163, 87186, '13546279683', '13546279683', '双喜盈门', '13546279683', '刘爱香', '活动类', 50000.00, '我加入了', 1593790890);
INSERT INTO `ss_settled` VALUES (164, 71669, '13671365204', '13671365204', '郭淑兰', '13671365204', '郭淑兰', '活动类', 10000.00, '签到', 1593905086);
INSERT INTO `ss_settled` VALUES (165, 25503, '15835812225', '15835812225', '许荷珍', '15835812225', '许荷珍', '企业类', 6000.00, '商业买上票很好', 1593986072);
INSERT INTO `ss_settled` VALUES (166, 79219, '13691163200', '13691163200', '李艳良', '13691163200', '李艳良', '活动类', 6000.00, '签到', 1594016876);
INSERT INTO `ss_settled` VALUES (167, 87658, '13103583931', '13103583931', '秦香瑞', '13103583931', '秦香瑞', '活动类', 500000.00, '万一.李', 1594028149);
INSERT INTO `ss_settled` VALUES (168, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594253187);
INSERT INTO `ss_settled` VALUES (169, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594253470);
INSERT INTO `ss_settled` VALUES (170, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594253833);
INSERT INTO `ss_settled` VALUES (171, 24913, '13934117679', '13934117679', '李春连', '13934117679', '李春连', '活动类', 6000.00, '打赏', 1594262049);
INSERT INTO `ss_settled` VALUES (172, 24913, '13934117679', '13934117679', '李春连', '13934117679', '李春连', '活动类', 6000.00, '打赏', 1594262127);
INSERT INTO `ss_settled` VALUES (173, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594337073);
INSERT INTO `ss_settled` VALUES (174, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594337584);
INSERT INTO `ss_settled` VALUES (175, 86237, '13141333478', '13141333478', '刘奇', '13141333478', '刘奇', '活动类', 6000.00, '释宁堂商贸有限责任公司是一家以药食同源的零售企业. 现有品牌外用膏药（释宁堂医用冷敷贴）上市两年取的良好的口碑.给风湿的患者代来福音。', 1594345899);
INSERT INTO `ss_settled` VALUES (176, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594424146);
INSERT INTO `ss_settled` VALUES (177, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594424206);
INSERT INTO `ss_settled` VALUES (178, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594511420);
INSERT INTO `ss_settled` VALUES (179, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594597357);
INSERT INTO `ss_settled` VALUES (180, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594683737);
INSERT INTO `ss_settled` VALUES (181, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594768257);
INSERT INTO `ss_settled` VALUES (182, 33523, '13521724228', '13521724228', '王美珍', '13521724228', '王美珍', '活动类', 6000.00, '打赏', 1594797877);
INSERT INTO `ss_settled` VALUES (183, 33523, '13521724228', '13521724228', '王美珍', '13521724228', '王美珍', '活动类', 6000.00, '打赏', 1594799286);
INSERT INTO `ss_settled` VALUES (184, 33523, '13521724228', '13521724228', '王美珍', '17800837697', '王美珍', '企业类', 6000.00, '打赏', 1594804159);
INSERT INTO `ss_settled` VALUES (185, 33523, '13521724228', '13521724228', '王美珍', '13521724228', '王美珍', '企业类', 6000.00, '打赏', 1594808904);
INSERT INTO `ss_settled` VALUES (186, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594853010);
INSERT INTO `ss_settled` VALUES (187, 33523, '13521724228', '13521724228', '王美珍', '13521724228', '王美珍', '企业类', 6000.00, '打赏', 1594884598);
INSERT INTO `ss_settled` VALUES (188, 82182, '17801164838', '17801164838', '大龙', '17801164838', '吴龙', '美容类', 6000.00, '产品特别好，口碑也好', 1594907936);
INSERT INTO `ss_settled` VALUES (189, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1594940532);
INSERT INTO `ss_settled` VALUES (190, 34949, '13394464196', '13394464196', '刘秋玉', '13394464196', '刘秋玉', '活动类', 6000.00, 'shao di', 1595006390);
INSERT INTO `ss_settled` VALUES (191, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1595028369);
INSERT INTO `ss_settled` VALUES (192, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1595113146);
INSERT INTO `ss_settled` VALUES (193, 87787, '15011403159', '15011403159', '张淑琴', '15011403159', '张淑琴', '活动类', 6000.00, '赏头条', 1595286544);
INSERT INTO `ss_settled` VALUES (194, 35709, '13001084839', '13001084839', '王淑美', '13001084839', '王淑美', '活动类', 6000.00, '打實', 1595379546);
INSERT INTO `ss_settled` VALUES (195, 35709, '13001084839', '13001084839', '王淑美', '13001084839', '王淑美', '企业类', 6000.00, '打赏', 1595379726);
INSERT INTO `ss_settled` VALUES (196, 85799, '13121602876', '13121602876', '孙正红', '13121602876', '孙正红', '活动类', 50000.00, '台值酒，喝得就是超值，酒质和x台极为相似，入口醇香，回味悠长，酱香突出，空杯留香；\n浓香京驾贡酒，洋河第一酿酒厂生产，酒质堪比x蓝，入口绵柔，回味悠长！', 1595821990);
INSERT INTO `ss_settled` VALUES (197, 18486, '18271204857', '18271204857', '欧群玖', '18271204857', '欧群玖', '新奇类', 100000.00, 'v发发发的地方短头发', 1597015293);
INSERT INTO `ss_settled` VALUES (198, 76641, '13681102274', '13681102274', '杨文华', '13681102274', '杨文华', '企业类', 6000.00, '一个星期一次', 1597029189);
INSERT INTO `ss_settled` VALUES (199, 76641, '13681102274', '13681102274', '杨文华', '13681102274', '杨文华', '活动类', 10000.00, '他人操做', 1597029283);
INSERT INTO `ss_settled` VALUES (200, 17828, '18309566861', '18309566861', '刘润润', '18309566861', '刘润润', '活动类', 6000.00, '打赏', 1597061484);
INSERT INTO `ss_settled` VALUES (201, 82182, '17801164838', '17801164838', '大龙', '17801164838', '吴龙', '美容类', 6000.00, '货真价实', 1597155764);
INSERT INTO `ss_settled` VALUES (202, 77574, '17310825052', '17310825052', '常淑芹', '17310825052', '常淑芹', '经济类', 6000.00, '我、愿国家经济迅速发展，民族企业更加强大\n\n我愿国家经济迅速发展，民族企业強大', 1597168695);
INSERT INTO `ss_settled` VALUES (203, 23557, '18392258830', '18392258830', '马晓春', '18220298587', '王丽', '活动类', 6000.00, '打赏', 1597623505);

SET FOREIGN_KEY_CHECKS = 1;
