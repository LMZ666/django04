/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : django04

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-11-08 21:33:15
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add user', '7', 'add_user');
INSERT INTO `auth_permission` VALUES ('26', 'Can change user', '7', 'change_user');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete user', '7', 'delete_user');
INSERT INTO `auth_permission` VALUES ('28', 'Can view user', '7', 'view_user');
INSERT INTO `auth_permission` VALUES ('29', 'Can add brandshow', '8', 'add_brandshow');
INSERT INTO `auth_permission` VALUES ('30', 'Can change brandshow', '8', 'change_brandshow');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete brandshow', '8', 'delete_brandshow');
INSERT INTO `auth_permission` VALUES ('32', 'Can view brandshow', '8', 'view_brandshow');
INSERT INTO `auth_permission` VALUES ('33', 'Can add slide show', '9', 'add_slideshow');
INSERT INTO `auth_permission` VALUES ('34', 'Can change slide show', '9', 'change_slideshow');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete slide show', '9', 'delete_slideshow');
INSERT INTO `auth_permission` VALUES ('36', 'Can view slide show', '9', 'view_slideshow');
INSERT INTO `auth_permission` VALUES ('37', 'Can add time limit', '10', 'add_timelimit');
INSERT INTO `auth_permission` VALUES ('38', 'Can change time limit', '10', 'change_timelimit');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete time limit', '10', 'delete_timelimit');
INSERT INTO `auth_permission` VALUES ('40', 'Can view time limit', '10', 'view_timelimit');
INSERT INTO `auth_permission` VALUES ('41', 'Can add popular', '11', 'add_popular');
INSERT INTO `auth_permission` VALUES ('42', 'Can change popular', '11', 'change_popular');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete popular', '11', 'delete_popular');
INSERT INTO `auth_permission` VALUES ('44', 'Can view popular', '11', 'view_popular');
INSERT INTO `auth_permission` VALUES ('45', 'Can add pbrand', '12', 'add_pbrand');
INSERT INTO `auth_permission` VALUES ('46', 'Can change pbrand', '12', 'change_pbrand');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete pbrand', '12', 'delete_pbrand');
INSERT INTO `auth_permission` VALUES ('48', 'Can view pbrand', '12', 'view_pbrand');
INSERT INTO `auth_permission` VALUES ('49', 'Can add grv', '13', 'add_grv');
INSERT INTO `auth_permission` VALUES ('50', 'Can change grv', '13', 'change_grv');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete grv', '13', 'delete_grv');
INSERT INTO `auth_permission` VALUES ('52', 'Can view grv', '13', 'view_grv');
INSERT INTO `auth_permission` VALUES ('53', 'Can add carts', '14', 'add_carts');
INSERT INTO `auth_permission` VALUES ('54', 'Can change carts', '14', 'change_carts');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete carts', '14', 'delete_carts');
INSERT INTO `auth_permission` VALUES ('56', 'Can view carts', '14', 'view_carts');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
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
-- Table structure for `auth_user_user_permissions`
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
-- Table structure for `brandshow`
-- ----------------------------
DROP TABLE IF EXISTS `brandshow`;
CREATE TABLE `brandshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brandshow
-- ----------------------------
INSERT INTO `brandshow` VALUES ('1', 'img/brandshow/brandshow2.jpeg');
INSERT INTO `brandshow` VALUES ('2', 'img/brandshow/brandshow3.jpeg');
INSERT INTO `brandshow` VALUES ('3', 'img/brandshow/brandshow4.jpeg');
INSERT INTO `brandshow` VALUES ('4', 'img/brandshow/brandshow5.jpeg');
INSERT INTO `brandshow` VALUES ('5', 'img/brandshow/brandshow6.jpeg');
INSERT INTO `brandshow` VALUES ('6', 'img/brandshow/brandshow7.jpeg');
INSERT INTO `brandshow` VALUES ('7', 'img/brandshow/brandshow2.jpeg');
INSERT INTO `brandshow` VALUES ('8', 'img/brandshow/brandshow3.jpeg');
INSERT INTO `brandshow` VALUES ('9', 'img/brandshow/brandshow4.jpeg');
INSERT INTO `brandshow` VALUES ('10', 'img/brandshow/brandshow5.jpeg');
INSERT INTO `brandshow` VALUES ('11', 'img/brandshow/brandshow6.jpeg');
INSERT INTO `brandshow` VALUES ('12', 'img/brandshow/brandshow7.jpeg');
INSERT INTO `brandshow` VALUES ('13', 'img/brandshow/brandshow2.jpeg');
INSERT INTO `brandshow` VALUES ('14', 'img/brandshow/brandshow3.jpeg');
INSERT INTO `brandshow` VALUES ('15', 'img/brandshow/brandshow4.jpeg');
INSERT INTO `brandshow` VALUES ('16', 'img/brandshow/brandshow5.jpeg');
INSERT INTO `brandshow` VALUES ('17', 'img/brandshow/brandshow6.jpeg');
INSERT INTO `brandshow` VALUES ('18', 'img/brandshow/brandshow7.jpeg');

-- ----------------------------
-- Table structure for `carts`
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_goods_id_defc570d_fk_pbrand_id` (`goods_id`),
  KEY `carts_user_id_3a9d1785_fk_User_id` (`user_id`),
  CONSTRAINT `carts_goods_id_defc570d_fk_pbrand_id` FOREIGN KEY (`goods_id`) REFERENCES `pbrand` (`id`),
  CONSTRAINT `carts_user_id_3a9d1785_fk_User_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES ('3', '1', '1', '8');
INSERT INTO `carts` VALUES ('4', '2', '2', '8');

-- ----------------------------
-- Table structure for `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('8', 'App', 'brandshow');
INSERT INTO `django_content_type` VALUES ('14', 'App', 'carts');
INSERT INTO `django_content_type` VALUES ('13', 'App', 'grv');
INSERT INTO `django_content_type` VALUES ('12', 'App', 'pbrand');
INSERT INTO `django_content_type` VALUES ('11', 'App', 'popular');
INSERT INTO `django_content_type` VALUES ('9', 'App', 'slideshow');
INSERT INTO `django_content_type` VALUES ('10', 'App', 'timelimit');
INSERT INTO `django_content_type` VALUES ('7', 'App', 'user');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'App', '0001_initial', '2018-10-30 12:40:50.486946');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0001_initial', '2018-10-30 12:40:50.596294');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-10-30 12:40:52.162041');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0001_initial', '2018-10-30 12:40:52.568195');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0002_logentry_remove_auto_add', '2018-10-30 12:40:52.583817');
INSERT INTO `django_migrations` VALUES ('6', 'admin', '0003_logentry_add_action_flag_choices', '2018-10-30 12:40:52.599439');
INSERT INTO `django_migrations` VALUES ('7', 'contenttypes', '0002_remove_content_type_name', '2018-10-30 12:40:52.849378');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0002_alter_permission_name_max_length', '2018-10-30 12:40:53.005593');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0003_alter_user_email_max_length', '2018-10-30 12:40:53.195339');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0004_alter_user_username_opts', '2018-10-30 12:40:53.210960');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0005_alter_user_last_login_null', '2018-10-30 12:40:53.335968');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0006_require_contenttypes_0002', '2018-10-30 12:40:53.351582');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0007_alter_validators_add_error_messages', '2018-10-30 12:40:53.367172');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0008_alter_user_username_max_length', '2018-10-30 12:40:53.507765');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0009_alter_user_last_name_max_length', '2018-10-30 12:40:53.679600');
INSERT INTO `django_migrations` VALUES ('16', 'sessions', '0001_initial', '2018-10-30 12:40:53.804570');
INSERT INTO `django_migrations` VALUES ('17', 'App', '0002_auto_20181030_2043', '2018-10-30 12:44:02.363749');
INSERT INTO `django_migrations` VALUES ('18', 'App', '0003_brandshow', '2018-11-01 09:56:18.161306');
INSERT INTO `django_migrations` VALUES ('19', 'App', '0004_slideshow', '2018-11-01 11:15:35.871349');
INSERT INTO `django_migrations` VALUES ('20', 'App', '0005_timelimit', '2018-11-01 12:26:18.575540');
INSERT INTO `django_migrations` VALUES ('21', 'App', '0006_popular', '2018-11-01 12:40:20.123981');
INSERT INTO `django_migrations` VALUES ('22', 'App', '0007_pbrand', '2018-11-02 04:34:12.764449');
INSERT INTO `django_migrations` VALUES ('23', 'App', '0008_grv', '2018-11-02 08:27:46.331924');
INSERT INTO `django_migrations` VALUES ('24', 'App', '0009_pbrand_repertorynum', '2018-11-02 08:51:51.121414');
INSERT INTO `django_migrations` VALUES ('25', 'App', '0010_user_img', '2018-11-08 05:29:29.826490');
INSERT INTO `django_migrations` VALUES ('26', 'App', '0011_carts', '2018-11-08 11:37:38.911072');

