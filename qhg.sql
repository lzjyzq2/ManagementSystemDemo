/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : qhg

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2021-03-04 22:10:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `Courseid` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(20) NOT NULL,
  `TeacherID` int(11) NOT NULL,
  PRIMARY KEY (`Courseid`,`TeacherID`),
  UNIQUE KEY `courseName` (`courseName`),
  KEY `TeacherID` (`TeacherID`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teachers` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES ('10', 'Android', '2');
INSERT INTO `courses` VALUES ('2', 'c', '4');
INSERT INTO `courses` VALUES ('9', 'Java EE', '3');
INSERT INTO `courses` VALUES ('4', 'java oo', '3');
INSERT INTO `courses` VALUES ('8', 'Java web', '4');
INSERT INTO `courses` VALUES ('6', 'ooad', '3');
INSERT INTO `courses` VALUES ('5', 'oracle', '5');
INSERT INTO `courses` VALUES ('1', 'pre', '4');
INSERT INTO `courses` VALUES ('3', 'sql', '5');
INSERT INTO `courses` VALUES ('7', 'Web前端', '5');
INSERT INTO `courses` VALUES ('12', '就业课', '1');
INSERT INTO `courses` VALUES ('11', '毕业项目', '5');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DeptNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `DeptName` varchar(50) NOT NULL,
  `DeptDescript` varchar(255) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`DeptNo`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '园长办公室', '园长办公区域', '1', '2020-07-31 15:30:57');
INSERT INTO `department` VALUES ('28', '保教部', '保教常规管理工作，教育活动计划的制定', '1', '2020-07-31 16:14:58');
INSERT INTO `department` VALUES ('29', '财务部', '负责各项财务工作', '1', '2020-07-31 16:15:23');
INSERT INTO `department` VALUES ('30', '保卫部', '保全', '1', '2020-08-01 15:51:26');
INSERT INTO `department` VALUES ('33', '后勤管理', '后勤管理', '1', '2020-08-01 16:58:51');

-- ----------------------------
-- Table structure for scores
-- ----------------------------
DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
  `studentid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentid`,`courseid`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`),
  CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `courses` (`Courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scores
-- ----------------------------
INSERT INTO `scores` VALUES ('1', '1', '60');
INSERT INTO `scores` VALUES ('1', '2', '70');
INSERT INTO `scores` VALUES ('1', '3', '80');
INSERT INTO `scores` VALUES ('1', '4', '55');
INSERT INTO `scores` VALUES ('1', '5', '100');
INSERT INTO `scores` VALUES ('1', '6', '90');
INSERT INTO `scores` VALUES ('2', '1', '50');
INSERT INTO `scores` VALUES ('2', '2', '70');
INSERT INTO `scores` VALUES ('2', '3', '80');
INSERT INTO `scores` VALUES ('2', '4', '55');
INSERT INTO `scores` VALUES ('2', '5', '100');
INSERT INTO `scores` VALUES ('2', '6', '90');
INSERT INTO `scores` VALUES ('2', '7', '50');
INSERT INTO `scores` VALUES ('2', '8', '70');
INSERT INTO `scores` VALUES ('2', '9', '50');
INSERT INTO `scores` VALUES ('2', '10', '55');
INSERT INTO `scores` VALUES ('2', '11', '100');
INSERT INTO `scores` VALUES ('2', '12', '30');
INSERT INTO `scores` VALUES ('3', '1', '90');
INSERT INTO `scores` VALUES ('3', '2', '70');
INSERT INTO `scores` VALUES ('3', '3', '80');
INSERT INTO `scores` VALUES ('3', '4', '55');
INSERT INTO `scores` VALUES ('3', '5', '100');
INSERT INTO `scores` VALUES ('3', '6', '90');
INSERT INTO `scores` VALUES ('3', '7', '90');
INSERT INTO `scores` VALUES ('3', '8', '80');
INSERT INTO `scores` VALUES ('3', '9', '90');
INSERT INTO `scores` VALUES ('3', '10', '55');
INSERT INTO `scores` VALUES ('3', '11', '100');
INSERT INTO `scores` VALUES ('3', '12', '100');
INSERT INTO `scores` VALUES ('4', '1', '100');
INSERT INTO `scores` VALUES ('4', '2', '70');
INSERT INTO `scores` VALUES ('4', '3', '80');
INSERT INTO `scores` VALUES ('4', '4', '55');
INSERT INTO `scores` VALUES ('4', '5', '100');
INSERT INTO `scores` VALUES ('4', '6', '90');
INSERT INTO `scores` VALUES ('4', '9', '100');
INSERT INTO `scores` VALUES ('4', '10', '90');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopNo` varchar(10) NOT NULL,
  `shopDate` date NOT NULL,
  `shopNum` int(11) NOT NULL,
  `shopPrice` float NOT NULL,
  `shopAmount` decimal(10,0) NOT NULL,
  `shopStaff` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', 'xsl001', '2013-12-02', '124', '134.5', '16678', '张三');
INSERT INTO `shop` VALUES ('2', 'xsl002', '2013-12-02', '50', '80', '4000', '李四');
INSERT INTO `shop` VALUES ('3', 'xsl003', '2013-12-05', '66', '55', '3630', '张三');
INSERT INTO `shop` VALUES ('4', 'xsl001', '2013-11-20', '10', '134.5', '1345', '张三');
INSERT INTO `shop` VALUES ('5', 'xsl001', '2013-11-02', '20', '134.5', '2690', '王五');
INSERT INTO `shop` VALUES ('6', 'xsl002', '2013-11-05', '30', '80', '2400', '张三');
INSERT INTO `shop` VALUES ('7', 'xsl002', '2013-11-09', '23', '80', '1840', '王五');
INSERT INTO `shop` VALUES ('8', 'xsl003', '2013-12-11', '10', '55', '550', '李四');
INSERT INTO `shop` VALUES ('9', 'xsl003', '2013-12-12', '50', '55', '2750', '王五');
INSERT INTO `shop` VALUES ('10', 'xsl004', '2013-11-30', '45', '100', '4500', '张三');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `StaffNo` int(11) NOT NULL AUTO_INCREMENT,
  `StaffName` varchar(50) NOT NULL,
  `Pwd` varchar(50) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Job` varchar(50) NOT NULL,
  `DeptNo` int(11) NOT NULL,
  `BirthDay` date DEFAULT NULL,
  `Sex` varchar(2) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`StaffNo`)
) ENGINE=InnoDB AUTO_INCREMENT=100010 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('99999', '张三', '123456', '12345678900', '园长', '1', '2011-02-01', '男', '1', '2021-03-04 21:57:19');
INSERT INTO `staff` VALUES ('100005', '李四', '12345678900', '12345678900', '财务会计', '29', '1998-06-09', '男', '1', '2021-03-04 21:57:22');
INSERT INTO `staff` VALUES ('100006', '王五', '12345678911', '12345678911', '幼师', '28', '1998-09-29', '女', '1', '2021-03-04 21:57:26');
INSERT INTO `staff` VALUES ('100007', '赵六', '12345678933', '12345678933', '保安队长', '30', '1998-06-10', '女', '1', '2021-03-04 21:57:29');
INSERT INTO `staff` VALUES ('100009', '秦七七', '12345678933', '12345678933', '后勤部长', '33', '1998-06-09', '女', '1', '2021-03-04 21:57:54');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(20) NOT NULL,
  `gender` char(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('1', '张三', '男', '1987-02-01');
INSERT INTO `students` VALUES ('2', '李斯', '女', '1990-12-01');
INSERT INTO `students` VALUES ('3', '王二', '男', '1988-09-01');
INSERT INTO `students` VALUES ('4', '黎明', '男', '1991-08-01');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `teacherid` int(11) NOT NULL AUTO_INCREMENT,
  `teacherName` varchar(20) NOT NULL,
  PRIMARY KEY (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('1', '张三');
INSERT INTO `teachers` VALUES ('2', '李四');
INSERT INTO `teachers` VALUES ('3', '王五');
INSERT INTO `teachers` VALUES ('4', 'Jacky');
INSERT INTO `teachers` VALUES ('5', 'Helen');
INSERT INTO `teachers` VALUES ('6', 'Kevin');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `userPwd` varchar(20) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1000', 'admin', 'admin', '男', '系统在手，天下我有', '1978-10-09');
INSERT INTO `user` VALUES ('99999', 'lzjyzq2', '123456', '男', '天下第一舍我其谁', '1998-10-07');
INSERT INTO `user` VALUES ('100000', 'Test4', '123456', '男', '666666', '2020-07-22');
INSERT INTO `user` VALUES ('100001', 'Test5', '123456', '男', '666666', '2020-07-22');
SET FOREIGN_KEY_CHECKS=1;
