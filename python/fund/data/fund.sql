/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : fund

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-11-19 09:12:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add site', '6', 'add_site');
INSERT INTO `auth_permission` VALUES ('17', 'Can change site', '6', 'change_site');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete site', '6', 'delete_site');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'dba', '', '', 'tony.ju@live.com', 'pbkdf2_sha256$10000$o59KwzNoE6s2$Jf8ZQdtCedvWnaDlnk0LlKCEceXJ3JLut5wMHxfQxxw=', '1', '1', '1', '2012-11-15 06:48:16', '2012-11-15 06:48:16');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `cfs_fa_metric_items`
-- ----------------------------
DROP TABLE IF EXISTS `cfs_fa_metric_items`;
CREATE TABLE `cfs_fa_metric_items` (
  `id` int(11) NOT NULL,
  `metric_id` int(11) DEFAULT NULL,
  `fixed_item` varchar(128) DEFAULT NULL,
  `value_item` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_fa_metric_items
-- ----------------------------
INSERT INTO `cfs_fa_metric_items` VALUES ('1', null, '流动资产,流动负债,流动比率', 'columns:1, formular:\r\n[\r\n{id:x1y1,hidden:0,rpt:01,code:1199, year:0,type:0,default:,fomular:},\r\n{id:x2y1,hidden:0,code:2199,year:0,type:0,default:,fomular:},\r\n{id:x3y1,hidden:0,code:,year:,type:1,default:,fomular:\"x1y1/x2y1\"}\r\n]');
INSERT INTO `cfs_fa_metric_items` VALUES ('2', null, '营业收入,应收帐款期末余额,平均应收账款余额,应收帐款周转率(次),应收帐款周转期(天)', 'columns:2, formular:\r\n[\r\n{\r\n{id:x1y1,hidden:0,rpt:01,code:, year:-1,type:0,default:0,fomular:},\r\n{id:x2y1,hidden:0,rpt:01,code:1106, year:-1,type:0,default:0,fomular:},\r\n{id:x3y1,hidden:0,rpt:01,code:, year:-1,type:0,default:0,fomular:},\r\n{id:x4y1,hidden:0,rpt:01,code:, year:-1,type:0,default:0,fomular:},\r\n{id:x5y1,hidden:0,rpt:01,code:, year:-1,type:0,default:0,fomular:}\r\n},\r\n{\r\n{id:x1y2,hidden:0,rpt:02,code:1, year:0,type:0,default:0,fomular:},\r\n{id:x2y2,hidden:0,rpt:01,code:1106, year:0,type:0,default:0,fomular:},\r\n{id:x3y2:,hidden:0,rpt:,code:, year:0,type:1,default:0,fomular:\"(x2y1+x2y2)/2\"},\r\n{id:x4y2,hidden:0,rpt:01,code:, year:-1,type:0,default:0,fomular:\"x1y2/x3y2\"},\r\n{id:x5y2,hidden:0,rpt:01,code:, year:-1,type:0,default:0,fomular:\"x3y2*x6y2/x1y2\"},\r\n{id:x5y2,hidden:1,rpt:01,code:, year:-1,type:-1,default:360,fomular:}\r\n}\r\n]');

-- ----------------------------
-- Table structure for `cfs_fa_metrics`
-- ----------------------------
DROP TABLE IF EXISTS `cfs_fa_metrics`;
CREATE TABLE `cfs_fa_metrics` (
  `id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(8) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_rpt` tinyint(1) DEFAULT NULL,
  `years` varchar(8) DEFAULT '0',
  `formular` text,
  `comments` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_fa_metrics
-- ----------------------------
INSERT INTO `cfs_fa_metrics` VALUES ('1', '01', '速动比率', null, null, '-1,0', null, null);

-- ----------------------------
-- Table structure for `cfs_rpt_data`
-- ----------------------------
DROP TABLE IF EXISTS `cfs_rpt_data`;
CREATE TABLE `cfs_rpt_data` (
  `id` int(11) NOT NULL DEFAULT '0',
  `usr_id` int(11) DEFAULT NULL,
  `fiscal_year` int(11) DEFAULT NULL,
  `line_no` int(11) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_reduce_item` varchar(1) DEFAULT NULL,
  `formular` varchar(128) DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  `version` varchar(8) DEFAULT NULL,
  `cfs_rpt_prop_id` int(11) DEFAULT NULL,
  `cfs_rpt_prop_code` varchar(4) DEFAULT NULL,
  `cfs_rpt_type_id` int(11) DEFAULT NULL,
  `cfs_rpt_type_code` varchar(4) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `province_code` varchar(8) DEFAULT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  `created_by` varchar(32) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_rpt_data
-- ----------------------------

-- ----------------------------
-- Table structure for `cfs_rpt_item`
-- ----------------------------
DROP TABLE IF EXISTS `cfs_rpt_item`;
CREATE TABLE `cfs_rpt_item` (
  `id` int(11) NOT NULL DEFAULT '0',
  `line_no` int(11) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_reduce_item` varchar(1) DEFAULT NULL,
  `formular` varchar(128) DEFAULT NULL,
  `cfs_rpt_prop_id` int(11) DEFAULT NULL,
  `cfs_rpt_prop_code` varchar(4) DEFAULT NULL,
  `cfs_rpt_prop_name` varchar(32) DEFAULT NULL,
  `cfs_rpt_type_id` int(11) DEFAULT NULL,
  `cfs_rpt_type_code` varchar(4) DEFAULT NULL,
  `cfs_rpt_type_name` varchar(32) DEFAULT NULL,
  `column_id` int(11) DEFAULT NULL,
  `version` varchar(8) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `province_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_rpt_item
-- ----------------------------
INSERT INTO `cfs_rpt_item` VALUES ('1', '1', '11', '流动资产：', '0', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('2', '2', '1101', '货币资金', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('3', '3', '1102', '短期投资', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('4', '4', '1103', '应收票据', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('5', '5', '1104', '应收股利', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('6', '6', '1105', '应收利息', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('7', '7', '1106', '应收帐款', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('8', '8', '1107', '其他应收款', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('9', '9', '1108', '预付帐款', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('10', '10', '1109', '应收补贴款', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('11', '11', '1110', '存货', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('12', '12', '1111', '待摊费用', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('13', '13', '1112', '一年内到期的长期债券投资', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('14', '14', '1113', '其他流动资产', '1', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('15', '15', '1199', '流动资产合计', '1', '1', '2,14', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('16', '16', '12', '长期投资：', '0', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('17', '17', '1201', '长期股权投资', '16', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('18', '18', '1202', '长期债权投资', '16', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('19', '19', '1299', '长期投资合计', '16', '1', '17,18', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('20', '20', '13', '固定资产：', '0', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('21', '21', '1301', '固定资产原价', '20', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('22', '22', '1302', '减：累计折旧', '20', '-', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('23', '23', '1303', '固定资产净值', '20', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('24', '24', '1304', '减：固定资产减值准备', '20', '-', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('25', '25', '1305', '固定资产净额', '20', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('26', '26', '1306', '工程物资', '20', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('27', '27', '1307', '在建工程', '20', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('28', '28', '1308', '固定资产清理', '20', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('29', '29', '1399', '固定资产合计', '20', '1', '21,28', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('30', '30', '14', '无形资产及其他资产：', '0', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('31', '31', '1401', '无形资产', '30', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('32', '32', '1402', '长期待摊费用', '30', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('33', '33', '1403', '其他长期资产', '30', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('34', '34', '1499', '无形资产及其他资产合计', '30', '1', '31,33', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('35', '35', '15', '递延税项：', '0', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('36', '36', '1501', '递延税款借项', '35', '1', '', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('37', '37', '1999', '资产总额', '0', '1', '15+19+29+34+36', '1', '0101', '资产', '1', '01', '会企01', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('38', '38', '21', '流动负债：', '0', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('39', '39', '2101', '短期借款', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('40', '40', '2102', '应付票据', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('41', '41', '2103', '应付帐款', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('42', '42', '2104', '预收帐款', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('43', '43', '2105', '应付工资', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('44', '44', '2106', '应付福利费', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('45', '45', '2107', '应付股利', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('46', '46', '2108', '应交税金', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('47', '47', '2109', '其他应交款', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('48', '48', '2110', '其他应付款', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('49', '49', '2111', '预提费用', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('50', '50', '2112', '预计负债', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('51', '51', '2113', '一年内到期的长期负债', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('52', '52', '2114', '其他流动负债', '38', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('53', '53', '2199', '流动负债合计', '38', '1', '39,52', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('54', '54', '22', '长期负债：', '0', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('55', '55', '2201', '长期借款', '54', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('56', '56', '2202', '应付债券', '54', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('57', '57', '2203', '长期应付款', '54', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('58', '58', '2204', '专项应付款', '54', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('59', '59', '2205', '其他长期负债', '54', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('60', '60', '2299', '长期负债合计', '54', '1', '55,59', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('61', '61', '23', '递延税项：', '0', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('62', '62', '2301', '递延税项贷项', '61', '1', '', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('63', '63', '2999', '负债总计', '0', '1', '53+60+62', '2', '0102', '负债', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('64', '64', '3100', '少数股东权益', '0', '1', '', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('65', '65', '3200', '所有者权益：', '0', '1', '', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('66', '66', '3201', '实收资本', '65', '1', '', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('67', '67', '3202', '减：已归还投资', '65', '-', '', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('68', '68', '3203', '实收资本净额', '65', '1', '66+67', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('69', '69', '3204', '资本公积', '65', '1', '', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('70', '70', '3205', '盈余公积', '65', '1', '', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('71', '71', '3206', '其中：法定公益金', '70', '1', '', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('72', '72', '3207', '未分配利润', '65', '1', '', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('73', '73', '3299', '所有者权益合计', '0', '1', '69,72', '3', '0103', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('74', '74', '4000', '负债和所有者权益总计', '0', '1', '63+73', null, '', '所有者权益', '1', '01', '会企01', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('75', '1', '1', '一、主营业务收入', '0', '1', '', '4', '0201', '收入', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('76', '2', '11', '减：主营业务成本', '1', '-', '', '4', '0201', '收入', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('77', '3', '12', '主营业务税金及附加', '1', '-', '', '4', '0201', '收入', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('78', '4', '2', '二、主营业务利润（亏损以“－”号填列）', '0', '1', '1,3', '5', '0202', '费用', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('79', '5', '21', '加：其他业务利润（亏损以“－”号填列）', '4', '1', '', '5', '0202', '费用', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('80', '6', '22', '减：销售费用 ', '4', '-', '', '5', '0202', '费用', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('81', '7', '23', '管理费用', '4', '-', '', '5', '0202', '费用', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('82', '8', '24', '财务费用', '4', '-', '', '5', '0202', '费用', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('83', '9', '3', '三、营业利润（亏损以“－”号填列）', '0', '1', '4,8', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('84', '10', '31', '加：投资收益（损失以“－”号填列）', '9', '1', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('85', '11', '32', '补贴收入', '9', '1', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('86', '12', '33', '营业外收入', '9', '1', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('87', '13', '34', '减：营业外支出    ', '9', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('88', '14', '5', '四、利润总额（亏损以“－”号填列）', '0', '1', '9,13', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('89', '15', '51', '减：所得税', '14', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('90', '16', '52', '少数股东权益', '14', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('91', '17', '53', '五、净利润（亏损以“－”号填列）', '0', '1', '14,16', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('92', '18', '54', '加：年初未分配利润', '17', '1', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('93', '19', '55', '其他转入', '17', '1', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('94', '20', '6', '六、可供分配的利润', '0', '1', '17,19', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('95', '21', '61', '减：提取法定盈余公积', '20', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('96', '22', '62', '提取法定公益金', '20', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('97', '23', '63', '提取职工奖励及福利基金', '20', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('98', '24', '64', '提取储备基金', '20', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('99', '25', '65', '提取企业发展基金', '20', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('100', '26', '66', '利润归还投资', '20', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('101', '27', '7', '七、可供投资者分配的利润', '0', '1', '20,26', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('102', '28', '71', '减：应付优先股股利', '27', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('103', '29', '72', '提取任意盈余公积', '27', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('104', '30', '73', '应付普通股股利', '27', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('105', '31', '74', '转作资本（或股本）的普通股股利', '27', '-', '', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('106', '32', '8', '八、未分配利润', '0', '1', '27,31', '6', '0203', '利润', '2', '02', '会企02', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('107', '1', '11', '一、经营活动产生的现金流量：', '0', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('108', '2', '1101', '销售商品、提供劳务收到的现金', '1', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('109', '3', '1102', '收到的税费返还', '1', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('110', '4', '1103', '收到的其他与经营活动有关的现金', '1', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('111', '5', '1104', '现金流入小计', '1', '1', '2,4', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('112', '6', '1105', '购买商品、接受劳务支付的现金', '1', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('113', '7', '1106', '支付给职工以及为职工支付的现金', '1', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('114', '8', '1107', '支付的各项税费', '1', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('115', '9', '1108', '支付的其他与经营活动有关的现金', '1', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('116', '10', '1109', '现金流出小计', '1', '-', '6,9', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('117', '11', '1199', '经营活动产生的现金流量净额', '1', '1', '5+10', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('118', '12', '12', '二、投资活动产生的现金流量：', '0', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('119', '13', '1201', '收回投资所收到的现金', '12', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('120', '14', '1202', '取得投资收益所收到的现金', '12', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('121', '15', '1203', '处置固定资产、无形资产和其他长期资产所收回的现金净额', '12', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('122', '16', '1204', '收到的其他与投资活动有关的现金', '12', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('123', '17', '1210', '现金流入小计', '12', '1', '13,16', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('124', '18', '1206', '购建固定资产、无形资产和其他长期资产所支付的现金', '12', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('125', '19', '1207', '投资所支付的现金', '12', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('126', '20', '1208', '支付的其他与投资活动有关的现金', '12', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('127', '21', '1220', '现金流出小计', '12', '-', '18,20', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('128', '22', '1299', '投资活动产生的现金流量净额', '12', '1', '17+21', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('129', '23', '13', '三、筹资活动产生的现金流量：', '0', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('130', '24', '1301', '吸收投资所收到的现金', '23', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('131', '25', '1302', '借款所收到的现金', '23', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('132', '26', '1303', '收到的其他与筹资活动有关的现金', '23', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('133', '27', '1310', '现金流入小计', '23', '1', '24,26', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('134', '28', '1305', '偿还债务所支付的现金', '23', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('135', '29', '1306', '分配股利、利润或偿付利息所支付的现金', '23', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('136', '30', '1307', '支付的其他与筹资活动有关的现金', '23', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('137', '31', '1320', '现金流出小计', '23', '-', '28,30', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('138', '32', '1399', '筹资活动产生的现金流量净额', '23', '1', '27+31', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('139', '33', '14', '四、汇率变动对现金的影响', '-1', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('140', '34', '15', '五、现金及现金等价物净增加额', '-1', '1', '', '7', '0301', '项目', '3', '03', '会企03', '1', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('141', '35', '21', '1、将净利润调节为经营活动现金流量：', '0', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('142', '36', '2101', '净利润', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('143', '37', '2102', '加：计提的资产减值准备', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('144', '38', '2103', '固定资产折旧', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('145', '39', '2104', '无形资产摊销', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('146', '40', '2105', '长期待摊费用摊销', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('147', '41', '2106', '待摊费用减少（减：增加）', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('148', '42', '2107', '预提费用增加（减：减少）', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('149', '43', '2108', '处置固定资产、无形资产和其他长期资产的损失（减：收益）', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('150', '44', '2109', '固定资产报废损失', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('151', '45', '2110', '财务费用', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('152', '46', '2111', '投资损失（减：收益）', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('153', '47', '2112', '递延税款贷项（减：借项）', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('154', '48', '2113', '存货的减少（减：增加）', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('155', '49', '2114', '经营性应收项目的减少（减：增加）', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('156', '50', '2115', '经营性应付项目的增加（减：减少）', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('157', '51', '2116', '其他', '35', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('158', '52', '2199', '经营活动产生的现金流量净额', '35', '1', '36,51', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('159', '53', '22', '2、不涉及现金收支的投资和筹资活动：', '0', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('160', '54', '2201', '债务转为资本', '53', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('161', '55', '2201', '一年内到期的可转换公司债券', '53', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('162', '56', '2201', '融资租入固定资产', '53', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('163', '57', '23', '3、现金及现金等价物净增加情况：', '0', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('164', '58', '2301', '现金的期末余额', '57', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('165', '59', '2301', '减：现金的期初余额', '57', '-', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('166', '60', '2301', '加：现金等价物的期末余额', '57', '1', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('167', '61', '2301', '减：现金等价物的期初余额', '57', '-', '', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');
INSERT INTO `cfs_rpt_item` VALUES ('168', '62', '2399', '现金及现金等价物净增加额', '57', '1', '58,61', '8', '0302', '补充资料', '3', '03', '会企03', '2', '2012', null, '上海市');

-- ----------------------------
-- Table structure for `cfs_rpt_params`
-- ----------------------------
DROP TABLE IF EXISTS `cfs_rpt_params`;
CREATE TABLE `cfs_rpt_params` (
  `id` int(11) NOT NULL DEFAULT '0',
  `min_years` int(11) DEFAULT NULL COMMENT '最小录入会计年度',
  `versions` varchar(38) DEFAULT NULL COMMENT '报表版本',
  `curr_verersion` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_rpt_params
-- ----------------------------
INSERT INTO `cfs_rpt_params` VALUES ('1', '3', '2012,2013', '2012');

-- ----------------------------
-- Table structure for `cfs_rpt_prop`
-- ----------------------------
DROP TABLE IF EXISTS `cfs_rpt_prop`;
CREATE TABLE `cfs_rpt_prop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `cfs_rpt_type_id` int(11) DEFAULT NULL,
  `cfs_rpt_type_code` varchar(4) DEFAULT NULL,
  `cfs_rpt_name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_rpt_prop
-- ----------------------------
INSERT INTO `cfs_rpt_prop` VALUES ('1', '0101', '资产', '1', '01', '会企01');
INSERT INTO `cfs_rpt_prop` VALUES ('2', '0102', '负债', '1', '01', '会企01');
INSERT INTO `cfs_rpt_prop` VALUES ('3', '0103', '所有者权益', '1', '01', '会企01');
INSERT INTO `cfs_rpt_prop` VALUES ('4', '0201', '收入', '2', '02', '会企02');
INSERT INTO `cfs_rpt_prop` VALUES ('5', '0202', '费用', '2', '02', '会企02');
INSERT INTO `cfs_rpt_prop` VALUES ('6', '0203', '利润', '2', '02', '会企02');
INSERT INTO `cfs_rpt_prop` VALUES ('7', '0301', '项目', '3', '03', '会企03');
INSERT INTO `cfs_rpt_prop` VALUES ('8', '0302', '补充', '3', '03', '会企03');

-- ----------------------------
-- Table structure for `cfs_rpt_type`
-- ----------------------------
DROP TABLE IF EXISTS `cfs_rpt_type`;
CREATE TABLE `cfs_rpt_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) DEFAULT NULL,
  `short_name` varchar(16) DEFAULT NULL,
  `full_name` varchar(64) DEFAULT NULL,
  `columns` int(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_rpt_type
-- ----------------------------
INSERT INTO `cfs_rpt_type` VALUES ('1', '01', '会企01', '资产负债表', '2');
INSERT INTO `cfs_rpt_type` VALUES ('2', '02', '会企02', '利润及利润分配表', '1');
INSERT INTO `cfs_rpt_type` VALUES ('3', '03', '会企03', '现金流量表', '2');

-- ----------------------------
-- Table structure for `cfs_usr_rpt`
-- ----------------------------
DROP TABLE IF EXISTS `cfs_usr_rpt`;
CREATE TABLE `cfs_usr_rpt` (
  `id` int(11) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL,
  `usr_name` varchar(32) DEFAULT NULL,
  `fiscal_years` varchar(64) DEFAULT NULL COMMENT '用户所要填写的报表年度',
  `fiscal_year_status` varchar(64) DEFAULT NULL,
  `versions` varchar(38) DEFAULT NULL COMMENT '用户所定义的版本.',
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_usr_rpt
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'site', 'sites', 'site');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `django_site`
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES ('1', 'example.com', 'example.com');

-- ----------------------------
-- Table structure for `fund`
-- ----------------------------
DROP TABLE IF EXISTS `fund`;
CREATE TABLE `fund` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) DEFAULT NULL,
  `short_name` varchar(64) DEFAULT NULL,
  `full_name` varchar(256) DEFAULT NULL,
  `issued_date` varchar(24) DEFAULT NULL,
  `catelog_name` varchar(16) DEFAULT NULL,
  `manager` varchar(128) DEFAULT NULL,
  `administrator` varchar(128) DEFAULT NULL,
  `custodian` varchar(128) DEFAULT NULL,
  `investment_goal` text,
  `investment_vision` text,
  `investment_scale` text,
  `investment_strategy` text,
  `characteristics` varchar(128) DEFAULT NULL,
  `benchmark` text,
  `operation_mode` varchar(128) DEFAULT NULL,
  `fund_company_id` int(11) DEFAULT NULL,
  `fund_company_name` varchar(128) DEFAULT NULL,
  `catelog_id` varchar(36) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_announcement`
-- ----------------------------
DROP TABLE IF EXISTS `fund_announcement`;
CREATE TABLE `fund_announcement` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `issued_date` datetime DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_catelog`
-- ----------------------------
DROP TABLE IF EXISTS `fund_catelog`;
CREATE TABLE `fund_catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_catelog
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_catelog_value`
-- ----------------------------
DROP TABLE IF EXISTS `fund_catelog_value`;
CREATE TABLE `fund_catelog_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `comments` varchar(256) DEFAULT NULL,
  `fund_catelog_id` int(11) DEFAULT NULL,
  `fund_catelog_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_catelog_value
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_charge`
-- ----------------------------
DROP TABLE IF EXISTS `fund_charge`;
CREATE TABLE `fund_charge` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `buy` text,
  `application` text,
  `redemption` text,
  `management` text,
  `extra` text,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_charge
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_company`
-- ----------------------------
DROP TABLE IF EXISTS `fund_company`;
CREATE TABLE `fund_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(64) DEFAULT NULL COMMENT '简称',
  `full_name` varchar(256) DEFAULT NULL COMMENT '全称',
  `web_site` varchar(128) DEFAULT NULL COMMENT '新闻,公告部分要用到',
  `config_file` varchar(64) DEFAULT NULL COMMENT '配置文件名,默认路径为config目录下的文件',
  `status` varchar(1) DEFAULT NULL COMMENT '状态,值为1时为需要抓取',
  `last_updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `tabs` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_company
-- ----------------------------
INSERT INTO `fund_company` VALUES ('1', '华夏', '华夏基金管理有限公司', null, '001.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('2', '嘉实', '嘉实基金管理有限公司', null, '002.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('3', '南方', '南方基金管理有限公司', null, '003.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('4', '易方达', '易方达基金管理有限公司', null, '004.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('5', '博时', '博时基金管理有限公司', 'www.bosera.com', '005.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('6', '广发', '广发基金管理有限公司', null, '006.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('7', '银华', '银华基金管理有限公司', null, '007.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('8', '工银瑞信', '工银瑞信基金管理有限公司', 'www.ubssdic.com', '008.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('9', '富国', '富国基金管理有限公司', null, '009.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('10', '华安', '华安基金管理有限公司', 'www.huaan.com.cn', '010.ini', '1', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('11', '大成', '大成基金管理有限公司', null, '011.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('12', '汇添富', '汇添富基金管理有限公司', 'www.htffund.com', '012.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('13', '招商', '招商基金管理有限公司', 'www.cmfchina.com', '013.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('14', '中银', '中银基金管理有限公司', null, '014.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('15', '建信', '建信基金管理有限公司', null, '015.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('16', '鹏华', '鹏华基金管理有限公司', null, '016.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('17', '上投摩根', '上投摩根基金管理有限公司', 'www.51fund.com', '017.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('18', '诺安', '诺安基金管理有限公司', null, '018.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('19', '交银施罗德', '交银施罗德基金管理有限公司', null, '019.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('20', '融通', '融通基金管理有限公司', null, '020.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('21', '长盛', '长盛基金管理有限公司', null, '021.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('22', '国泰', '国泰基金管理有限公司', null, '022.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('23', '景顺长城', '景顺长城基金管理有限公司', null, '023.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('24', '国投瑞银', '国投瑞银基金管理有限公司', null, '024.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('25', '华宝兴业', '华宝兴业基金管理有限公司', null, '025.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('26', '华泰柏瑞', '华泰柏瑞基金管理有限公司', null, '026.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('27', '兴业全球', '兴业全球基金管理有限公司', null, '027.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('28', '长城', '长城基金管理有限公司', null, '028.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('29', '光大保德信', '光大保德信基金管理有限公司', null, '029.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('30', '万家', '万家基金管理有限公司', null, '030.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('31', '海富通', '海富通基金管理有限公司', null, '031.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('32', '泰达宏利', '泰达宏利基金管理有限公司', null, '032.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('33', '华商', '华商基金管理有限公司', null, '033.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('34', '申万菱信', '申万菱信基金管理有限公司', null, '034.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('35', '国联安', '国联安基金管理有限公司', null, '035.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('36', '中邮创业', '中邮创业基金管理有限公司', null, '036.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('37', '长信', '长信基金管理有限公司', null, '037.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('38', '信诚', '信诚基金管理有限公司', null, '038.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('39', '天弘', '天弘基金管理有限公司', null, '039.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('40', '银河', '银河基金管理有限公司', null, '040.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('41', '国海富兰克林', '国海富兰克林基金管理有限公司', null, '041.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('42', '农银汇理', '农银汇理基金管理有限公司', null, '042.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('43', '摩根士丹利华鑫', '摩根士丹利华鑫基金管理有限公司', null, '043.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('44', '中海', '中海基金管理有限公司', null, '044.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('45', '东吴', '东吴基金管理有限公司', null, '045.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('46', '宝盈', '宝盈基金管理有限公司', null, '046.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('47', '东方', '东方基金管理有限公司', null, '047.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('48', '汇丰晋信', '汇丰晋信基金管理有限公司', null, '048.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('49', '华富', '华富基金管理有限公司', null, '049.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('50', '泰信', '泰信基金管理有限公司', null, '050.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('51', '中欧', '中欧基金管理有限公司', null, '051.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('52', '新华', '新华基金管理有限公司', null, '052.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('53', '民生加银', '民生加银基金管理有限公司', null, '053.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('54', '信达澳银', '信达澳银基金管理有限公司', null, '054.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('55', '金鹰', '金鹰基金管理有限公司', null, '055.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('56', '浦银安盛', '浦银安盛基金管理有限公司', null, '056.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('57', '益民', '益民基金管理有限公司', null, '057.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('58', '天治', '天治基金管理有限公司', null, '058.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('59', '诺德', '诺德基金管理有限公司', null, '059.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('60', '财通', '财通基金管理有限公司', null, '060.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('61', '平安大华', '平安大华基金管理有限公司', 'fund.pingan.com', '061.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('62', '安信', '安信基金管理有限公司', null, '062.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('63', '纽银', '纽银基金管理有限公司', null, '063.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('64', '浙商', '浙商基金管理有限公司', null, '064.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('65', '金元惠理', '金元惠理基金管理有限公司', null, '065.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('66', '富安达', '富安达基金管理有限公司', null, '066.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('67', '德邦', '德邦基金管理有限公司', null, '067.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('68', '长安', '长安基金管理有限公司', null, '068.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('69', '国金通用', '国金通用基金管理有限公司', null, '069.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('70', '方正富邦', '方正富邦基金管理有限公司', null, '070.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('71', '英大', '英大基金管理有限公司', null, '071.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('72', '红塔红土', '红塔红土基金管理有限公司', null, '072.ini', '0', '2012-11-01 10:59:18', null);
INSERT INTO `fund_company` VALUES ('73', '华宸未来', '华宸未来基金管理有限公司', null, '073.ini', '0', '2012-11-01 10:59:18', null);

-- ----------------------------
-- Table structure for `fund_dividend`
-- ----------------------------
DROP TABLE IF EXISTS `fund_dividend`;
CREATE TABLE `fund_dividend` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `year` varchar(8) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `ex_dividend_date` datetime DEFAULT NULL,
  `delivered_date` datetime DEFAULT NULL,
  `unit` float DEFAULT NULL,
  `solution` varchar(64) DEFAULT NULL,
  `distribution_type` varchar(16) DEFAULT NULL,
  `fund_id` int(11) DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_dividend
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_file`
-- ----------------------------
DROP TABLE IF EXISTS `fund_file`;
CREATE TABLE `fund_file` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `issued_date` datetime DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_file
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_invest`
-- ----------------------------
DROP TABLE IF EXISTS `fund_invest`;
CREATE TABLE `fund_invest` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `overall` text,
  `stock_industry` text,
  `stock_top` text,
  `bond_catelog` text,
  `bond_top` text,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_invest
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_manager`
-- ----------------------------
DROP TABLE IF EXISTS `fund_manager`;
CREATE TABLE `fund_manager` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `manager` varchar(32) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `resume` varchar(256) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `fund_company_id` int(11) DEFAULT NULL,
  `fund_company_name` varchar(128) DEFAULT NULL,
  `fund_id` int(11) DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_nav`
-- ----------------------------
DROP TABLE IF EXISTS `fund_nav`;
CREATE TABLE `fund_nav` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `nav_date` datetime DEFAULT NULL,
  `nav` double DEFAULT NULL,
  `accumulated_nav` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_nav
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_roi`
-- ----------------------------
DROP TABLE IF EXISTS `fund_roi`;
CREATE TABLE `fund_roi` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `day_1` double DEFAULT NULL,
  `week_1` double DEFAULT NULL,
  `month_1` double DEFAULT NULL,
  `month_3` double DEFAULT NULL,
  `month_6` double DEFAULT NULL,
  `year_0` double DEFAULT NULL,
  `year_1` double DEFAULT NULL,
  `year_2` double DEFAULT NULL,
  `year_3` double DEFAULT NULL,
  `accumulated` double DEFAULT NULL,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_roi
-- ----------------------------

-- ----------------------------
-- Table structure for `fund_sales`
-- ----------------------------
DROP TABLE IF EXISTS `fund_sales`;
CREATE TABLE `fund_sales` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `fund_id` int(11) DEFAULT NULL,
  `sales_agent` text,
  `fund_code` varchar(8) DEFAULT NULL,
  `fund_name` varchar(128) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fund_sales
-- ----------------------------