-- ----------------------------
-- Table structure for `django_session`
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
INSERT INTO `django_session` VALUES ('4gsllpbrujdvvu1jfkr63tr5tsvp3fh6', 'NDI2OWRlYmVlZDBiMDY0ZGRiNDUwOWNkOTc3NjA4MTliZGQ1YmZiODp7InRva2VuIjoiNzVmYTBkMjItY2E1MS01YmQ1LWE2YTAtZjBhNmUzZmRjZTI1In0=', '2018-11-22 11:29:29.621552');

-- ----------------------------
-- Table structure for `grv`
-- ----------------------------
DROP TABLE IF EXISTS `grv`;
CREATE TABLE `grv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `content` varchar(200) NOT NULL,
  `price` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grv
-- ----------------------------
INSERT INTO `grv` VALUES ('1', 'img/gooddetail/rightview.jpg', '台湾 DMC 欣兰黑里透白冻膜225g/盒 ', '¥99');
INSERT INTO `grv` VALUES ('2', 'img/gooddetail/rightview1.jpg', '韩国 VDL SPF30/PA++立体璀璨持久粉底液30ml/瓶 ', '¥129');

-- ----------------------------
-- Table structure for `pbrand`
-- ----------------------------
DROP TABLE IF EXISTS `pbrand`;
CREATE TABLE `pbrand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `psnPrice` varchar(10) NOT NULL,
  `psoPrice` varchar(10) NOT NULL,
  `repertoryNum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pbrand
-- ----------------------------
INSERT INTO `pbrand` VALUES ('1', 'img/popular/brand1.png', '韩国 LANEIGE 兰芝水凝清盈精华水200ml/瓶  ', '￥200', '￥330', '14');
INSERT INTO `pbrand` VALUES ('2', 'img/popular/brand2.png', '韩国 LANEIGE 兰芝雪润无暇气垫粉凝霜15g/盒*2', '￥232', '￥335', '18');
INSERT INTO `pbrand` VALUES ('3', 'img/popular/brand3.png', '韩国 LANGIGE 兰芝夜间修护锁水免洗睡眠面膜70ml/罐', '￥195', '￥289', '20');
INSERT INTO `pbrand` VALUES ('4', 'img/popular/brand4.png', '韩国 LANEIGE 兰芝夜间修护紧实面膜50ml/罐', '￥209', '￥229', '20');
INSERT INTO `pbrand` VALUES ('5', 'img/popular/brand5.png', '韩国 innisfree 悦诗风吟真萃面膜10片/盒', '￥75', '￥159', '20');
INSERT INTO `pbrand` VALUES ('6', 'img/popular/brand6.png', '韩国 Innisfree 悦诗风吟绿茶籽精萃水分眼部菁华霜30ml/瓶', '￥153', '￥190', '20');
INSERT INTO `pbrand` VALUES ('7', 'img/popular/brand7.png', '韩国 Innisfree 悦诗风吟油菜花蜜润唇膏3.5g/支', '￥60', '￥84', '20');
INSERT INTO `pbrand` VALUES ('8', 'img/popular/brand8.png', '韩国 innisfree 悦诗风吟真萃面膜10片/盒', '￥69', '￥115', '20');

-- ----------------------------
-- Table structure for `popular`
-- ----------------------------
DROP TABLE IF EXISTS `popular`;
CREATE TABLE `popular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `psnPrice` varchar(10) NOT NULL,
  `psoPrice` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of popular
