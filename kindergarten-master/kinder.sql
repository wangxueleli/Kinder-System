/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50558
Source Host           : localhost:3306
Source Database       : kinder

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-09-05 08:40:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accident`
-- ----------------------------
DROP TABLE IF EXISTS `accident`;
CREATE TABLE `accident` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `date` date DEFAULT NULL,
  `accident` varchar(255) DEFAULT NULL COMMENT '事故',
  `dispose` varchar(255) DEFAULT NULL COMMENT '处理方式',
  `inform` varchar(255) DEFAULT NULL COMMENT '通告家长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accident
-- ----------------------------
INSERT INTO `accident` VALUES ('1', '张雨婷', '2018-03-07', '肚子疼', '送医院', '电话');
INSERT INTO `accident` VALUES ('2', '张龙', '2018-04-19', '发烧', '送医院', '电话');
INSERT INTO `accident` VALUES ('3', '何天霸', '2018-05-17', '摔倒', '医务室', '短息');

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `times` date DEFAULT NULL,
  `daytime` int(32) DEFAULT NULL,
  `leader` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '春游活动', '2018-03-10', '1', '王莉', '15184372180', '开拓视野,增长知识,亲近动物,喜爱动物.');
INSERT INTO `activity` VALUES ('2', '夏令营活动', '2018-07-10', '10', '王莉', '15184372180', '让孩子们感受生活.');
INSERT INTO `activity` VALUES ('3', '秋令营', '2018-09-30', '1', '王莉', '15184372180', '');
INSERT INTO `activity` VALUES ('4', '冬令营活动', '2018-01-01', '10', '王莉李', '15184372180', '让孩子感受生活');
INSERT INTO `activity` VALUES ('6', '小鸡拾米', '2018-05-09', '1', '陶李莎', '18780138860', null);
INSERT INTO `activity` VALUES ('7', '粘贴蝴蝶', '2018-04-15', '1', '陶李莎', '18780138860', null);
INSERT INTO `activity` VALUES ('8', '蚂蚁搬豆', '2018-03-20', '1', '陶李莎', '18780138860', null);
INSERT INTO `activity` VALUES ('9', '亲子贴鼻子', '2018-04-20', '1', '何杰', '15982467120', null);
INSERT INTO `activity` VALUES ('10', '我的宝宝在哪里', '2018-05-10', '2', '何杰', '15982467120', '1');
INSERT INTO `activity` VALUES ('11', '我给爸爸(妈妈)穿鞋子', '2018-05-20', '1', '何杰', '15982467120', null);

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL DEFAULT '0',
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '管理员', '752480087@qq.com', '博苑幼儿园');

-- ----------------------------
-- Table structure for `charging`
-- ----------------------------
DROP TABLE IF EXISTS `charging`;
CREATE TABLE `charging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pricetype` varchar(255) DEFAULT NULL,
  `price` double(11,0) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updatatime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of charging
-- ----------------------------
INSERT INTO `charging` VALUES ('1', '大班_学费', '5000', '书本费用1', '2018-09-03 11:30:29');
INSERT INTO `charging` VALUES ('2', '中班_学费', '4000', '书本费用1', '2018-09-03 16:24:43');
INSERT INTO `charging` VALUES ('3', '小班_学费', '3000', '书本费用', '2018-08-29 15:37:27');
INSERT INTO `charging` VALUES ('4', '生活费', '3000', '一学期', '2018-08-29 15:37:27');
INSERT INTO `charging` VALUES ('5', '校车费', '2000', '一学期1', '2018-09-03 16:24:43');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(32) NOT NULL,
  `brzno` int(11) NOT NULL,
  `countp` int(11) NOT NULL,
  `nowp` int(11) NOT NULL,
  `fatherid` int(11) NOT NULL,
  PRIMARY KEY (`classno`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '一班', '女生多', '1', '30', '8', '1');
INSERT INTO `class` VALUES ('2', '二班', '男生多', '2', '30', '11', '1');
INSERT INTO `class` VALUES ('3', '三班', '中和', '3', '30', '1', '1');
INSERT INTO `class` VALUES ('4', '一班', '数学优先', '4', '35', '11', '2');
INSERT INTO `class` VALUES ('5', '二班', '英语优先', '5', '35', '-1', '2');
INSERT INTO `class` VALUES ('6', '幼儿一班', '幼教培养', '6', '28', '22', '3');
INSERT INTO `class` VALUES ('7', '幼儿二班', '幼教培养', '7', '28', '0', '3');

-- ----------------------------
-- Table structure for `classes`
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `classNo` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `teacher` varchar(32) NOT NULL,
  `classType` varchar(32) NOT NULL,
  `claName` varchar(16) NOT NULL,
  `stuNumber` int(11) NOT NULL DEFAULT '0',
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`classNo`),
  KEY `teacher` (`teacher`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('1', '一班', '张成', '幼儿小班', '幼儿小班一班', '11', '2018-09-02 16:44:21');
INSERT INTO `classes` VALUES ('2', '二班', '张丰', '幼儿小班', '幼儿小班二班', '12', '2018-09-02 16:44:33');
INSERT INTO `classes` VALUES ('3', '一班', '张时', '幼儿中班', '幼儿中班一班', '14', '2018-09-02 16:44:42');
INSERT INTO `classes` VALUES ('4', '二班', '张里', '幼儿中班', '幼儿中班二班', '16', '2018-09-02 16:44:50');
INSERT INTO `classes` VALUES ('5', '一班', '李多', '幼儿大班', '幼儿大班一班', '14', '2018-09-02 16:45:04');
INSERT INTO `classes` VALUES ('6', '二班', '李真', '幼儿大班', '幼儿大班二班', '7', '2018-09-02 16:45:18');

-- ----------------------------
-- Table structure for `classsort`
-- ----------------------------
DROP TABLE IF EXISTS `classsort`;
CREATE TABLE `classsort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classsort
-- ----------------------------
INSERT INTO `classsort` VALUES ('1', '大班');
INSERT INTO `classsort` VALUES ('2', '中班');
INSERT INTO `classsort` VALUES ('3', '小班');

