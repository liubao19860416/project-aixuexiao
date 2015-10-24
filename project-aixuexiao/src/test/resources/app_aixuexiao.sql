/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : aixuexiao

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2015-07-20 21:27:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` smallint(5) unsigned NOT NULL COMMENT '班级编号，302表示三年级二班',
  `name` char(16) NOT NULL COMMENT '班级名称，三年级二班',
  `headteacher` char(8) NOT NULL COMMENT '班主任姓名',
  `studentcount` tinyint(4) NOT NULL COMMENT '学生数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('302', '三年级二班', '赖导', '7');
INSERT INTO `class` VALUES ('301', '三年级一班', '曾近荣', '7');

-- ----------------------------
-- Table structure for class_news
-- ----------------------------
DROP TABLE IF EXISTS `class_news`;
CREATE TABLE `class_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `classid` int(10) unsigned NOT NULL COMMENT '考试班级',
  `content` varchar(128) NOT NULL,
  `inserttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_class_news` (`classid`,`inserttime`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_news
-- ----------------------------
INSERT INTO `class_news` VALUES ('1', '302', '大家好，三年级二班将于本周六举行家长会，届时请各位学生家长准时到达开会，谢谢！', '2013-08-21 10:42:04');
INSERT INTO `class_news` VALUES ('2', '301', '各位学生家长注意了，最近有不少同学出现逃学的情况，还号称“逃学威龙”。', '2013-08-21 10:48:20');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '考试编号',
  `classid` int(10) unsigned NOT NULL COMMENT '考试班级',
  `course` char(8) NOT NULL COMMENT '科目',
  `examtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '考试时间',
  `fullmarks` decimal(4,1) NOT NULL COMMENT '满分',
  `average` decimal(4,1) DEFAULT NULL COMMENT '平均分',
  `topmark` decimal(4,1) DEFAULT NULL COMMENT '最高分',
  `lowestmark` decimal(4,1) DEFAULT NULL COMMENT '最低分',
  `remark` varchar(32) NOT NULL COMMENT '考试说明',
  PRIMARY KEY (`id`),
  KEY `index_exams` (`id`),
  KEY `index_classes` (`classid`,`course`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('1', '301', '英语', '2013-08-21 10:56:07', '100.0', '84.1', '100.0', '59.0', '精诚中学三年级二班下学期英语单元测验');
INSERT INTO `exam` VALUES ('2', '302', '数学', '2013-08-22 11:02:20', '100.0', '88.3', '100.0', '78.0', '数学单元测验');

-- ----------------------------
-- Table structure for exam_mark
-- ----------------------------
DROP TABLE IF EXISTS `exam_mark`;
CREATE TABLE `exam_mark` (
  `classid` int(10) unsigned NOT NULL COMMENT '考试班级',
  `studentid` int(10) unsigned NOT NULL COMMENT '学生编号',
  `studentname` char(8) NOT NULL COMMENT '学生姓名',
  `examid` int(10) unsigned NOT NULL COMMENT '考试编号',
  `mark` decimal(4,1) NOT NULL COMMENT '分数',
  `examtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '考试时间',
  `rank` tinyint(4) DEFAULT NULL COMMENT '班级排名',
  `remark` varchar(32) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`classid`,`studentid`,`examid`),
  KEY `index_exam_mark` (`classid`,`studentid`,`studentname`,`examid`,`mark`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_mark
-- ----------------------------
INSERT INTO `exam_mark` VALUES ('301', '3011', '周星星', '1', '59.0', '2013-08-21 10:56:07', '7', '逃课就是这个下场');
INSERT INTO `exam_mark` VALUES ('301', '3013', '大飞', '1', '60.0', '2013-08-21 10:56:07', '6', '这次给你及格了');
INSERT INTO `exam_mark` VALUES ('301', '3014', '黄小龟', '1', '84.0', '2013-08-21 10:56:07', '5', '好好学习天天向上');
INSERT INTO `exam_mark` VALUES ('301', '3017', '林大岳', '1', '91.0', '2013-08-21 10:56:07', '4', '继续努力');
INSERT INTO `exam_mark` VALUES ('301', '3012', '曹达华', '1', '97.0', '2013-08-21 10:56:07', '3', '不错，有进步');
INSERT INTO `exam_mark` VALUES ('301', '3016', '汤朱迪', '1', '98.0', '2013-08-21 10:56:07', '2', '这次发挥有点小失常哟');
INSERT INTO `exam_mark` VALUES ('301', '3015', '仙蒂', '1', '100.0', '2013-08-21 10:56:07', '1', '满分不错，值得表扬');
INSERT INTO `exam_mark` VALUES ('302', '3027', '许博淳', '2', '78.0', '2013-08-22 11:02:20', '7', '要加油了');
INSERT INTO `exam_mark` VALUES ('302', '3022', '柯景腾', '2', '80.0', '2013-08-22 11:02:20', '6', '上课认真听讲');
INSERT INTO `exam_mark` VALUES ('302', '3024', '谢明和', '2', '87.0', '2013-08-22 11:02:20', '5', '好好学习天天向上');
INSERT INTO `exam_mark` VALUES ('302', '3026', '胡家玮', '2', '88.0', '2013-08-22 11:02:20', '4', '继续努力');
INSERT INTO `exam_mark` VALUES ('302', '3023', '曹国胜', '2', '90.0', '2013-08-22 11:02:20', '3', '有进步');
INSERT INTO `exam_mark` VALUES ('302', '3025', '廖英宏', '2', '95.0', '2013-08-22 11:02:20', '2', '非常好');
INSERT INTO `exam_mark` VALUES ('302', '3021', '沈佳宜', '2', '100.0', '2013-08-22 11:02:20', '1', '非常不错，好好保持');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tousername` char(32) NOT NULL,
  `fromusername` char(32) NOT NULL,
  `msgtype` enum('TEXT','IMAGE','LOCATION','LINK','EVENT') NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msgId` char(64) NOT NULL,
  `content` varchar(128) DEFAULT NULL,
  `picurl` varchar(128) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `locationx` char(10) DEFAULT NULL,
  `locationy` char(10) DEFAULT NULL,
  `scale` char(8) DEFAULT NULL,
  `label` varchar(32) DEFAULT NULL,
  `event` varchar(16) DEFAULT NULL,
  `eventkey` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user` (`msgtype`,`tousername`,`fromusername`,`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tousername` char(32) NOT NULL,
  `fromusername` char(32) NOT NULL,
  `msgtype` enum('TEXT','MUSIC','NEWS') NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(512) NOT NULL COMMENT '回复消息内容',
  `musicurl` varchar(128) DEFAULT NULL,
  `hqmusicurl` varchar(128) DEFAULT NULL,
  `articlecount` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user` (`msgtype`,`tousername`,`fromusername`,`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for reply_article
-- ----------------------------
DROP TABLE IF EXISTS `reply_article`;
CREATE TABLE `reply_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `replyid` int(10) unsigned NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(64) NOT NULL,
  `picurl` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_replyid` (`replyid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply_article
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL COMMENT '学生学号，通常为班级编号加上序号，如3021',
  `classid` int(10) unsigned NOT NULL COMMENT '所属班级编号',
  `name` char(8) NOT NULL COMMENT '学生姓名',
  `remark` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_classes` (`classid`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('3021', '302', '沈佳宜', '佳宜（女主角）');
INSERT INTO `student` VALUES ('3022', '302', '柯景腾', '柯腾（男主角）');
INSERT INTO `student` VALUES ('3023', '302', '曹国胜', '老曹(柯腾的挚友)');
INSERT INTO `student` VALUES ('3024', '302', '谢明和', '阿和(柯腾的挚友)');
INSERT INTO `student` VALUES ('3025', '302', '廖英宏', '该边(柯腾的挚友)');
INSERT INTO `student` VALUES ('3026', '302', '胡家玮', '弯弯(沈佳宜的好友)');
INSERT INTO `student` VALUES ('3027', '302', '许博淳', '勃起(柯腾的挚友)');
INSERT INTO `student` VALUES ('3011', '301', '周星星', '周星驰');
INSERT INTO `student` VALUES ('3012', '301', '曹达华', '吴孟达');
INSERT INTO `student` VALUES ('3013', '301', '大飞', '张耀扬');
INSERT INTO `student` VALUES ('3014', '301', '黄小龟', '黄一山');
INSERT INTO `student` VALUES ('3015', '301', '仙蒂', '朱茵');
INSERT INTO `student` VALUES ('3016', '301', '汤朱迪', '梅艳芳');
INSERT INTO `student` VALUES ('3017', '301', '林大岳', '黄秋生');

-- ----------------------------
-- Table structure for student_message
-- ----------------------------
DROP TABLE IF EXISTS `student_message`;
CREATE TABLE `student_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息编号',
  `studentid` int(10) unsigned NOT NULL COMMENT '学生编号',
  `inserttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_student_message` (`studentid`,`inserttime`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='微信给学生留言';

-- ----------------------------
-- Records of student_message
-- ----------------------------
INSERT INTO `student_message` VALUES ('1', '3011', '2013-08-21 11:09:44', '不准逃课');
INSERT INTO `student_message` VALUES ('2', '3021', '2013-08-22 10:56:15', '好好学习天天向上哈');
INSERT INTO `student_message` VALUES ('3', '3011', '2015-07-20 18:21:21', '测试好');
INSERT INTO `student_message` VALUES ('4', '3011', '2015-07-20 21:19:13', '测试留言');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `sign_in_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `current_sign_in_at` timestamp NULL DEFAULT NULL COMMENT '最新登录时间',
  `last_sign_in_at` timestamp NULL DEFAULT NULL COMMENT '上次登录时间',
  `current_sign_in_ip` varchar(255) DEFAULT NULL COMMENT '最新登录IP',
  `last_sign_in_ip` varchar(255) DEFAULT NULL COMMENT '上次登录IP',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'liubao19860416', 'liubao19860416@163.com', '3WXhjb%2FaykzDbA74kELDEQ%3D%3D', '21', '2015-07-20 15:22:20', '2015-07-20 15:00:14', '0:0:0:0:0:0:0:1', '127.0.0.1', '0', '2015-07-17 22:41:18', '2015-07-20 15:24:55');
INSERT INTO `users` VALUES ('2', '18611478781', '18611478781@163.com', '3WXhjb%2FaykzDbA74kELDEQ%3D%3D', '10', '2015-07-20 16:30:23', '2015-07-20 16:22:02', '127.0.0.1', '127.0.0.1', '0', '2015-07-20 15:16:12', '2015-07-20 16:31:02');