-- ----------------------------
INSERT INTO `popular` VALUES ('1', 'img/popular/popular1.png', '韩国 Dr.Jart 蒂佳婷保湿补水蓝色药丸面膜5片/盒', '￥72', '￥143');
INSERT INTO `popular` VALUES ('2', 'img/popular/popular2.png', '英国 AA SKINCARE AA网薰衣草精油10ml/瓶', '￥103', '￥189');
INSERT INTO `popular` VALUES ('3', 'img/popular/popular3.png', '澳大利亚 Janue 简悦小黄瓜绵羊油补水面霜80g/瓶', '￥66', '￥152');
INSERT INTO `popular` VALUES ('4', 'img/popular/popular4.png', '韩国 it\'s skin 伊思红参蜗牛BB霜50ml/支', '￥130', '￥270');
INSERT INTO `popular` VALUES ('5', 'img/popular/popular5.png', '韩国 Etude House 爱丽小屋柔嫩美肌身体修护霜150ml/支', '￥33', '￥90');
INSERT INTO `popular` VALUES ('6', 'img/popular/popular6.png', '韩国 it\'s skin 伊思能量10提拉紧致精华原液30ml/瓶', '￥70', '￥140');
INSERT INTO `popular` VALUES ('7', 'img/popular/popular7.png', '日本 CEZANNE 倩丽高挺鼻影粉高光粉带刷子6g/盒', '￥88', '￥160');
INSERT INTO `popular` VALUES ('8', 'img/popular/popular8.png', '法国 BIODERMA 贝德玛净妍洁肤卸妆水500ml', '￥233', '￥333');
INSERT INTO `popular` VALUES ('9', 'img/popular/clothe1.png', '韩国 LAPALETTE 小马包马鞍包', '￥1430', '￥2330');
INSERT INTO `popular` VALUES ('10', 'img/popular/clothe2.png', '韩国 LAPALETTE 小马包2016新款时尚小马装饰跨包', '￥990', '￥1850');
INSERT INTO `popular` VALUES ('11', 'img/popular/clothe3.png', '韩国 LAPALETTE 小马包2016新款小马球迷你手提包', '￥2200', '￥3700');
INSERT INTO `popular` VALUES ('12', 'img/popular/clothe4.png', '韩国 LAPALETTE 小马包特里马图案手提包', '￥760', '￥1250');
INSERT INTO `popular` VALUES ('13', 'img/popular/clothe5.png', '韩国 LAPALETTE 小马包球装饰双肩背包 ', '￥3300', '￥5600');
INSERT INTO `popular` VALUES ('14', 'img/popular/clothe6.png', '韩国 LAPALETTE 小马包商务OL迷你小马双肩背包', '￥1180', '￥1760');
INSERT INTO `popular` VALUES ('15', 'img/popular/clothe7.png', 'ROYVALU 蛇纹时尚双肩背包 JULIE', '￥940', '￥2100');
INSERT INTO `popular` VALUES ('16', 'img/popular/clothe8.png', 'ROYVALU 学院风休闲双肩背包 WAY', '￥1700', '￥3300');