-- ----------------------------
-- Table structure for `fees`
-- ----------------------------
DROP TABLE IF EXISTS `fees`;
CREATE TABLE `fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feesort` varchar(16) NOT NULL,
  `fatherclass` varchar(16) NOT NULL,
  `money` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fees
-- ----------------------------
INSERT INTO `fees` VALUES ('1', '学费1', '大班', '6000');
INSERT INTO `fees` VALUES ('2', '学费', '中班', '8000');
INSERT INTO `fees` VALUES ('3', '学费', '小班', '10000');
INSERT INTO `fees` VALUES ('4', '车费1', '大班', '300');
INSERT INTO `fees` VALUES ('5', '车费', '中班', '400');
INSERT INTO `fees` VALUES ('6', '车费', '小班', '500');
INSERT INTO `fees` VALUES ('7', '生活费1', '大班', '200');
INSERT INTO `fees` VALUES ('8', '生活费', '中班', '300');
INSERT INTO `fees` VALUES ('9', '生活费', '小班', '400');

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classType` varchar(32) NOT NULL,
  `descri` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', '幼儿小班', '适合2-3岁小孩');
INSERT INTO `grade` VALUES ('2', '幼儿中班', '适合4-5岁小孩');
INSERT INTO `grade` VALUES ('3', '幼儿大班', '适合5-7岁小孩');

-- ----------------------------
-- Table structure for `lessons`
-- ----------------------------
DROP TABLE IF EXISTS `lessons`;
CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weekTime` varchar(32) NOT NULL,
  `poTime` varchar(32) NOT NULL,
  `classType` varchar(16) NOT NULL,
  `className` varchar(16) NOT NULL,
  `teacherName` varchar(32) NOT NULL,
  `courseName` varchar(16) NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lessons
-- ----------------------------
INSERT INTO `lessons` VALUES ('1000', '1', '2', '幼儿小班', '一班', '张丰', '语言', '2018-09-02 16:47:08');
INSERT INTO `lessons` VALUES ('1001', '2', '3', '幼儿中班', '一班', '张丰', '语言', '2018-09-02 16:47:20');
INSERT INTO `lessons` VALUES ('1002', '3', '3', '幼儿大班', '一班', '张丰', '语言', '2018-09-02 16:47:32');
INSERT INTO `lessons` VALUES ('1003', '5', '2', '幼儿大班', '二班', '张丰', '语言', '2018-09-02 16:47:44');
INSERT INTO `lessons` VALUES ('1004', '1', '1', '幼儿中班', '二班', '张成', '音乐', '2018-09-02 16:48:24');
INSERT INTO `lessons` VALUES ('1005', '2', '2', '幼儿中班', '二班', '张时', '画画', '2018-09-02 16:48:35');
INSERT INTO `lessons` VALUES ('1006', '3', '3', '幼儿中班', '二班', '李真', '英语', '2018-09-02 16:48:45');
INSERT INTO `lessons` VALUES ('1007', '4', '4', '幼儿中班', '二班', '李明', '阅读', '2018-09-02 16:48:57');
INSERT INTO `lessons` VALUES ('1008', '5', '3', '幼儿中班', '二班', '张里', '舞蹈', '2018-09-02 16:49:09');
INSERT INTO `lessons` VALUES ('1009', '5', '3', '幼儿中班', '请选择', '张时', '画画', '2018-09-03 16:19:20');

