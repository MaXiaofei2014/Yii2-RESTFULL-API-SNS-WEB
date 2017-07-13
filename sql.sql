/*
Navicat MySQL Data Transfer

Source Server         : linuxY
Source Server Version : 50556
Source Host           : 192.168.0.22:3306
Source Database       : snsforme

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2017-07-13 23:19:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yii_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `yii_admin_user`;
CREATE TABLE `yii_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `created_at` int(10) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of yii_admin_user
-- ----------------------------
INSERT INTO `yii_admin_user` VALUES ('6', 'admin', '2Jgwcr0ddHsuc6Nhq2F73717wAA3UVIo', '$2y$13$auNzTLQZ540PWBxAOSPnx.uRQVYVICq11Ws4dC.RaBI.2lhg54rZ.', null, '544876880@qq.com', '10', '10', '2017', '2017');
INSERT INTO `yii_admin_user` VALUES ('7', 'admin2', '2Jgwcr0ddHsuc6Nhq2F73717wAA3UVIo', '$2y$13$auNzTLQZ540PWBxAOSPnx.uRQVYVICq11Ws4dC.RaBI.2lhg54rZ.', null, '5449788052@qq.com', '10', '10', '2017', '2017');

-- ----------------------------
-- Table structure for yii_album_photo
-- ----------------------------
DROP TABLE IF EXISTS `yii_album_photo`;
CREATE TABLE `yii_album_photo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `album_id` int(10) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `talk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_album_photo
-- ----------------------------
INSERT INTO `yii_album_photo` VALUES ('2', '1', 'http://www.jsjafz.cn/uploads/allimg/140806/2333514596-0-lp.jpg', '1498834380', '1');
INSERT INTO `yii_album_photo` VALUES ('3', '1', 'http://www.jsjafz.cn/uploads/allimg/140806/2333514596-0-lp.jpg', '1498834380', '1');
INSERT INTO `yii_album_photo` VALUES ('4', '2', 'http://www.jsjafz.cn/uploads/allimg/140806/2333514596-0-lp.jpg', '1498834380', '0');
INSERT INTO `yii_album_photo` VALUES ('5', '2', 'http://www.jsjafz.cn/uploads/allimg/140806/2333514596-0-lp.jpg', '1498834380', '0');

-- ----------------------------
-- Table structure for yii_article
-- ----------------------------
DROP TABLE IF EXISTS `yii_article`;
CREATE TABLE `yii_article` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `cat_id` tinyint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_article
-- ----------------------------
INSERT INTO `yii_article` VALUES ('7', '文章标题', '文章简述', '文章内容', '1497971858', '1497971858', '1');

-- ----------------------------
-- Table structure for yii_article_category
-- ----------------------------
DROP TABLE IF EXISTS `yii_article_category`;
CREATE TABLE `yii_article_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `cat_name` varchar(255) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_article_category
-- ----------------------------
INSERT INTO `yii_article_category` VALUES ('1', '军事');
INSERT INTO `yii_article_category` VALUES ('2', '新闻');
INSERT INTO `yii_article_category` VALUES ('3', '头条');

-- ----------------------------
-- Table structure for yii_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `yii_auth_assignment`;
CREATE TABLE `yii_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `yii_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `yii_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_auth_assignment
-- ----------------------------
INSERT INTO `yii_auth_assignment` VALUES ('文章管理权限', '7', '1487215024');
INSERT INTO `yii_auth_assignment` VALUES ('超级管理权限', '6', '1487214904');

-- ----------------------------
-- Table structure for yii_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `yii_auth_item`;
CREATE TABLE `yii_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `yii_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `yii_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_auth_item
-- ----------------------------
INSERT INTO `yii_auth_item` VALUES ('/*', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/admin/*', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1487063029', '1487063029');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1487063029', '1487063029');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1487063029', '1487063029');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1487063029', '1487063029');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1487213482', '1487213482');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1487063029', '1487063029');
INSERT INTO `yii_auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1487063029', '1487063029');
INSERT INTO `yii_auth_item` VALUES ('/article/*', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/article/create', '2', null, null, null, '1487063528', '1487063528');
INSERT INTO `yii_auth_item` VALUES ('/article/delete', '2', null, null, null, '1487063528', '1487063528');
INSERT INTO `yii_auth_item` VALUES ('/article/index', '2', null, null, null, '1487063528', '1487063528');
INSERT INTO `yii_auth_item` VALUES ('/article/update', '2', null, null, null, '1487063528', '1487063528');
INSERT INTO `yii_auth_item` VALUES ('/article/view', '2', null, null, null, '1487063528', '1487063528');
INSERT INTO `yii_auth_item` VALUES ('/debug/*', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1487213481', '1487213481');
INSERT INTO `yii_auth_item` VALUES ('/gii/*', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/site/*', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/site/error', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/site/index', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/site/login', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('/site/logout', '2', null, null, null, '1487213483', '1487213483');
INSERT INTO `yii_auth_item` VALUES ('文章管理权限', '2', null, null, null, '1487214931', '1487214931');
INSERT INTO `yii_auth_item` VALUES ('超级管理权限', '2', null, null, null, '1487214768', '1487214768');

-- ----------------------------
-- Table structure for yii_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `yii_auth_item_child`;
CREATE TABLE `yii_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `yii_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `yii_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yii_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `yii_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_auth_item_child
-- ----------------------------
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/assignment/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/assignment/assign');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/assignment/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/assignment/revoke');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/assignment/view');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/default/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/default/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/menu/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/menu/create');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/menu/delete');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/menu/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/menu/update');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/menu/view');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/permission/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/permission/assign');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/permission/create');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/permission/delete');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/permission/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/permission/remove');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/permission/update');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/permission/view');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/role/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/role/assign');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/role/create');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/role/delete');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/role/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/role/remove');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/role/update');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/role/view');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/route/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/route/assign');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/route/create');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/route/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/route/refresh');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/route/remove');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/rule/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/rule/create');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/rule/delete');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/rule/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/rule/update');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/rule/view');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/activate');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/change-password');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/delete');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/login');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/logout');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/request-password-reset');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/reset-password');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/signup');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/admin/user/view');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/article/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/article/*');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/article/create');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/article/create');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/article/delete');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/article/delete');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/article/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/article/index');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/article/update');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/article/update');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/article/view');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/article/view');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/debug/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/debug/default/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/debug/default/db-explain');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/debug/default/download-mail');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/debug/default/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/debug/default/toolbar');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/debug/default/view');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/gii/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/gii/default/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/gii/default/action');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/gii/default/diff');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/gii/default/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/gii/default/preview');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/gii/default/view');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/site/*');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/site/*');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/site/error');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/site/error');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/site/index');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/site/index');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/site/login');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/site/login');
INSERT INTO `yii_auth_item_child` VALUES ('文章管理权限', '/site/logout');
INSERT INTO `yii_auth_item_child` VALUES ('超级管理权限', '/site/logout');

-- ----------------------------
-- Table structure for yii_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `yii_auth_rule`;
CREATE TABLE `yii_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for yii_menu
-- ----------------------------
DROP TABLE IF EXISTS `yii_menu`;
CREATE TABLE `yii_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `yii_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `yii_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_menu
-- ----------------------------
INSERT INTO `yii_menu` VALUES ('1', '权限控制', null, null, '-1', '{\"icon\": \"fa fa-user\"}');
INSERT INTO `yii_menu` VALUES ('2', '路由', '1', '/admin/route/index', '1', null);
INSERT INTO `yii_menu` VALUES ('3', '权限', '1', '/admin/permission/index', '2', null);
INSERT INTO `yii_menu` VALUES ('4', '角色', '1', '/admin/role/index', '3', null);
INSERT INTO `yii_menu` VALUES ('5', '权限控制', '1', '/admin/assignment/index', '4', null);
INSERT INTO `yii_menu` VALUES ('6', '菜单', '1', '/admin/menu/index', '5', null);
INSERT INTO `yii_menu` VALUES ('7', '资讯文章', null, null, '1', null);
INSERT INTO `yii_menu` VALUES ('8', '文章列表', '7', '/article/index', '1', null);

-- ----------------------------
-- Table structure for yii_show_access
-- ----------------------------
DROP TABLE IF EXISTS `yii_show_access`;
CREATE TABLE `yii_show_access` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `key` tinyint(4) NOT NULL COMMENT '1,2,3,4...',
  `value` varchar(255) DEFAULT NULL COMMENT '名字',
  `cat` varchar(64) NOT NULL COMMENT '分类 说说或者相册 album,talk,all,',
  PRIMARY KEY (`id`),
  KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_show_access
-- ----------------------------
INSERT INTO `yii_show_access` VALUES ('1', '1', '仅自己', 'all');
INSERT INTO `yii_show_access` VALUES ('2', '2', '所有人', 'all');
INSERT INTO `yii_show_access` VALUES ('3', '3', '我的同学', 'all');
INSERT INTO `yii_show_access` VALUES ('4', '4', '我的校友', 'all');

-- ----------------------------
-- Table structure for yii_talk_click
-- ----------------------------
DROP TABLE IF EXISTS `yii_talk_click`;
CREATE TABLE `yii_talk_click` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `click_user_id` int(10) NOT NULL COMMENT '点赞人',
  `talk_id` int(10) NOT NULL COMMENT '说说ID',
  PRIMARY KEY (`id`),
  KEY `id` (`click_user_id`),
  CONSTRAINT `id` FOREIGN KEY (`click_user_id`) REFERENCES `yii_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_talk_click
-- ----------------------------
INSERT INTO `yii_talk_click` VALUES ('1', '9', '2');
INSERT INTO `yii_talk_click` VALUES ('4', '10', '2');

-- ----------------------------
-- Table structure for yii_talk_media
-- ----------------------------
DROP TABLE IF EXISTS `yii_talk_media`;
CREATE TABLE `yii_talk_media` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `media_type` varchar(32) NOT NULL,
  `talk_id` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_talk_media
-- ----------------------------
INSERT INTO `yii_talk_media` VALUES ('1', 'map3', '2', 'http://mp3.flash127.com/music/14774.qcc?.mp3', '1498834380');
INSERT INTO `yii_talk_media` VALUES ('2', 'picture', '1', 'http://www.jsjafz.cn/uploads/allimg/140806/2333514596-0-lp.jpg', '1498834380');
INSERT INTO `yii_talk_media` VALUES ('4', 'picture', '1', 'http://www.jsjafz.cn/uploads/allimg/140806/2333514596-0-lp.jpg', '1498834380');
INSERT INTO `yii_talk_media` VALUES ('5', 'picture', '1', 'http://www.jsjafz.cn/uploads/allimg/140806/2333514596-0-lp.jpg', '1498834380');
INSERT INTO `yii_talk_media` VALUES ('6', 'mp3', '2', 'http://www.jsjafz.cn/uploads/allimg/140806/2333514596-0-lp.jpg', '1498834380');

-- ----------------------------
-- Table structure for yii_user
-- ----------------------------
DROP TABLE IF EXISTS `yii_user`;
CREATE TABLE `yii_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `header_img` varchar(255) NOT NULL COMMENT '用户头像',
  `cover_img` varchar(255) DEFAULT NULL COMMENT '主页背景',
  `sex` smallint(6) NOT NULL COMMENT '1男2女3保密',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `created_at` int(10) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of yii_user
-- ----------------------------
INSERT INTO `yii_user` VALUES ('8', 'admin', '2Jgwcr0ddHsuc6Nhq2F73717wAA3UVIo', '$2y$13$auNzTLQZ540PWBxAOSPnx.uRQVYVICq11Ws4dC.RaBI.2lhg54rZ.', null, '544876880@qq.com', '10', '', null, '0', '10', '2017', '2017');
INSERT INTO `yii_user` VALUES ('9', 'test', '2Jgwcr0ddHsuc6Nhq2F73717wAA3UVIo', '$2y$13$auNzTLQZ540PWBxAOSPnx.uRQVYVICq11Ws4dC.RaBI.2lhg54rZ.', null, '5448768@qq.com', '10', '', null, '0', '10', '2017', '2017');
INSERT INTO `yii_user` VALUES ('10', 'test2', '2Jgwcr0ddHsuc6Nhq2F73717wAA3UVIo', '$2y$13$auNzTLQZ540PWBxAOSPnx.uRQVYVICq11Ws4dC.RaBI.2lhg54rZ.', null, '544876@qq.com', '10', '', null, '0', '10', '2017', '2017');

-- ----------------------------
-- Table structure for yii_user_album
-- ----------------------------
DROP TABLE IF EXISTS `yii_user_album`;
CREATE TABLE `yii_user_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(255) NOT NULL COMMENT '相册名字',
  `album_desc` varchar(255) DEFAULT NULL COMMENT '相册描述',
  `index_img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `count` int(11) DEFAULT '0' COMMENT '总数',
  `user_id` int(10) DEFAULT NULL,
  `show_access` varchar(32) DEFAULT NULL,
  `key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii_user_album
-- ----------------------------
INSERT INTO `yii_user_album` VALUES ('1', '说说日志', '说说日志相册', 'https://static.segmentfault.com/v-5954c7a4/global/img/404.svg', '1', '8', '2', 'talk');
INSERT INTO `yii_user_album` VALUES ('2', '时间带不走', '记录着生活中的点点滴滴', 'https://getyii.com/uploads/avatars/cache/100_9aUtMM-6oFo_m5qbR5LjSz7wPhjxjef5.jpg', '1', '8', '2', null);

-- ----------------------------
-- Table structure for yii_user_talk
-- ----------------------------
DROP TABLE IF EXISTS `yii_user_talk`;
CREATE TABLE `yii_user_talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员Id',
  `talk_content` text COMMENT '说说内容',
  `talk_media` varchar(32) NOT NULL COMMENT 'none无 picture图片  video视频',
  `likes` text COMMENT '点赞人',
  `show_access` tinyint(1) DEFAULT NULL COMMENT '对应表showaccess',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 正常2为删除3.为隐藏',
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `yii_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员说说表';

-- ----------------------------
-- Records of yii_user_talk
-- ----------------------------
INSERT INTO `yii_user_talk` VALUES ('1', '8', '我修改了内容', 'picture', '10', '1', '1', '1498834380', '1498834380');
INSERT INTO `yii_user_talk` VALUES ('2', '8', '修改了标题2222', 'mp3', '10', '1', '1', '1498834380', '1498834380');
