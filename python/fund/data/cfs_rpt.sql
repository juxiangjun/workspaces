/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : fund

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2012-11-14 09:34:58
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `cfs_rpt_prop_id` int(11) DEFAULT NULL,
  `cfs_rpt_prop_code` varchar(4) DEFAULT NULL,
  `cfs_rpt_type_id` int(11) DEFAULT NULL,
  `cfs_rpt_type_code` varchar(4) DEFAULT NULL,
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
  `cfs_rpt_prop_id` int(11) DEFAULT NULL,
  `cfs_rpt_prop_code` varchar(4) DEFAULT NULL,
  `cfs_rpt_prop_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_reduce_item` varchar(1) DEFAULT NULL,
  `formular` varchar(128) DEFAULT NULL,
  `cfs_rpt_type_id` int(11) DEFAULT NULL,
  `cfs_rpt_type_code` varchar(4) DEFAULT NULL,
  `cfs_rpt_type_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_rpt_item
-- ----------------------------

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
  `min_fiscal_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_rpt_type
-- ----------------------------
INSERT INTO `cfs_rpt_type` VALUES ('1', '01', '会企01', '资产负债表', null);
INSERT INTO `cfs_rpt_type` VALUES ('2', '02', '会企02', '利润及利润分配表', null);
INSERT INTO `cfs_rpt_type` VALUES ('3', '03', '会企03', '现金流量表', null);

-- ----------------------------
-- Table structure for `cfs_usr_rpt`
-- ----------------------------
DROP TABLE IF EXISTS `cfs_usr_rpt`;
CREATE TABLE `cfs_usr_rpt` (
  `id` int(11) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL,
  `usr_name` varchar(32) DEFAULT NULL,
  `fiscal_years` varchar(64) DEFAULT NULL,
  `fiscal_year_status` varchar(64) DEFAULT NULL,
  `last_modified_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfs_usr_rpt
-- ----------------------------
