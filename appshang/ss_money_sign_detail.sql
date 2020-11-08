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

 Date: 22/08/2020 22:18:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ss_money_sign_detail
-- ----------------------------
DROP TABLE IF EXISTS `ss_money_sign_detail`;
CREATE TABLE `ss_money_sign_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sign' COMMENT '记录类型',
  `inc_money` decimal(13, 2) NOT NULL DEFAULT 0.00 COMMENT '增加金额',
  `dec_money` decimal(13, 2) NOT NULL DEFAULT 0.00 COMMENT '减少金额',
  `content` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录说明',
  `mtype` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'get_coin' COMMENT '资金种类',
  `over_money` decimal(13, 2) NULL DEFAULT NULL COMMENT '更新之后的金额',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `datestr` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`uid`, `type`) USING BTREE,
  INDEX `index2`(`uid`, `mtype`) USING BTREE,
  INDEX `index3`(`account`) USING BTREE,
  INDEX `index4`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签到财务明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ss_money_sign_detail
-- ----------------------------
INSERT INTO `ss_money_sign_detail` VALUES (1, 10026, '小胖', '15141155678', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2564.00, 1597999536, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (2, 23494, '孙晓梅', '18732471555', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 323672.00, 1597999555, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (3, 79316, '王启国', '18560171621', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2392.00, 1598004221, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (4, 76481, '任兰珍', '15234382208', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 118.00, 1598006056, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (5, 27367, '韩桂海', '18235809957', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 137.00, 1598006305, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (6, 35033, '贺超', '18196100168', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2914.00, 1598007910, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (7, 10249, '郭清磊', '15133887388', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 5438541.00, 1598009033, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (8, 35063, '王葳葳', '13621323653', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 186.00, 1598010945, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (9, 30735, '白金环', '13260281683', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3470.00, 1598012932, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (10, 10149, '庞玉霞', '15910996022', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4245.00, 1598013003, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (11, 78255, '穆淑兰', '18035807660', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1748.00, 1598014009, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (12, 84487, '孙登建', '15034289916', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 116.00, 1598014064, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (13, 71924, '王美荣', '18435810377', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1858.00, 1598015302, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (14, 29007, '沈力', '13910207058', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4768.00, 1598018940, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (15, 32512, '孙主军', '15321332280', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4764.00, 1598019031, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (16, 15961, '李玉梅', '15894826093', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 220.00, 1598020440, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (17, 82028, '李红艳', '13220581028', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 5568.00, 1598021098, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (18, 82029, '刘滨', '13658617528', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 5060.00, 1598021100, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (19, 78445, '王太凤', '18789111430', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4526.00, 1598024453, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (20, 34827, '丁晓刚', '18991702697', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2784.00, 1598025338, '20200821');
INSERT INTO `ss_money_sign_detail` VALUES (21, 34827, '丁晓刚', '18991702697', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2787.00, 1598025653, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (22, 30735, '白金环', '13260281683', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3474.00, 1598027385, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (23, 15971, '刘金凤', '15671126951', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3586.00, 1598034119, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (24, 17872, '胡波', '13025767888', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2024.00, 1598034397, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (25, 32946, '刘从付', '18590141798', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3584.00, 1598034491, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (26, 76481, '任兰珍', '15234382208', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 120.00, 1598045758, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (27, 10281, '李玉瑛', '18211085118', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 220.00, 1598046162, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (28, 31908, '韩巧林', '15035875749', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 126.00, 1598047380, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (29, 29305, '王树荣', '15235826398', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 113.00, 1598047537, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (30, 10119, '高秀明', '13552575758', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 7446.00, 1598048053, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (31, 56036, '张微', '13691017343', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 176.00, 1598048130, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (32, 19023, '刘怀义', '15554443810', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 234.00, 1598048638, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (33, 19097, '张翠兰', '15666074807', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 232.00, 1598048816, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (34, 31109, '冯奶岐', '13753838928', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 168.00, 1598048942, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (35, 88226, '闫军', '13504134122', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 54.00, 1598048956, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (36, 75375, '王侯娥', '18534763774', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 82.00, 1598049773, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (37, 25052, '任永军', '18303488010', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4251.00, 1598049803, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (38, 27426, '张继娥', '15735858515', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4246.00, 1598049854, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (39, 81347, '成春林', '15035821516', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 108.00, 1598049886, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (40, 84494, '任正全', '18235851222', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 122.00, 1598049911, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (41, 82229, '贾支会', '15235877405', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 104.00, 1598049938, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (42, 86967, '赵花', '13453816880', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 94.00, 1598050221, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (43, 24158, '任鹏飞', '15135841333', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 92.00, 1598050429, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (44, 68321, '刘喜民', '18534575188', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2776.00, 1598050449, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (45, 30894, '孟和平', '13903401295', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2919.00, 1598051835, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (46, 80794, '苏华', '13296448553', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 78.00, 1598052377, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (47, 72913, '小秀', '13552865482', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 6515.00, 1598053503, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (48, 10041, '张秀珍', '13681504897', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1593.00, 1598053659, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (49, 15807, '赵永玲', '13546016872', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 175.00, 1598053697, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (50, 78445, '王太凤', '18789111430', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4528.00, 1598055530, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (51, 78255, '穆淑兰', '18035807660', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1750.00, 1598055828, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (52, 84487, '孙登建', '15034289916', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 118.00, 1598056035, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (53, 86122, '朱满秀', '17358858837', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3050.00, 1598056739, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (54, 18820, '郭泽才', '13863528332', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3454.00, 1598057525, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (55, 18525, '丁军', '15293214161', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3714.00, 1598057574, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (56, 24631, '张俊勇', '15158311369', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3864.00, 1598058300, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (57, 15961, '李玉梅', '15894826093', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 225.00, 1598058618, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (58, 32620, '张焦娃', '18393772072', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3594.00, 1598059323, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (59, 27022, '薛晓强', '18035807030', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 122601.00, 1598060733, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (60, 23787, '顾建华', '18931421072', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2938.00, 1598062372, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (61, 27221, '罗祥', '13717599020', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3512.00, 1598062654, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (62, 27367, '韩桂海', '18235809957', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 139.00, 1598062707, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (63, 79610, '杨林生', '15390267887', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2733.00, 1598063605, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (64, 20385, '刘时', '15829330827', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2667.00, 1598064163, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (65, 72728, '刘庆祝', '13693288321', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 170.00, 1598064709, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (66, 77803, '谢晓英', '13439912316', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 155.00, 1598064911, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (67, 81520, '刘年应', '13503584448', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4250.00, 1598065270, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (68, 14928, '18981678236', '18981678236', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1896.00, 1598065338, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (69, 85447, '王清娥', '15834390993', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 112.00, 1598065376, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (70, 26767, '高飞', '15024915023', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 112.00, 1598065989, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (71, 18345, '王元林', '13303580695', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1192.00, 1598066000, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (72, 35184, '杨冬冬', '18617448008', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2820.00, 1598066420, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (73, 88078, '李桂花', '15820069170', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 84.00, 1598066873, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (74, 27969, '邓志成', '15011270186', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4373.00, 1598067587, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (75, 10183, '张树萍', '13520631858', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3984.00, 1598067627, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (76, 71996, '9274', '13006849274', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 5462.00, 1598067658, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (77, 71998, '7917', '15731607917', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 5462.00, 1598067696, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (78, 71997, '4442', '16711684442', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 5462.00, 1598067732, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (79, 72095, '高成仁', '16574322902', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 7572.00, 1598067899, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (80, 10149, '庞玉霞', '15910996022', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4247.00, 1598067982, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (81, 10034, '胡贵生', '15611613262', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4602.00, 1598070166, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (82, 48289, '王爱梅', '16723589669', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 90.00, 1598070409, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (83, 79708, '庞艳萍', '15937943908', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4764.00, 1598071801, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (84, 32963, '铂源', '13521315371', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4532.00, 1598071837, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (85, 81608, '铂涛', '17181040035', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2992.00, 1598071890, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (86, 32954, '铂润', '18310319703', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4682.00, 1598071932, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (87, 32512, '孙主军', '15321332280', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4766.00, 1598071963, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (88, 29007, '沈力', '13910207058', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4770.00, 1598071994, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (89, 80815, '张明月', '13691542272', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 108.00, 1598072679, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (90, 82359, '刘战社', '13720925339', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 72.00, 1598073810, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (91, 17768, '郑定泉', '17688746825', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3414.00, 1598073822, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (92, 14978, '赵泽阶', '15057903552', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 68.00, 1598074213, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (93, 10551, '朱元林', '15750108453', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3258.00, 1598074662, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (94, 17687, '赵泽学', '13065917052', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3710.00, 1598075008, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (95, 14329, '蔡向福', '15886767707', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3714.00, 1598075188, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (96, 19541, '李国政', '16561922596', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3318.00, 1598075324, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (97, 16775, '蔡友须', '13275051675', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2674.00, 1598075365, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (98, 18717, '赵正林', '18788700165', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1628.00, 1598075386, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (99, 17060, '李开温', '18337599128', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 192.00, 1598075398, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (100, 14645, '刘志炜', '13132435522', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2513.00, 1598075534, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (101, 27197, '王静静', '15225569373', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2514.00, 1598075719, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (102, 17135, '代奎', '13253197150', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 46.00, 1598075732, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (103, 14217, '冯登', '13825283358', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3452.00, 1598075839, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (104, 15144, '赵泽胜', '15186929701', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 722.00, 1598075844, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (105, 15463, '曲波', '15042584139', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 176.00, 1598075872, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (106, 17644, '王守顺', '18130433545', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1748.00, 1598075971, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (107, 30536, '陈双葵', '17700753149', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 208.00, 1598076050, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (108, 75957, '王瑞强', '15386989148', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 122.00, 1598076124, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (109, 14213, '闫永锋', '18291756421', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2935.00, 1598076256, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (110, 14646, '白建新', '15126377464', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3584.00, 1598076428, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (111, 14274, '武金光', '13994829969', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3710.00, 1598076539, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (112, 14836, '王永梅', '13439529016', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3716.00, 1598076562, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (113, 22837, '郭成然', '15993210535', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3716.00, 1598076671, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (114, 27965, '杜明芳', '13259332991', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3712.00, 1598076726, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (115, 15728, '程贵兰', '13849401400', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 220.00, 1598076737, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (116, 14219, '郭峰', '13683106218', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2674.00, 1598076762, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (117, 16256, '李为平', '17814688858', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 252.00, 1598076784, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (118, 14383, '李艳艳', '13526252396', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 70.00, 1598076807, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (119, 33029, '邵一倩', '18310663489', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1982.00, 1598076937, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (120, 18969, '郭姣姣', '13753351559', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3710.00, 1598077019, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (121, 14926, '毕江', '15688330771', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3317.00, 1598077071, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (122, 14574, '吕晓琴', '15191999586', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1110.00, 1598077195, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (123, 14312, '王福', '17159134000', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2672.00, 1598077269, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (124, 14660, '闫琪', '17635336618', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3720.00, 1598077270, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (125, 17111, '刘俊霞', '15769220806', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2152.00, 1598077311, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (126, 14288, '余倡芝', '14753061399', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 196.00, 1598077402, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (127, 26573, '柳树', '18618493056', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1149390.00, 1598077688, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (128, 14442, '李洪义', '15053070777', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3716.00, 1598077757, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (129, 14871, '姚树红', '14753061499', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 74.00, 1598077827, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (130, 26756, '孟鑫', '15810594825', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1990.00, 1598077870, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (131, 25600, '柳召伟', '13522813056', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 10376.00, 1598077921, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (132, 28363, '孟树青', '15235594136', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 146.00, 1598077984, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (133, 19570, '曹银辉', '18135188185', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1636.00, 1598078016, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (134, 28358, '李雪平', '17600725158', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 150.00, 1598078019, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (135, 14674, '程学文', '17701207310', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2934.00, 1598078118, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (136, 24054, '高建光', '15006619432', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 1337.00, 1598078157, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (137, 27974, '曹双对', '13453712479', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3578.00, 1598078192, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (138, 14357, '肖兵', '18600539273', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2344.00, 1598078244, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (139, 25506, '冯春勤', '13882579811', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 244.00, 1598078309, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (140, 14789, '苏存海', '15374916333', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3720.00, 1598078327, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (141, 14879, '吴懋华', '15728825365', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3716.00, 1598078351, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (142, 17779, '冉啟英', '13520458165', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3456.00, 1598078696, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (143, 77592, '施静红', '15912473425', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3339.00, 1598078840, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (144, 14380, '李玉荣', '18195279349', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3448.00, 1598078920, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (145, 14919, '张文军', '18089358129', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2804.00, 1598079264, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (146, 17090, '李鹏', '13663599363', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2512.00, 1598079558, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (147, 20457, '伍锡碧', '18282579752', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 226.00, 1598079952, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (148, 32836, '付爱民', '17773590243', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3314.00, 1598080135, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (149, 29147, '蔡晓培', '18337507225', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3298.00, 1598080272, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (150, 18412, '任小辉', '13782834992', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2272.00, 1598080838, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (151, 15915, '王福香', '13821569752', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 814.00, 1598081086, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (152, 15896, '阿比尔且', '13037771163', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3038.00, 1598081356, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (153, 26097, '刘本强', '13329026982', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3558.00, 1598082290, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (154, 33370, '王晓丽', '15635399996', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3578.00, 1598083652, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (155, 15013, '谢振明', '18039722789', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 188.00, 1598083980, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (156, 14443, '胡乐涛', '18686720328', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3.00, 1598084234, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (157, 14847, '李素英', '13714966945', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 232.00, 1598084797, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (158, 16491, '程庆发', '17339860907', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2920.00, 1598085199, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (159, 27804, '滕莉', '18963351169', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3324.00, 1598085331, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (160, 18952, '杨亮', '13904383969', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4562.00, 1598086018, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (161, 44594, '朱淑侠', '13624388123', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 6118.00, 1598086136, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (162, 84416, '魏恩', '17716599899', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4553.00, 1598086507, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (163, 27179, '武慧珍', '15835163196', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2904.00, 1598087893, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (164, 14783, '孔勇', '13853788518', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3196.00, 1598088694, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (165, 22959, '王宇', '13157407939', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2639.00, 1598089092, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (166, 23494, '孙晓梅', '18732471555', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 323703.00, 1598089131, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (167, 22253, '李荣生', '15535322588', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2800.00, 1598089713, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (168, 82966, '吴训英', '18076326903', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 58.00, 1598090518, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (169, 14550, '刘晋', '15060138129', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 8.00, 1598090865, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (170, 20047, '郑艳丽', '13572695504', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3196.00, 1598091303, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (171, 14393, '张凤琴', '15834289228', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3718.00, 1598091451, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (172, 27364, '郭玉娥', '18763063279', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 220.00, 1598093070, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (173, 17082, '张东东', '15954365953', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3324.00, 1598093238, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (174, 79316, '王启国', '18560171621', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2394.00, 1598093898, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (175, 23612, '陈秉顺', '17606405418', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 208.00, 1598094054, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (176, 73288, '陈爱珍', '18560243829', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2524.00, 1598094159, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (177, 29638, '李超', '13676324626', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2936.00, 1598094680, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (178, 83201, '欧阳凯', '18075535207', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2917.00, 1598095087, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (179, 15979, '妥占山', '13299852323', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3326.00, 1598095493, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (180, 17652, '妥秀珍', '15309727472', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 72.00, 1598095988, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (181, 88035, '王晶晶', '18735853582', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2533.00, 1598096668, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (182, 14373, '罗雄筹', '17376322599', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 140.00, 1598097118, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (183, 16915, '李晓霞', '18235315966', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2896.00, 1598097637, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (184, 78152, '7281', '13521247281', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3512.00, 1598097998, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (185, 10159, '张桂凤', '13681221174', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4240.00, 1598098043, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (186, 27985, '奚燕菲', '18311195114', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 4374.00, 1598098136, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (187, 34507, '张永丽', '15035346624', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3724.00, 1598099508, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (188, 45825, '杨冰洋', '18243820385', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 170.00, 1598100363, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (189, 33164, '何放', '13311070236', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 162.00, 1598100522, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (190, 16782, '蒋峰', '13734874902', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 3634.00, 1598100575, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (191, 34606, '王世铭', '15835803557', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 154.00, 1598100831, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (192, 20443, '乔直勇', '13963781028', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2022.00, 1598101483, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (193, 20045, '王涛', '15039620258', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 5054.00, 1598102450, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (194, 14980, '张雪琴', '17777397522', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 204.00, 1598102518, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (195, 14606, '汤继慧', '18315159434', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2796.00, 1598103955, '20200822');
INSERT INTO `ss_money_sign_detail` VALUES (196, 14945, '张建华', '13884299993', 'sign', 2.00, 0.00, '每日签到赠送2个币', 'get_coin', 2516.00, 1598104722, '20200822');

SET FOREIGN_KEY_CHECKS = 1;