-- ----------------------------
-- Table structure for `slideshow`
-- ----------------------------
DROP TABLE IF EXISTS `slideshow`;
CREATE TABLE `slideshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slideshow
-- ----------------------------
INSERT INTO `slideshow` VALUES ('1', 'img/slideshow/slide1.png');
INSERT INTO `slideshow` VALUES ('2', 'img/slideshow/slide2.png');
INSERT INTO `slideshow` VALUES ('3', 'img/slideshow/slide3.png');
INSERT INTO `slideshow` VALUES ('4', 'img/slideshow/slide4.png');
INSERT INTO `slideshow` VALUES ('5', 'img/slideshow/slide5.png');
INSERT INTO `slideshow` VALUES ('6', 'img/slideshow/slide6.png');

-- ----------------------------
-- Table structure for `timelimit`
-- ----------------------------
DROP TABLE IF EXISTS `timelimit`;
CREATE TABLE `timelimit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `itemTitle` varchar(100) NOT NULL,
  `itemSub` varchar(100) NOT NULL,
  `newPrice` varchar(30) NOT NULL,
  `oldPrice` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timelimit
-- ----------------------------
INSERT INTO `timelimit` VALUES ('1', 'img/timeLImit/time1.png', '一支维他命C的焕颜术', '韩国 it\'s skin 伊思维他命C洗面奶150ml/支', '￥54', '￥89');
INSERT INTO `timelimit` VALUES ('2', 'img/timeLImit/time2.png', '春雨家族 黑色来袭', '韩国 Papa recipe 春雨黑膜竹炭蜂蜜面膜10片/盒', '￥43', '￥93');
INSERT INTO `timelimit` VALUES ('3', 'img/timeLImit/time3.png', '温和也有强大去污力', '日本 Mitsuei 三津荣洗洁精橘子味600ml/瓶', '￥79', '￥263');
INSERT INTO `timelimit` VALUES ('4', 'img/timeLImit/time4.png', '缔造自然双眼皮', '日本 Daiso 大创肤色蕾丝网纹哑光双眼皮贴标准型64枚/袋*2', '￥103', '￥993');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `account` varchar(20) NOT NULL,
  `passwd` varchar(80) NOT NULL,
  `token` varchar(256) DEFAULT NULL,
  `img` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'lmz', '123456', '123456', '20772963-6a0c-523f-bd7a-695f417917ac', 'img/headimg/dc463968-35aa-4c81-b98a-39bec1a31a0a.png');
