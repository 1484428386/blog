/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.50 : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blog`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `createName` varchar(20) DEFAULT NULL COMMENT '创建者名称',
  `commentCount` int(11) DEFAULT NULL COMMENT '评论数',
  `createDate` date DEFAULT NULL COMMENT '创建日期',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `describe` varchar(200) DEFAULT NULL COMMENT '描述',
  `picPath` varchar(200) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`title`,`createName`,`commentCount`,`createDate`,`content`,`describe`,`picPath`) values 
(1,'测试1','admin',2,'2017-08-16','这是内容啊啊啊啊啊啊啊啊啊啊啊','这是描述啊啊啊啊啊啊啊啊啊啊啊',NULL),
(2,'测试2','JBIT',1,'2017-08-16','这是内容啊啊啊啊啊啊啊啊啊啊啊','这是描述啊啊啊啊啊啊啊啊啊啊啊',NULL),
(15,'狂吐','admin',0,'2017-08-22','<p><img src=\"http://img.baidu.com/hi/jx2/j_0084.gif\"/>哈哈哈,这个爽</p>','嘻嘻',' /statics/uploadFiles/1503373247061_pic.jpg '),
(16,'2555555','admin',0,'2017-08-26','<p><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0004.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0084.gif\"/></p>','这是描述',' /statics/uploadFiles/1503718572458_pic.jpg '),
(17,'1111','admin',0,'2017-08-27','<p><img src=\"http://img.baidu.com/hi/jx2/j_0005.gif\"/>123</p>','156656','');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `commentText` varchar(200) DEFAULT NULL COMMENT '评论内容',
  `createDate` datetime DEFAULT NULL COMMENT '评论日期',
  `articleId` int(11) DEFAULT NULL COMMENT '文章编号',
  `reviewer` varchar(20) DEFAULT NULL COMMENT '评论人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`commentText`,`createDate`,`articleId`,`reviewer`) values 
(3,'1111','2017-08-26 11:46:44',1,'dbqn'),
(4,'2222','2017-08-26 11:46:53',2,'dbqn'),
(5,'1111','2017-08-28 10:46:13',1,'admin');

/*Table structure for table `flink` */

DROP TABLE IF EXISTS `flink`;

CREATE TABLE `flink` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `url` varchar(50) DEFAULT NULL COMMENT '路径',
  `describe` varchar(200) DEFAULT NULL COMMENT '描述',
  `createId` int(20) DEFAULT NULL COMMENT '创建者编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `flink` */

insert  into `flink`(`id`,`name`,`url`,`describe`,`createId`) values 
(7,'嗯嗯','http://123.com','111',1),
(8,'123','http://123.com','123',1);

/*Table structure for table `friend` */

DROP TABLE IF EXISTS `friend`;

CREATE TABLE `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createId` int(11) DEFAULT NULL,
  `statuc` int(1) DEFAULT NULL,
  `addDateTime` datetime DEFAULT NULL,
  `addFriend` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `friend` */

insert  into `friend`(`id`,`createId`,`statuc`,`addDateTime`,`addFriend`) values 
(4,1,1,'2017-08-28 08:43:21',3),
(5,3,1,'2017-08-28 08:43:21',1),
(8,1,3,'2017-08-28 20:15:14',4);

/*Table structure for table `logintime` */

DROP TABLE IF EXISTS `logintime`;

CREATE TABLE `logintime` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` int(11) NOT NULL COMMENT '用户编号',
  `userName` varchar(20) NOT NULL COMMENT '用户名',
  `loginTime` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

/*Data for the table `logintime` */

