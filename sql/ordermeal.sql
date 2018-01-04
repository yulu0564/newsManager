/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : 172.16.207.15:3306
Source Database       : ordermeal

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-06 17:25:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
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
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add permission', '3', 'add_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can change permission', '3', 'change_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete permission', '3', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add mealsheet', '7', 'add_mealsheet');
INSERT INTO `auth_permission` VALUES ('20', 'Can change mealsheet', '7', 'change_mealsheet');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete mealsheet', '7', 'delete_mealsheet');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$36000$S6nb5OFpaPbr$FEzVuyUg+ut59iYkL6/I/S9ZoAGGftdAdAu1U4N0urM=', '2017-11-04 09:30:16.108071', '1', 'admin', '', '', '993319134@qq.com', '1', '1', '2017-10-18 09:31:35.289014');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-10-18 09:32:07.085552', '5', '舒呈祥', '2', '[{\"changed\": {\"fields\": [\"is_ordered\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('2', '2017-10-18 09:32:15.553627', '4', '舒呈祥', '2', '[{\"changed\": {\"fields\": [\"is_ordered\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('3', '2017-10-18 09:32:21.323860', '3', '测试2', '2', '[{\"changed\": {\"fields\": [\"is_ordered\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('4', '2017-10-18 09:32:25.795428', '2', '测试1', '2', '[{\"changed\": {\"fields\": [\"is_ordered\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('5', '2017-10-19 01:28:32.599095', '5', '舒呈祥', '3', '', '7', '2');
INSERT INTO `django_admin_log` VALUES ('6', '2017-10-19 01:28:32.605096', '4', '舒呈祥', '3', '', '7', '2');
INSERT INTO `django_admin_log` VALUES ('7', '2017-10-19 01:28:32.607596', '3', '测试2', '3', '', '7', '2');
INSERT INTO `django_admin_log` VALUES ('8', '2017-10-19 01:28:32.613097', '2', '测试1', '3', '', '7', '2');
INSERT INTO `django_admin_log` VALUES ('9', '2017-10-24 08:44:06.057429', '10', '张勇', '2', '[{\"changed\": {\"fields\": [\"plates\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('10', '2017-10-24 08:44:32.550293', '11', '刘鑫荣', '2', '[{\"changed\": {\"fields\": [\"plates\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('11', '2017-10-24 08:48:11.831043', '10', '张勇', '2', '[{\"changed\": {\"fields\": [\"plates\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('12', '2017-10-24 08:48:38.269401', '13', '武圆圆', '2', '[{\"changed\": {\"fields\": [\"plates\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('13', '2017-10-24 08:50:29.307501', '14', '高健', '2', '[{\"changed\": {\"fields\": [\"reason\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('14', '2017-10-24 08:50:52.895996', '11', '刘鑫荣', '2', '[{\"changed\": {\"fields\": [\"reason\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('15', '2017-10-24 09:20:47.828423', '16', '余乐', '2', '[{\"changed\": {\"fields\": [\"plates\", \"money\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('16', '2017-10-24 09:20:53.359126', '16', '余乐', '2', '[]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('17', '2017-10-27 06:52:34.436167', '24', '余乐', '2', '[{\"changed\": {\"fields\": [\"day\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('18', '2017-10-27 07:21:03.708718', '28', '武圆圆', '2', '[{\"changed\": {\"fields\": [\"plates\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('19', '2017-10-27 07:27:05.879207', '29', '杜晓铃', '2', '[{\"changed\": {\"fields\": [\"worktimefrom\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('20', '2017-10-27 07:27:14.408790', '29', '杜晓铃', '2', '[]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('21', '2017-10-27 07:27:34.657362', '28', '武圆圆', '2', '[{\"changed\": {\"fields\": [\"plates\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('22', '2017-10-27 07:29:14.710567', '31', '姬姗姗', '2', '[{\"changed\": {\"fields\": [\"plates\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('23', '2017-10-28 01:23:55.168448', '28', '武圆圆', '2', '[{\"changed\": {\"fields\": [\"money\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('24', '2017-10-28 01:25:30.693078', '34', '曹利霞', '3', '', '7', '2');
INSERT INTO `django_admin_log` VALUES ('25', '2017-10-28 02:00:49.599645', '35', '曹利霞', '3', '', '7', '2');
INSERT INTO `django_admin_log` VALUES ('26', '2017-10-31 07:28:55.969868', '38', '旺顺阁测试（2）', '2', '[{\"changed\": {\"fields\": [\"is_ordered\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('27', '2017-10-31 07:31:34.163956', '39', '旺顺阁测试（3）', '3', '', '7', '2');
INSERT INTO `django_admin_log` VALUES ('28', '2017-10-31 07:31:34.168957', '38', '旺顺阁测试（2）', '3', '', '7', '2');
INSERT INTO `django_admin_log` VALUES ('29', '2017-10-31 07:31:34.172457', '37', '旺顺阁测试', '3', '', '7', '2');
INSERT INTO `django_admin_log` VALUES ('30', '2017-11-01 10:09:00.922562', '40', '戴斌斌', '2', '[{\"changed\": {\"fields\": [\"money\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('31', '2017-11-01 10:12:57.397591', '41', '郭立柱', '2', '[{\"changed\": {\"fields\": [\"plates\"]}}]', '7', '2');
INSERT INTO `django_admin_log` VALUES ('32', '2017-11-04 09:30:35.733064', '44', '曹利霞', '3', '', '7', '2');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'meals', 'mealsheet');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-10-18 07:56:57.828386');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-10-18 07:56:58.392957');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-10-18 07:56:58.530975');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-10-18 07:56:58.552978');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-10-18 07:56:58.645490');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-10-18 07:56:58.692996');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-10-18 07:56:58.749503');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-10-18 07:56:58.760504');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-10-18 07:56:58.814511');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-10-18 07:56:58.819012');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-10-18 07:56:58.830513');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-10-18 07:56:58.892021');
INSERT INTO `django_migrations` VALUES ('13', 'meals', '0001_initial', '2017-10-18 07:56:58.927525');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2017-10-18 07:56:58.965030');
INSERT INTO `django_migrations` VALUES ('15', 'meals', '0002_auto_20171018_1639', '2017-10-18 08:39:36.500977');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('431tmhzv8x0skp14v1093wnkfr66bo0u', 'NGRlZGM2OTc2OTM0ZWE4ZjE3YWE3NDM4NWZiYjZiZjg2YWJmNDRjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTAwMmEwOTdlMTdjYTUwMDQ1NTczZTYwZTQ4MjBhYzE1NTBmNDg4OSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-11-10 07:26:29.344568');
INSERT INTO `django_session` VALUES ('6xfzirxidhg1oh6x1q3efb3v5iglhnra', 'ZWI0NmM5MmIyNjVhMTk4NWQ4N2UzNTMwOTk0ZDhkNTJlYTI3ZWRhMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwMDJhMDk3ZTE3Y2E1MDA0NTU3M2U2MGU0ODIwYWMxNTUwZjQ4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-11-01 09:31:52.894750');
INSERT INTO `django_session` VALUES ('7wpgax65qzxs0geridbamcr3byjac27p', 'NGRlZGM2OTc2OTM0ZWE4ZjE3YWE3NDM4NWZiYjZiZjg2YWJmNDRjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTAwMmEwOTdlMTdjYTUwMDQ1NTczZTYwZTQ4MjBhYzE1NTBmNDg4OSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-11-15 10:08:50.328217');
INSERT INTO `django_session` VALUES ('awxwpa2qqbqs86ycb8uw09sfv4dh8d8q', 'NGRlZGM2OTc2OTM0ZWE4ZjE3YWE3NDM4NWZiYjZiZjg2YWJmNDRjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTAwMmEwOTdlMTdjYTUwMDQ1NTczZTYwZTQ4MjBhYzE1NTBmNDg4OSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-11-18 09:30:16.111572');
INSERT INTO `django_session` VALUES ('bj4hfq6otor8cq0q0mp95nlanrjwfotf', 'NGRlZGM2OTc2OTM0ZWE4ZjE3YWE3NDM4NWZiYjZiZjg2YWJmNDRjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTAwMmEwOTdlMTdjYTUwMDQ1NTczZTYwZTQ4MjBhYzE1NTBmNDg4OSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-11-07 09:00:29.715243');
INSERT INTO `django_session` VALUES ('q2ge4aod321hsb7q35e6q2d6nivp2a5d', 'NGRlZGM2OTc2OTM0ZWE4ZjE3YWE3NDM4NWZiYjZiZjg2YWJmNDRjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTAwMmEwOTdlMTdjYTUwMDQ1NTczZTYwZTQ4MjBhYzE1NTBmNDg4OSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-11-10 07:57:17.397241');
INSERT INTO `django_session` VALUES ('t31mdyl01l4sz0re31gyxr33yey0p9he', 'NGRlZGM2OTc2OTM0ZWE4ZjE3YWE3NDM4NWZiYjZiZjg2YWJmNDRjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTAwMmEwOTdlMTdjYTUwMDQ1NTczZTYwZTQ4MjBhYzE1NTBmNDg4OSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-11-10 07:27:13.403163');
INSERT INTO `django_session` VALUES ('vl58c776t52wkfmnp32gfs3cfsz13hcf', 'NGRlZGM2OTc2OTM0ZWE4ZjE3YWE3NDM4NWZiYjZiZjg2YWJmNDRjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTAwMmEwOTdlMTdjYTUwMDQ1NTczZTYwZTQ4MjBhYzE1NTBmNDg4OSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-11-10 07:27:07.284386');
INSERT INTO `django_session` VALUES ('y21s64y73g2h7zxvo5cfm4pafezfu938', 'NGRlZGM2OTc2OTM0ZWE4ZjE3YWE3NDM4NWZiYjZiZjg2YWJmNDRjNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTAwMmEwOTdlMTdjYTUwMDQ1NTczZTYwZTQ4MjBhYzE1NTBmNDg4OSIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-11-10 08:04:13.497579');

-- ----------------------------
-- Table structure for mealsheet
-- ----------------------------
DROP TABLE IF EXISTS `mealsheet`;
CREATE TABLE `mealsheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(32) NOT NULL,
  `month` varchar(32) NOT NULL,
  `day` varchar(32) NOT NULL,
  `departmentleader` varchar(8) NOT NULL,
  `department2l` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `worktimefrom` varchar(32) NOT NULL,
  `worktimeend` varchar(32) NOT NULL,
  `reason` varchar(32) NOT NULL,
  `restaurant` varchar(8) NOT NULL,
  `plates` varchar(32) NOT NULL,
  `money` int(11) NOT NULL,
  `comment` varchar(32) NOT NULL,
  `is_ordered` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mealsheet
-- ----------------------------
INSERT INTO `mealsheet` VALUES ('6', '2017', '10', '19', '姜总', '测试质检部', '姬姗姗', '19:00', '21:00', '初级招生方案APP测试', '李先生', '咖喱牛肉饭套餐（鱼丸汤）+2个卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('7', '2017', '10', '19', '姜总', '测试质检部', '高健', '19:00', '21:00', '初级招生方案APP测试', '李先生', '香辣牛肉笋烧饭套餐（饮料）+卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('8', '2017', '10', '20', '姜总', '测试质检部', '陈旭', '09:00', '18:00', '17中级报分', '张记', '菠萝古老肉+香辣鸡翅两荤套餐', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('9', '2017', '10', '20', '姜总', '测试质检部', '戴斌斌', '19:00', '21:00', '测试中级报分榜任务', '李先生', '上品肥牛饭（单点）+手工小笼包', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('10', '2017', '10', '24', '姜总', '测试质检部', '张勇', '19:00', '21:00', 'app直播测试', '李先生', '香辣牛肉笋烧饭套餐（汤） +卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('11', '2017', '10', '24', '姜总', '测试质检部', '刘鑫荣', '19:00', '21:00', 'app直播测试', '李先生', '红烧牛肉套餐（汤）', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('12', '2017', '10', '24', '姜总', '测试质检部', '姬姗姗', '19:00', '21:00', 'app直播测试', '李先生', '红油腐竹+红油肚丝+香酥饼', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('13', '2017', '10', '24', '姜总', '测试质检部', '武圆圆', '19:00', '21:00', 'app直播测试', '李先生', '香辣牛肉笋烧饭套餐（汤） +卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('14', '2017', '10', '24', '姜总', '测试质检部', '高健', '19:00', '21:00', 'app直播测试', '李先生', '咖喱牛肉饭套餐（汤）+2*卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('15', '2017', '10', '24', '姜总', '测试质检部', '杜晓玲', '19:00', '21:00', 'app直播测试', '李先生', '爽口土豆丝+白灼小油菜+蒜泥海带+卤蛋+香酥饼', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('16', '2017', '10', '24', '姜总', '测试质检部', '余乐', '19:00', '21:00', 'app直播测试', '李先生', '台式卤肉饭套餐（小）(饮料换豆浆，不要辣)+两个卤蛋', '33', '', '是');
INSERT INTO `mealsheet` VALUES ('17', '2017', '10', '26', '姜总', '测试质检部', '杜晓玲', '19:00', '21:00', 'app直播测试', '张记', '凉拌海藻+鱼香茄子+米饭', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('18', '2017', '10', '26', '姜总', '测试质检部', '刘鑫荣', '19:00', '21:00', '云课堂直播测试', '李先生', '爽口土豆丝+香酥鸡+香酥饼', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('19', '2017', '10', '26', '姜总', '测试质检部', '高健', '19:00', '21:00', '云课堂直播测试', '李先生', '邱君扣肉饭套餐（汤）+1*卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('20', '2017', '10', '26', '姜总', '测试质检部', '武圆圆', '19:00', '21:00', '云课堂直播测试', '李先生', '红烧牛肉饭套餐(汤)+卤蛋*2', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('21', '2017', '10', '26', '姜总', '测试质检部', '姬姗姗', '19:00', '21:00', '云课堂直播测试', '李先生', '白灼小油菜+爽口土豆丝+豆浆+香酥饼+卤蛋（3个）', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('22', '2017', '10', '26', '姜总', '测试质检部', '余乐', '19:00', '21:00', '云课堂直播测试', '张记', '套餐（香辣鸡翅+西芹香干+米饭）', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('23', '2017', '10', '26', '姜总', '测试质检部', '张勇', '19:00', '21:00', '云课堂直播测试', '李先生', '香辣牛肉笋烧饭套餐（汤）+1*卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('24', '2017', '10', '27', '姜总', '测试质检部', '余乐', '9:00', '18:00', '云课堂直播测试', '张记', '鱼香茄子+拌土豆丝+米饭', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('25', '2017', '10', '27', '姜总', '测试质检部', '高健', '9:00', '18:00', '云课堂直播测试', '李先生', '咖喱牛肉饭套餐（汤）+2*卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('26', '2017', '10', '27', '姜总', '测试质检部', '张勇', '9:00', '18:00', '云课堂直播测试', '李先生', '香辣牛肉笋烧饭套餐（汤）+1*卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('27', '2017', '10', '27', '姜总', '测试质检部', '刘鑫荣', '9:00', '18:00', '云课堂直播测试', '张记', '果仁菠菜+芹菜香干', '34', '', '是');
INSERT INTO `mealsheet` VALUES ('28', '2017', '10', '27', '姜总', '测试质检部', '武圆圆', '9:00', '18:00', '云课堂直播测试', '张记', '一荤一素套餐（菠萝咕老肉+酸辣土豆丝+米饭）', '32', '', '是');
INSERT INTO `mealsheet` VALUES ('29', '2017', '10', '27', '姜总', '测试质检部', '杜晓铃', '9:00', '18:00', '云课堂直播测试', '张记', '套餐（香辣鸡翅+小炒鲜蘑+米饭）', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('30', '2017', '10', '27', '姜总', '测试质检部', '郭素云', '9:00', '18:00', '中级，注会图书预售', '李先生', '香辣牛肉笋烧饭套餐（汤）+1*卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('31', '2017', '10', '27', '姜总', '测试质检部', '姬姗姗', '9:00', '18:00', '云课堂直播测试', '张记', '两荤套餐（香辣鸡翅+小炒鲜蘑+米饭）', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('32', '2017', '10', '27', '姜总', '测试质检部', '李宁姿', '9:00', '18:00', '中级，注会图书预售', '李先生', '香辣牛肉笋烧饭套餐（汤）+1*卤蛋', '35', '', '是');
INSERT INTO `mealsheet` VALUES ('33', '2017', '10', '27', '姜总', '测试质检部', '舒呈祥', '19:00', '21:00', '初级注会图书预售', '李先生', '红烧牛肉饭套餐（汤）', '34', '', '是');
INSERT INTO `mealsheet` VALUES ('36', '2017', '10', '30', '姜总', '测试质检部', '舒呈祥', '19:00', '21:00', '注会图书预售页', '李先生', '红烧牛肉面套餐（汤）', '34', '', '是');
INSERT INTO `mealsheet` VALUES ('40', '2017', '11', '01', '姜总', '测试质检部', '戴斌斌', '18:30', '20:30', '招生方案修改需求', '李先生', '八小时牛肉汤+2个李季香酥饼+1个卤蛋', '33', '', '是');
INSERT INTO `mealsheet` VALUES ('41', '2017', '11', '01', '姜总', '测试质检部', '郭立柱', '19:00', '21:00', '招生方案修改需求', '李先生', '红烧牛肉饭（单点）+3个卤蛋', '34', '', '是');
INSERT INTO `mealsheet` VALUES ('42', '2017', '11', '01', '姜总', '测试质检部', '舒呈祥', '19:00', '21:00', '招生方案修改需求', '李先生', '重庆摊摊面套餐（肚丝+海带丝+鱼丸汤）', '36', '超出1元自付', '是');
INSERT INTO `mealsheet` VALUES ('43', '2017', '11', '03', '姜总', '测试质检部', '陈旭', '19:00', '21:00', '初级学霸榜', '张记', '鲜虾黄瓜馅饺子', '35', '', '是');