INSERT INTO `user` VALUES ('4', 'lmz', '1234567', '123456', '5c0dfd70-3058-59d9-b15a-4162cc58c42b', 'img/headimg/0a5a9e04-f95c-44cc-8f12-056e682a9dcd.png');
INSERT INTO `user` VALUES ('5', 'lmz', '1234561', '123456', '2153cc2d-47c5-5c2a-9dc7-d08cda015d9e', 'img/headimg/f8ad83fb-2cf5-4ce2-a36c-23a266f46965.png');
INSERT INTO `user` VALUES ('6', 'lmz', '1234562', '123456', '214ef4b6-cabf-5ec5-93b6-f11b5de76adc', 'img/headimg/74eea8fb-6dbc-4ee1-b414-ecb1593a97b9.png');
INSERT INTO `user` VALUES ('7', 'lmz', '1234563', '123456', '4eb33fdf-8f25-5828-8db2-4165df11cee9', 'img/headimg/62102e51-01c6-4498-aa33-35bb08822e46.png');
INSERT INTO `user` VALUES ('8', 'lmz', '1234564', 'e10adc3949ba59abbe56e057f20f883e', '75fa0d22-ca51-5bd5-a6a0-f0a6e3fdce25', 'img/headimg/ee70a1a9-1afc-4e8e-9c0b-0fd3e0dfcf1f.png');