insert  into `logintime`(`id`,`userId`,`userName`,`loginTime`) values 
(45,2,'JBIT','2017-08-16 22:29:38'),
(46,2,'JBIT','2017-08-16 22:32:44'),
(48,3,'dbqn','2017-08-16 22:34:54'),
(52,3,'dbqn','2017-08-17 00:17:32'),
(139,3,'dbqn','2017-08-20 10:51:09'),
(203,3,'dbqn','2017-08-22 10:45:12'),
(229,2,'JBIT','2017-08-23 08:47:40'),
(233,2,'JBIT','2017-08-23 09:55:24'),
(235,2,'JBIT','2017-08-23 10:08:28'),
(237,2,'JBIT','2017-08-23 10:17:47'),
(238,2,'JBIT','2017-08-23 10:20:15'),
(240,2,'JBIT','2017-08-23 10:22:54'),
(241,2,'JBIT','2017-08-23 10:42:51'),
(244,2,'JBIT','2017-08-23 11:08:12'),
(252,3,'dbqn','2017-08-25 12:07:36'),
(260,2,'JBIT','2017-08-25 15:06:01'),
(267,3,'dbqn','2017-08-26 11:46:33'),
(272,3,'dbqn','2017-08-26 13:20:45'),
(274,3,'dbqn','2017-08-26 13:24:46'),
(292,1,'admin','2017-08-27 12:49:00'),
(293,1,'admin','2017-08-27 12:51:30'),
(294,1,'admin','2017-08-28 08:36:25'),
(295,1,'admin','2017-08-28 08:36:26'),
(296,1,'admin','2017-08-28 08:40:07'),
(297,1,'admin','2017-08-28 08:40:09'),
(298,1,'admin','2017-08-28 08:42:25'),
(299,3,'dbqn','2017-08-28 08:43:08'),
(300,1,'admin','2017-08-28 08:52:11'),
(301,1,'admin','2017-08-28 09:45:49'),
(302,1,'admin','2017-08-28 09:45:51'),
(303,1,'admin','2017-08-28 09:53:34'),
(304,1,'admin','2017-08-28 10:00:53'),
(305,1,'admin','2017-08-28 10:00:54'),
(306,3,'dbqn','2017-08-28 10:02:04'),
(307,1,'admin','2017-08-28 10:23:01'),
(308,1,'admin','2017-08-28 10:24:02'),
(309,1,'admin','2017-08-28 10:29:29'),
(310,1,'admin','2017-08-28 10:43:30'),
(311,1,'admin','2017-08-28 11:00:38'),
(312,1,'admin','2017-08-28 11:29:18'),
(313,1,'admin','2017-08-28 11:39:30'),
(314,1,'admin','2017-08-28 12:09:41'),
(315,1,'admin','2017-08-28 17:51:53'),
(316,1,'admin','2017-08-28 18:01:01'),
(317,1,'admin','2017-08-28 18:01:02'),
(318,1,'admin','2017-08-28 19:22:13'),
(319,1,'admin','2017-08-28 19:24:59'),
(320,1,'admin','2017-08-28 19:27:56'),
(321,1,'admin','2017-08-28 19:41:42'),
(322,1,'admin','2017-08-28 19:41:44'),
(323,1,'admin','2017-08-28 19:47:00'),
(324,3,'dbqn','2017-08-28 19:47:50'),
(325,3,'dbqn','2017-08-28 19:49:51'),
(326,3,'dbqn','2017-08-28 19:51:16'),
(327,1,'admin','2017-08-28 19:54:23'),
(328,1,'admin','2017-08-28 20:13:24'),
(329,1,'admin','2017-08-29 17:44:08'),
(330,1,'admin','2017-08-30 09:03:56');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `content` varchar(200) DEFAULT NULL COMMENT '留言内容',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `newsText` varchar(600) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `createId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `root` int(20) DEFAULT NULL,
  `rocord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`newsText`,`createDate`,`createId`,`userId`,`root`,`rocord`) values 
(1,'呵呵','2017-08-26 04:53:04',4,1,14,0),
(2,'嗯嗯','2017-08-26 04:53:32',1,4,14,0),
(3,'123','2017-08-28 08:43:39',1,3,13,3),
(4,'哦哦','2017-08-28 09:03:41',3,1,13,3),
(5,'11','2017-08-28 20:13:43',3,1,13,3),
(6,'22','2017-08-28 20:14:21',3,1,13,3),
(7,'1','2017-08-28 20:14:37',3,1,13,0);

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `notice` */

insert  into `notice`(`id`,`title`,`content`,`createDate`) values 
(1,'测试公告1','12121321','2017-08-26 13:18:17');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `commentId` int(11) DEFAULT NULL COMMENT '评论编号',
  `replyText` varchar(200) DEFAULT NULL COMMENT '回复内容',
  `replyDate` datetime DEFAULT NULL COMMENT '回复时间',
  `replyName` varchar(20) DEFAULT NULL COMMENT '回复人',
  `parentName` varchar(20) DEFAULT NULL COMMENT '回复回复人的姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

insert  into `reply`(`id`,`commentId`,`replyText`,`replyDate`,`replyName`,`parentName`) values 
(2,10,'哦哦哦','2017-08-22 10:47:20','jbit','admin'),
(3,8,'呃呃鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅鹅','2017-08-22 10:53:23','admin','admin'),
(4,8,'哈哈哈','2017-08-22 11:37:19','admin','admin'),
(16,4,'哦哦哦','2017-08-27 12:28:42','admin','admin'),
(20,3,'哦哦哦','2017-08-28 19:47:28','admin','dbqn'),
(21,3,'222','2017-08-28 19:48:22','dbqn','admin'),
(22,4,'22','2017-08-28 19:54:14','dbqn','admin');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `userPwd` varchar(20) DEFAULT NULL COMMENT '密码',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `roleId` int(11) DEFAULT NULL COMMENT '用户类型编号',
  `roleName` varchar(20) DEFAULT NULL COMMENT '用户类型名称',
  `visit` int(11) DEFAULT NULL COMMENT '访问量',
  `lastTime` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`userName`,`userPwd`,`phone`,`name`,`roleId`,`roleName`,`visit`,`lastTime`) values 
(1,'admin','123456','11111111111','刘成',1,'系统管理员',298,'2017-08-29 17:44:08'),
(3,'dbqn','123456','11111111111','陈飞',2,'普通用户',NULL,'2017-08-28 19:49:51'),
(4,'aaa','123456','11111111111','成',2,'普通用户',0,NULL),
(5,'bbb','123456','12311111111','飞',2,'普通用户',0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