-- ----------------------------
-- Table structure for `level`
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drivername` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `cartime` varchar(32) NOT NULL,
  `lineno` int(11) NOT NULL,
  `cardes` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES ('1', '王远', '18022221111', '08：30', '1', '1级');
INSERT INTO `level` VALUES ('2', '王大力', '18022221113', '08：30', '2', '2级');
INSERT INTO `level` VALUES ('3', '王胜', '18022221115', '08：10', '2', '3级');

-- ----------------------------
-- Table structure for `morningcheck`
-- ----------------------------
DROP TABLE IF EXISTS `morningcheck`;
CREATE TABLE `morningcheck` (
  `stuno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `sex` varchar(4) NOT NULL,
  `age` int(11) NOT NULL,
  `classsort` varchar(16) NOT NULL,
  `classname` varchar(8) NOT NULL,
  `parentname` varchar(16) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `address` varchar(64) NOT NULL,
  `chefei` varchar(8) NOT NULL DEFAULT '0',
  `xuefei` varchar(8) NOT NULL DEFAULT '0',
  `chifei` varchar(8) NOT NULL DEFAULT '0',
  `carno` varchar(16) NOT NULL DEFAULT '无',
  PRIMARY KEY (`stuno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of morningcheck
-- ----------------------------

-- ----------------------------
-- Table structure for `recipe`
-- ----------------------------
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `week` varchar(32) DEFAULT NULL COMMENT '星期几',
  `breakfast` varchar(255) DEFAULT NULL COMMENT '早餐',
  `lunch` varchar(255) DEFAULT NULL COMMENT '午餐',
  `supper` varchar(255) DEFAULT NULL COMMENT '晚餐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recipe
-- ----------------------------
INSERT INTO `recipe` VALUES ('1', '星期一', '奶馒头,油酥饼,素炒油菜,牛奶', '太阳肉,肉片炒青椒,蒜香圆白菜,大骨萝卜汤,米饭,圣女果', '三鲜包,翡翠豆芽,紫米粥');
INSERT INTO `recipe` VALUES ('2', '星期二', '五香鸡蛋,千层饼,素炒土豆丝,小米粥', '樱桃丸子,西芹百合,脆皮茄条,蟹棒香菜汤,麻酱饼,米饭,哈密瓜', '红烧肉炖粉条,木耳黄瓜片,黄金饼,翡翠白玉汤,米饭');
INSERT INTO `recipe` VALUES ('3', '星期三', '杂粮馒头,豆沙饼,素什锦,牛奶', '红烧鸡块,蚂蚁上树,紫菜汤,蜜枣发糕,冬瓜汤,米饭,甜桃', '京酱肉丝,粉丝盖菜,香菜鱼丸汤,荷叶夹饼,米饭');
INSERT INTO `recipe` VALUES ('4', '星期四', '五香鹌鹑蛋,葱花饼,炒双丝,二米粥', '葱爆肉,肉末豆角,彩椒豆腐丝,单饼,菠菜汤,米饭,香蕉', '意大利肉酱面,素炒甘蓝,五彩珍珠疙瘩汤');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` int(11) DEFAULT NULL,
  `studentname` varchar(255) DEFAULT NULL,
  `clas` varchar(255) DEFAULT NULL,
  `pricetype` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `person` varchar(255) DEFAULT '...',
  `time` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT '...',
  `updatatime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('27', '37', '张雨婷77', '中班_一班', '学费', '已缴费', 'admin', '2018-08-29 15:33:09', '...', '2018-08-30 17:13:39');
INSERT INTO `record` VALUES ('28', '37', '张雨婷77', '中班_一班', '车费', '未缴费', '...', '2018-08-29 15:33:09', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('29', '37', '张雨婷77', '中班_一班', '生活费', '已缴费', '...', '2018-08-29 15:33:09', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('30', '38', '李丽珍', '小班_幼儿二班', '学费', '已缴费', '...', '2018-08-29 16:55:55', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('31', '38', '李丽珍', '小班_幼儿二班', '车费', '未缴费', '...', '2018-08-29 16:55:55', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('32', '38', '李丽珍', '小班_幼儿二班', '生活费', '已缴费', '...', '2018-08-29 16:55:55', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('33', '39', '张雨婷', '幼儿大班_一班', '学费', '已缴费', '...', '2018-08-29 19:24:28', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('34', '39', '张雨婷', '幼儿大班_一班', '车费', '已缴费', '...', '2018-08-29 19:24:28', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('35', '39', '张雨婷', '幼儿大班_一班', '生活费', '未缴费', '...', '2018-08-29 19:24:28', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('36', '40', '刘红', '幼儿小班_一班', '学费', '已缴费', '...', '2018-08-29 19:26:25', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('37', '40', '刘红', '幼儿小班_一班', '车费', '已缴费', '...', '2018-08-29 19:26:25', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('38', '40', '刘红', '幼儿小班_一班', '生活费', '已缴费', '...', '2018-08-29 19:26:25', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('39', '41', '李丽珍', '幼儿中班_二班', '学费', '已缴费', '...', '2018-08-29 19:27:28', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('40', '41', '李丽珍', '幼儿中班_二班', '车费', '未缴费', '...', '2018-08-29 19:27:28', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('41', '41', '李丽珍', '幼儿中班_二班', '生活费', '未缴费', '...', '2018-08-29 19:27:28', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('42', '42', '黄龙', '幼儿中班_二班', '学费', '已缴费', '...', '2018-08-29 19:28:47', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('43', '42', '黄龙', '幼儿中班_二班', '车费', '已缴费', '...', '2018-08-29 19:28:47', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('44', '42', '黄龙', '幼儿中班_二班', '生活费', '已缴费', '...', '2018-08-29 19:28:47', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('45', '43', '何天霸', '幼儿中班_三班', '学费', '已缴费', '...', '2018-08-29 19:30:18', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('46', '43', '何天霸', '幼儿中班_三班', '车费', '未缴费', '...', '2018-08-29 19:30:18', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('47', '43', '何天霸', '幼儿中班_三班', '生活费', '未缴费', '...', '2018-08-29 19:30:18', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('48', '44', '马丽', '幼儿小班_一班', '学费', '已缴费', '...', '2018-08-29 19:31:42', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('49', '44', '马丽', '幼儿小班_一班', '车费', '未缴费', '...', '2018-08-29 19:31:42', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('50', '44', '马丽', '幼儿小班_一班', '生活费', '未缴费', '...', '2018-08-29 19:31:42', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('51', '45', '张雨婷3', '幼儿中班_二班', '学费', '已缴费', '...', '2018-08-29 19:33:30', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('52', '45', '张雨婷3', '幼儿中班_二班', '车费', '已缴费', '...', '2018-08-29 19:33:30', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('53', '45', '张雨婷3', '幼儿中班_二班', '生活费', '未缴费', '...', '2018-08-29 19:33:30', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('54', '46', '张雨婷33', '幼儿小班_一班', '学费', '已缴费', '...', '2018-08-29 19:34:14', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('55', '46', '张雨婷33', '幼儿小班_一班', '车费', '未缴费', '...', '2018-08-29 19:34:14', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('56', '46', '张雨婷33', '幼儿小班_一班', '生活费', '已缴费', '...', '2018-08-29 19:34:14', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('57', '47', '王大鹏', '幼儿中班_三班', '学费', '未缴费', '...', '2018-08-29 19:35:00', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('58', '47', '王大鹏', '幼儿中班_三班', '车费', '未缴费', '...', '2018-08-29 19:35:00', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('59', '47', '王大鹏', '幼儿中班_三班', '生活费', '未缴费', '...', '2018-08-29 19:35:00', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('60', '48', '张雨婷3333', '幼儿大班_二班', '学费', '已缴费', '...', '2018-08-29 19:35:59', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('61', '48', '张雨婷3333', '幼儿大班_二班', '车费', '未缴费', '...', '2018-08-29 19:35:59', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('62', '48', '张雨婷3333', '幼儿大班_二班', '生活费', '未缴费', '...', '2018-08-29 19:35:59', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('63', '49', '张雨婷55', '幼儿大班_二班', '学费', '已缴费', '...', '2018-08-29 19:36:50', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('64', '49', '张雨婷55', '幼儿大班_二班', '车费', '未缴费', '...', '2018-08-29 19:36:50', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('65', '49', '张雨婷55', '幼儿大班_二班', '生活费', '未缴费', '...', '2018-08-29 19:36:50', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('66', '50', '张雨婷3366', '幼儿大班_二班', '学费', '已缴费', '...', '2018-08-29 19:38:42', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('67', '50', '张雨婷3366', '幼儿大班_二班', '车费', '未缴费', '...', '2018-08-29 19:38:42', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('68', '50', '张雨婷3366', '幼儿大班_二班', '生活费', '已缴费', '...', '2018-08-29 19:38:42', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('69', '51', '张雨婷556', '幼儿大班_二班', '学费', '已缴费', '...', '2018-08-29 19:39:16', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('70', '51', '张雨婷556', '幼儿大班_二班', '车费', '未缴费', '...', '2018-08-29 19:39:16', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('71', '51', '张雨婷556', '幼儿大班_二班', '生活费', '未缴费', '...', '2018-08-29 19:39:16', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('72', '52', '赵高', '幼儿中班_二班', '学费', '已缴费', '...', '2018-08-29 19:39:59', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('73', '52', '赵高', '幼儿中班_二班', '车费', '未缴费', '...', '2018-08-29 19:39:59', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('74', '52', '赵高', '幼儿中班_二班', '生活费', '已缴费', '...', '2018-08-29 19:39:59', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('75', '53', '马棚', '幼儿小班_一班', '学费', '已缴费', '...', '2018-08-29 19:40:47', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('76', '53', '马棚', '幼儿小班_一班', '车费', '未缴费', '...', '2018-08-29 19:40:47', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('77', '53', '马棚', '幼儿小班_一班', '生活费', '未缴费', '...', '2018-08-29 19:40:47', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('78', '54', '高云', '学前班_一班', '学费', '已缴费', '...', '2018-08-29 19:44:04', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('79', '54', '高云', '学前班_一班', '车费', '未缴费', '...', '2018-08-29 19:44:04', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('80', '54', '高云', '学前班_一班', '生活费', '已缴费', '...', '2018-08-29 19:44:04', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('81', '55', '张雨婷3355', '幼儿大班_二班', '学费', '已缴费', '...', '2018-08-29 19:50:23', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('82', '55', '张雨婷3355', '幼儿大班_二班', '车费', '未缴费', '...', '2018-08-29 19:50:23', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('83', '55', '张雨婷3355', '幼儿大班_二班', '生活费', '未缴费', '...', '2018-08-29 19:50:23', '...', '2018-08-30 16:33:32');
INSERT INTO `record` VALUES ('93', '59', '张龙77', '幼儿中班_一班', '学费', '已缴费', 'admin', '2018-09-03 11:23:08', '...', '2018-09-03 11:31:43');
INSERT INTO `record` VALUES ('94', '59', '张龙77', '幼儿中班_一班', '车费', '已缴费', '...', '2018-09-03 11:23:08', '...', '2018-09-03 16:27:32');
INSERT INTO `record` VALUES ('95', '59', '张龙77', '幼儿中班_一班', '生活费', '未交费', 'admin', '2018-09-03 16:26:30', '...', '2018-09-03 16:27:32');

-- ----------------------------
-- Table structure for `schoolbus`
-- ----------------------------
DROP TABLE IF EXISTS `schoolbus`;
CREATE TABLE `schoolbus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drivername` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `cartime` varchar(32) NOT NULL,
  `lineno` int(11) NOT NULL,
  `cardes` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolbus
-- ----------------------------
INSERT INTO `schoolbus` VALUES ('1', '王远', '18022221111', '08：30', '1', '1号车');
INSERT INTO `schoolbus` VALUES ('2', '王大力', '18022221113', '08：30', '2', '2号车');

-- ----------------------------
-- Table structure for `sheet1`
-- ----------------------------
DROP TABLE IF EXISTS `sheet1`;
CREATE TABLE `sheet1` (
  `serial` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `fingerNO` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `1.1` time DEFAULT NULL,
  `1.2` time DEFAULT NULL,
  `2.1` time DEFAULT NULL,
  `2.2` time DEFAULT NULL,
  `3.1` time DEFAULT NULL,
  `3.2` time DEFAULT NULL,
  `4.1` time DEFAULT NULL,
  `4.2` time DEFAULT NULL,
  `5.1` time DEFAULT NULL,
  `5.2` time DEFAULT NULL,
  `6.1` time DEFAULT NULL,
  `6.2` time DEFAULT NULL,
  `7.1` time DEFAULT NULL,
  `7.2` time DEFAULT NULL,
  `8.1` time DEFAULT NULL,
  `8.2` time DEFAULT NULL,
  `9.1` time DEFAULT NULL,
  `9.2` time DEFAULT NULL,
  `10.1` time DEFAULT NULL,
  `10.2` time DEFAULT NULL,
  `11.1` time DEFAULT NULL,
  `11.2` time DEFAULT NULL,
  `12.1` time DEFAULT NULL,
  `12.2` time DEFAULT NULL,
  `13.1` time DEFAULT NULL,
  `13.2` time DEFAULT NULL,
  `14.1` time DEFAULT NULL,
  `14.2` time DEFAULT NULL,
  `15.1` time DEFAULT NULL,
  `15.2` time DEFAULT NULL,
  `16.1` time DEFAULT NULL,
  `16.2` time DEFAULT NULL,
  `17.1` time DEFAULT NULL,
  `17.2` time DEFAULT NULL,
  `18.1` time DEFAULT NULL,
  `18.2` time DEFAULT NULL,
  `19.1` time DEFAULT NULL,
  `19.2` time DEFAULT NULL,
  `20.1` time DEFAULT NULL,
  `20.2` time DEFAULT NULL,
  `21.1` time DEFAULT NULL,
  `21.2` time DEFAULT NULL,
  `22.1` time DEFAULT NULL,
  `22.2` time DEFAULT NULL,
  `23.1` time DEFAULT NULL,
  `23.2` time DEFAULT NULL,
  `24.1` time DEFAULT NULL,
  `24.2` time DEFAULT NULL,
  `25.1` time DEFAULT NULL,
  `25.2` time DEFAULT NULL,
  `26.1` time DEFAULT NULL,
  `26.2` time DEFAULT NULL,
  `27.1` time DEFAULT NULL,
  `27.2` time DEFAULT NULL,
  `28.1` time DEFAULT NULL,
  `28.2` time DEFAULT NULL,
  `29.1` time DEFAULT NULL,
  `29.2` time DEFAULT NULL,
  `30.1` time DEFAULT NULL,
  `30.2` time DEFAULT NULL,
  `F65` time DEFAULT NULL,
  PRIMARY KEY (`fingerNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sheet1
-- ----------------------------
INSERT INTO `sheet1` VALUES ('1007210051', '1', '20180630', '10051', '何鹏', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:32:00', '08:55:00', '18:32:00', null);
INSERT INTO `sheet1` VALUES ('1007210052', '1', '20180630', '10052', '张成', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '09:30:00', '18:23:00', '09:30:00', '18:23:00', null);
INSERT INTO `sheet1` VALUES ('1007210053', '0', '20180630', '10053', '高强', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:51:00', '18:14:00', '08:51:00', '18:14:00', null);
INSERT INTO `sheet1` VALUES ('1007210054', '0', '20180630', '10054', '刘磊', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:11:00', '08:55:00', '18:11:00', null);
INSERT INTO `sheet1` VALUES ('1007210055', '0', '20180630', '10055', '黄超', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:40:00', '18:15:00', '08:40:00', '18:15:00', null);
INSERT INTO `sheet1` VALUES ('1007210056', '0', '20180630', '10056', '黄子昂', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '08:55:00', '18:30:00', '08:55:00', '18:30:00', null);
INSERT INTO `sheet1` VALUES ('serial', 'state', null, 'fingerNO', 'name', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', '02:24:00', '04:48:00', null);

-- ----------------------------
-- Table structure for `stuinfo`
-- ----------------------------
DROP TABLE IF EXISTS `stuinfo`;
CREATE TABLE `stuinfo` (
  `stuno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `sex` varchar(4) NOT NULL,
  `age` int(11) NOT NULL,
  `classsort` varchar(16) NOT NULL,
  `classname` varchar(8) NOT NULL,
  `parentname` varchar(16) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `address` varchar(64) NOT NULL,
  `chefei` varchar(8) NOT NULL DEFAULT '0',
  `xuefei` varchar(8) NOT NULL DEFAULT '0',
  `chifei` varchar(8) NOT NULL DEFAULT '0',
  `carno` varchar(16) NOT NULL DEFAULT '无',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stuno`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stuinfo
-- ----------------------------
INSERT INTO `stuinfo` VALUES ('39', '张雨婷', '女', '6', '幼儿大班', '一班', '张三丰', '13956017778', '大杂院', '已缴费', '已缴费', '未缴费', '1', '2018-08-29 19:24:28');
INSERT INTO `stuinfo` VALUES ('40', '刘红', '女', '3', '幼儿小班', '一班', '刘强东', '13946017766', '春熙路太古里', '已缴费', '已缴费', '已缴费', '2', '2018-08-29 19:26:25');
INSERT INTO `stuinfo` VALUES ('41', '李丽珍', '女', '4', '幼儿中班', '二班', '李时珍', '13956018856', '天府广场', '未缴费', '已缴费', '未缴费', '2', '2018-08-29 19:27:28');
INSERT INTO `stuinfo` VALUES ('42', '黄龙', '男', '4', '幼儿中班', '二班', '黄子昂', '13956017766', '白家', '已缴费', '已缴费', '已缴费', '无', '2018-08-29 19:28:47');
INSERT INTO `stuinfo` VALUES ('43', '何天霸', '男', '5', '幼儿中班', '三班', '何鹏', '13966016666', '总统公寓', '未缴费', '已缴费', '未缴费', '无', '2018-08-29 19:30:18');
INSERT INTO `stuinfo` VALUES ('44', '马丽', '女', '3', '幼儿小班', '一班', '马云', '13856017788', '腾讯大厦', '未缴费', '已缴费', '未缴费', '无', '2018-08-29 19:31:42');
INSERT INTO `stuinfo` VALUES ('45', '张雨婷3', '女', '5', '幼儿中班', '二班', '张三丰23', '13946017777', '大杂院3', '已缴费', '已缴费', '未缴费', '2', '2018-08-29 19:33:30');
INSERT INTO `stuinfo` VALUES ('46', '张雨婷33', '男', '3', '幼儿小班', '一班', '张宏', '13956017778', '美年广场', '未缴费', '已缴费', '已缴费', '2', '2018-08-29 19:34:14');
INSERT INTO `stuinfo` VALUES ('47', '王大鹏', '男', '5', '幼儿中班', '三班', '王强', '13966017755', '大杂院', '未缴费', '未缴费', '未缴费', '2', '2018-08-29 19:35:00');
INSERT INTO `stuinfo` VALUES ('52', '赵高', '男', '5', '幼儿中班', '二班', '赵云', '13946017766', '中德大厦', '未缴费', '已缴费', '已缴费', '2', '2018-08-29 19:39:59');
INSERT INTO `stuinfo` VALUES ('53', '马棚', '男', '3', '幼儿小班', '一班', '马超', '13946015677', '天赋三街', '未缴费', '已缴费', '未缴费', '2', '2018-08-29 19:40:47');
INSERT INTO `stuinfo` VALUES ('54', '高云', '男', '2', '学前班', '一班', '高猛', '13946017766', '大杂院', '未缴费', '已缴费', '已缴费', '2', '2018-08-29 19:44:04');
INSERT INTO `stuinfo` VALUES ('57', '张龙', '男', '6', '幼儿大班', '一班', '张琳', '18280281112', '四川省成都市国信安', '已缴费', '已缴费', '未缴费', '1', '2018-09-03 09:59:29');
INSERT INTO `stuinfo` VALUES ('58', '张龙22', '男', '6', '幼儿中班', '二班', '张琳', '18280281112', '四川省成都市国信安1', '未缴费', '已缴费', '未缴费', '无', '2018-09-03 10:11:56');
INSERT INTO `stuinfo` VALUES ('59', '张龙77', '男', '6', '幼儿中班', '一班', '张琳', '15184372180', '四川省成都市国信安', '未缴费', '已缴费', '未缴费', '无', '2018-09-03 11:23:08');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `course` varchar(16) NOT NULL,
  `img` varchar(64) DEFAULT NULL,
  `descri` varchar(64) NOT NULL,
  `intime` date NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`teacherId`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1000', '张成', '23', '女', '18345678912', '音乐', 'img/fc8d65c9-0032-4614-83db-82ee054c1776', '擅长音乐教学', '2017-01-03', '2018-08-30 18:55:17');
INSERT INTO `teacher` VALUES ('1001', '张丰', '24', '男', '18698622222', '语言', null, '擅长语言表达教学', '2018-08-01', '2018-08-29 14:47:12');
INSERT INTO `teacher` VALUES ('1002', '张时', '23', '女', '18698622226', '画画', null, '擅长美术教学,美感好', '2018-08-02', '2018-08-29 14:48:35');
INSERT INTO `teacher` VALUES ('1003', '张里', '26', '男', '18698622232', '舞蹈', null, '国家级舞着', '2018-08-02', '2018-08-29 14:49:28');
INSERT INTO `teacher` VALUES ('1004', '李多', '25', '男', '18698622132', '体育', null, '国家二级运动员、高级教练', '2018-08-02', '2018-08-29 14:52:01');
INSERT INTO `teacher` VALUES ('1005', '李真', '26', '男', '18698612232', '英语', 'img/420e1a3a-5c6e-4cad-b348-ea83dfc3c200.jpg', '擅长双语教学、口语十级', '2018-08-14', '2018-08-29 14:53:19');
INSERT INTO `teacher` VALUES ('1006', '李明', '26', '男', '18698662232', '阅读', 'img/e948584e-50ce-4134-bc20-b1fb350e4b46.jpg', '在知识海洋翱翔', '2018-08-05', '2018-08-29 14:54:21');
INSERT INTO `teacher` VALUES ('1007', '王丽', '26', '男', '17356478989', '舞蹈', null, '耐心,舞蹈教学好', '2018-07-12', '2018-09-03 16:18:13');
INSERT INTO `teacher` VALUES ('1009', '王石', '27', '女', '16544894872', '体育', 'img/cdaa4cc2-d325-4561-86c2-96576567bf41.jpg', '体育健将,一级教练', '2018-08-08', '2018-09-02 18:06:00');

-- ----------------------------
-- Table structure for `t_certificate`
-- ----------------------------
DROP TABLE IF EXISTS `t_certificate`;
CREATE TABLE `t_certificate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bigdec` varchar(255) NOT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `wx` int(2) NOT NULL,
  `timeing` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_certificate
-- ----------------------------
INSERT INTO `t_certificate` VALUES ('5', ' 校园荣誉1', 'img/b065beb4-4a4e-4912-8c6a-8f3631c7c86b.jpg', '1', '2018-09-03 15:36:51');
INSERT INTO `t_certificate` VALUES ('6', ' 校园荣誉2  ', 'img/90a47a3e-f055-4b38-925d-2e59c7122c51.jpg', '2', '2018-09-03 16:13:29');

-- ----------------------------
-- Table structure for `t_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtype` int(20) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('13', '1', '1');
INSERT INTO `t_class` VALUES ('14', '2', '10');
INSERT INTO `t_class` VALUES ('15', '3', '10');

-- ----------------------------
-- Table structure for `t_homework`
-- ----------------------------
DROP TABLE IF EXISTS `t_homework`;
CREATE TABLE `t_homework` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bigdec` varchar(255) NOT NULL,
  `imgurl` varchar(100) NOT NULL,
  `wx` int(2) NOT NULL,
  `timeing` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_homework
-- ----------------------------
INSERT INTO `t_homework` VALUES ('1', ' 幼儿作品1', 'img/d5fcbe67-1bda-41d8-9d91-41d93929f5cd.jpg', '1', '2018-09-03 15:38:01');
INSERT INTO `t_homework` VALUES ('2', ' 幼儿作品2', 'img/85204cc2-c44a-4fd6-a7b7-6c2d85862f0c.jpg', '2', '2018-09-03 15:38:29');

-- ----------------------------
-- Table structure for `t_ready`
-- ----------------------------
DROP TABLE IF EXISTS `t_ready`;
CREATE TABLE `t_ready` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  `tel` varchar(22) NOT NULL,
  `timeing` varchar(50) NOT NULL,
  `type` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ready
-- ----------------------------
INSERT INTO `t_ready` VALUES ('2', '张成', '13980426920', '2018-09-03 11:27:25', '1');
INSERT INTO `t_ready` VALUES ('3', '张成', '13980426921', '2018-09-03 16:14:15', '2');

-- ----------------------------
-- Table structure for `t_school`
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `minidec` varchar(100) NOT NULL,
  `leader` varchar(20) NOT NULL,
  `tel` varchar(25) NOT NULL,
  `address` varchar(100) NOT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `bigdec` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_school
-- ----------------------------
INSERT INTO `t_school` VALUES ('14', '博苑幼儿园', '博苑幼儿园是四川省优质幼儿园。', '张成', '15008250713', '四川省成都市国信安1', null, '以给幼儿一个幸福、快乐的童年，为幼儿营造积极、向上的氛围，让家长成为共育的能手，教师与幼儿共同成长为办园宗旨。全园形成了“踏实严谨”的教风、“勤学好问、勇于探索”的学风、“团结、有序、求实、进取”的园风，赢得了良好的社会声誉。');

-- ----------------------------
-- Table structure for `t_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bigdec` varchar(255) NOT NULL,
  `imgurl` varchar(100) NOT NULL,
  `wx` int(2) NOT NULL,
  `timeing` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('1', ' 教师风采1', 'img/94c2189c-7cd1-4ea3-9a85-8be4e5197e33.jpg', '1', '2018-09-03 15:37:23');
INSERT INTO `t_teacher` VALUES ('2', ' 教师风采2', 'img/cb1e2c8a-dc75-4ec3-bce0-4ac6552c368c.jpg', '2', '2018-09-03 15:37:44');

-- ----------------------------
-- Table structure for `yuanqu`
-- ----------------------------
DROP TABLE IF EXISTS `yuanqu`;
CREATE TABLE `yuanqu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `briefintro` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yuanqu
-- ----------------------------
INSERT INTO `yuanqu` VALUES ('1', null, null, null, null, null, 'img/1.jpg');
INSERT INTO `yuanqu` VALUES ('2', null, null, null, null, null, 'img/2.jpg');
INSERT INTO `yuanqu` VALUES ('3', null, null, null, null, null, 'img/4.jpg');
INSERT INTO `yuanqu` VALUES ('4', null, null, null, null, null, 'img/5.jpg');
INSERT INTO `yuanqu` VALUES ('5', null, null, null, null, null, 'img/6.jpg');
