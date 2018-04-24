/*
Navicat MySQL Data Transfer

Source Server         : MyDataBase
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : cmeo

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2016-02-25 11:10:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptno` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) DEFAULT NULL,
  `manager` int(11) DEFAULT NULL COMMENT '管理员id',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deptno`),
  KEY `dname` (`dname`),
  KEY `dept_manager` (`manager`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '人事部门', '10001', '', '', '', '');
INSERT INTO `dept` VALUES ('2', '后勤部门', '40001', '', '', '', '');
INSERT INTO `dept` VALUES ('13', '财务部门', '50001', '', '', '', '');

-- ----------------------------
-- Table structure for dictionarycontent
-- ----------------------------
DROP TABLE IF EXISTS `dictionarycontent`;
CREATE TABLE `dictionarycontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dictionaryType` varchar(20) DEFAULT NULL COMMENT '对应字典类型名',
  `dictionaryName` varchar(20) DEFAULT NULL COMMENT '字典名称',
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY ` dictionarycontent_type` (`dictionaryType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典内容表,字典名称对应着一个字典类型';

-- ----------------------------
-- Records of dictionarycontent
-- ----------------------------

-- ----------------------------
-- Table structure for dictionarytype
-- ----------------------------
DROP TABLE IF EXISTS `dictionarytype`;
CREATE TABLE `dictionarytype` (
  `id` int(11) NOT NULL,
  `dictionaryType` varchar(20) DEFAULT NULL COMMENT '字典类型名',
  `module` varchar(20) DEFAULT NULL COMMENT '所属模块',
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dictionaryType` (`dictionaryType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionarytype
-- ----------------------------

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `empno` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(20) DEFAULT NULL,
  `dname` varchar(20) DEFAULT NULL COMMENT '部门编号',
  `emptype` varchar(20) DEFAULT NULL COMMENT '人员类型(普通、管理员)',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `message` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`empno`),
  KEY `ename` (`ename`),
  KEY `emp_dname` (`dname`)
) ENGINE=InnoDB AUTO_INCREMENT=70002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', 'Admin', '人事部门', '管理员', '0513-85332124', '65134123@qq.com', '13854534543', '123465', '人事部门管理员');
INSERT INTO `emp` VALUES ('10001', 'Jack', '人事部门', '管理员', '0513-85431015', '65134123@qq.com', '13854534543', '123465', '');
INSERT INTO `emp` VALUES ('20001', 'Rose', '人事部门', '管理员', '0513-85332123', '65134124@qq.com', '13854534544', '123457', '');
INSERT INTO `emp` VALUES ('30001', 'John', '人事部门', '管理员', '0513-85332124', '65134125@qq.com', '13854534545', '123458', '');
INSERT INTO `emp` VALUES ('40001', 'Mical', '后勤部门', '管理员', '0513-85332124', '65134125@qq.com', '13854534545', '123458', '');
INSERT INTO `emp` VALUES ('50001', 'Candy', '财务部门', '管理员', '0513-85332124', '65134125@qq.com', '13854534545', '123458', '');
INSERT INTO `emp` VALUES ('60001', 'Nike', '人事部门', '普通员工', '12345678', '', '1234567890', '', '');

-- ----------------------------
-- Table structure for emplimit
-- ----------------------------
DROP TABLE IF EXISTS `emplimit`;
CREATE TABLE `emplimit` (
  `empno` int(6) NOT NULL,
  `allLimit` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emplimit
-- ----------------------------
INSERT INTO `emplimit` VALUES ('1', '新增人员,修改人员,删除人员,查询人员,查询日志,新增机房,修改机房,删除机房,查询机房,新增权限,修改权限,删除权限,权限配置,新增部门,修改部门,删除部门');
INSERT INTO `emplimit` VALUES ('10001', '查询日志');

-- ----------------------------
-- Table structure for generator
-- ----------------------------
DROP TABLE IF EXISTS `generator`;
CREATE TABLE `generator` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机房ID',
  `generatorName` varchar(20) DEFAULT NULL COMMENT '机房名称',
  `managerId` int(11) DEFAULT NULL COMMENT '管理员id',
  `dname` varchar(20) DEFAULT NULL COMMENT '所属部门名称',
  `address` varchar(30) DEFAULT NULL COMMENT '地址',
  `message` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `generator_dname` (`dname`),
  KEY `generator_managerId` (`managerId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of generator
-- ----------------------------
INSERT INTO `generator` VALUES ('2', '人事机房1号', '10001', '人事部门', '上海宝山', '人事机房1号');
INSERT INTO `generator` VALUES ('3', '人事机房2号', '20001', '人事部门', '上海浦东', '人事机房2号');
INSERT INTO `generator` VALUES ('4', '后勤1', '70001', '后勤部门', '', '');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `managerId` int(11) DEFAULT NULL COMMENT '管理员ID',
  `managerName` varchar(20) DEFAULT NULL,
  `visitModel` varchar(20) DEFAULT NULL COMMENT '访问模块',
  `action` varchar(255) DEFAULT NULL COMMENT '进行的操作',
  `operatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_managerId` (`managerId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='日志';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('19', '1', 'Admin', '人员管理', 'selectAllEmps', '2016-02-24 23:11:15');
INSERT INTO `log` VALUES ('20', '1', 'Admin', '部门管理', 'selectAllDepts', '2016-02-24 23:11:25');
INSERT INTO `log` VALUES ('21', '1', 'Admin', '机房管理', 'selectAllGenerators', '2016-02-24 23:11:31');
INSERT INTO `log` VALUES ('22', '1', 'Admin', '权限管理', 'selectAllRoles', '2016-02-24 23:11:37');
INSERT INTO `log` VALUES ('23', '1', 'Admin', '人员管理', 'selectAllEmps', '2016-02-25 09:07:03');
INSERT INTO `log` VALUES ('24', '1', 'Admin', '部门管理', 'selectAllDepts', '2016-02-25 09:07:05');
INSERT INTO `log` VALUES ('25', '1', 'Admin', '人员管理', 'selectOneEmp', '2016-02-25 09:07:05');
INSERT INTO `log` VALUES ('26', '1', 'Admin', '人员管理', 'updateEmp', '2016-02-25 09:07:09');
INSERT INTO `log` VALUES ('27', '1', 'Admin', '人员管理', 'selectAllEmps', '2016-02-25 09:07:09');
INSERT INTO `log` VALUES ('28', '1', 'Admin', '日志管理', 'selectLogListByConditions', '2016-02-25 09:24:07');
INSERT INTO `log` VALUES ('29', '1', 'Admin', '人员管理', 'selectAllEmps', '2016-02-25 09:24:34');
INSERT INTO `log` VALUES ('30', '1', 'Admin', '人员管理', 'selectAllEmps', '2016-02-25 09:35:47');
INSERT INTO `log` VALUES ('31', '1', 'Admin', '部门管理', 'selectAllDepts', '2016-02-25 09:35:49');
INSERT INTO `log` VALUES ('32', '1', 'Admin', '人员管理', 'selectOneEmp', '2016-02-25 09:35:49');
INSERT INTO `log` VALUES ('33', '1', 'Admin', '人员管理', 'selectAllEmps', '2016-02-25 09:36:44');
INSERT INTO `log` VALUES ('34', '1', 'Admin', '部门管理', 'selectAllDepts', '2016-02-25 09:36:46');
INSERT INTO `log` VALUES ('35', '1', 'Admin', '人员管理', 'selectOneEmp', '2016-02-25 09:36:46');
INSERT INTO `log` VALUES ('36', '1', 'Admin', '人员管理', 'updateEmp', '2016-02-25 09:36:48');
INSERT INTO `log` VALUES ('37', '1', 'Admin', '人员管理', 'selectAllEmps', '2016-02-25 09:36:48');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleName` varchar(20) NOT NULL COMMENT '角色名',
  `module` varchar(20) DEFAULT NULL COMMENT '所属模块(页面写死)',
  PRIMARY KEY (`roleName`),
  KEY `module` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色管理，一个角色归属于一个模块';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('角色一', '人员管理');
INSERT INTO `role` VALUES ('角色五', '日志管理');
INSERT INTO `role` VALUES ('角色三', '机房管理');
INSERT INTO `role` VALUES ('角色四', '权限管理');
INSERT INTO `role` VALUES ('角色二', '部门管理');

-- ----------------------------
-- Table structure for roledistribute
-- ----------------------------
DROP TABLE IF EXISTS `roledistribute`;
CREATE TABLE `roledistribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empno` int(11) DEFAULT NULL COMMENT '人员id',
  `roleName` varchar(20) DEFAULT NULL COMMENT '所属角色',
  PRIMARY KEY (`id`),
  KEY `roleDistribute_empno` (`empno`),
  KEY `roleDistribute_roleName` (`roleName`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='角色分配，赋予某员工一定的角色，使其可以访问角色对应的模块(人员角色映射表)';

-- ----------------------------
-- Records of roledistribute
-- ----------------------------
INSERT INTO `roledistribute` VALUES ('48', '1', '角色一 ');
INSERT INTO `roledistribute` VALUES ('49', '1', '角色五 ');
INSERT INTO `roledistribute` VALUES ('50', '1', '角色三 ');
INSERT INTO `roledistribute` VALUES ('51', '1', '角色四 ');
INSERT INTO `roledistribute` VALUES ('52', '1', '角色二 ');
INSERT INTO `roledistribute` VALUES ('53', '10001', '角色五 ');

-- ----------------------------
-- Table structure for rolelimitmap
-- ----------------------------
DROP TABLE IF EXISTS `rolelimitmap`;
CREATE TABLE `rolelimitmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '这张表暂时没用  页面上写死 也可以查询出来',
  `roleName` varchar(20) DEFAULT NULL COMMENT '角色名',
  `roleLimit` varchar(50) DEFAULT NULL COMMENT '角色对应模块的操作权限(增加。。。)',
  PRIMARY KEY (`id`),
  KEY `roleLimitMap_limit` (`roleLimit`),
  KEY `roleLimitMap_roleName` (`roleName`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='模块的操作权限映射表，例如部门管理模块可以新增部门或更改部门等;';

-- ----------------------------
-- Records of rolelimitmap
-- ----------------------------
INSERT INTO `rolelimitmap` VALUES ('53', '角色一', '新增人员');
INSERT INTO `rolelimitmap` VALUES ('54', '角色一', '修改人员');
INSERT INTO `rolelimitmap` VALUES ('55', '角色一', '删除人员');
INSERT INTO `rolelimitmap` VALUES ('56', '角色一', '查询人员');
INSERT INTO `rolelimitmap` VALUES ('57', '角色二', '新增部门');
INSERT INTO `rolelimitmap` VALUES ('58', '角色二', '修改部门');
INSERT INTO `rolelimitmap` VALUES ('59', '角色二', '删除部门');
INSERT INTO `rolelimitmap` VALUES ('72', '角色五', '查询日志');
INSERT INTO `rolelimitmap` VALUES ('73', '角色三', '新增机房');
INSERT INTO `rolelimitmap` VALUES ('74', '角色三', '修改机房');
INSERT INTO `rolelimitmap` VALUES ('75', '角色三', '删除机房');
INSERT INTO `rolelimitmap` VALUES ('76', '角色三', '查询机房');
INSERT INTO `rolelimitmap` VALUES ('77', '角色四', '新增权限');
INSERT INTO `rolelimitmap` VALUES ('78', '角色四', '修改权限');
INSERT INTO `rolelimitmap` VALUES ('79', '角色四', '删除权限');
INSERT INTO `rolelimitmap` VALUES ('80', '角色四', '权限配置');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'C4CA4238A0B923820DCC509A6F75849B');
INSERT INTO `user` VALUES ('10001', 'C4CA4238A0B923820DCC509A6F75849B');
INSERT INTO `user` VALUES ('20001', 'C4CA4238A0B923820DCC509A6F75849B');
INSERT INTO `user` VALUES ('30001', 'C4CA4238A0B923820DCC509A6F75849B');
INSERT INTO `user` VALUES ('40001', 'C4CA4238A0B923820DCC509A6F75849B');
INSERT INTO `user` VALUES ('50001', 'C4CA4238A0B923820DCC509A6F75849B');
INSERT INTO `user` VALUES ('60001', 'C4CA4238A0B923820DCC509A6F75849B');
