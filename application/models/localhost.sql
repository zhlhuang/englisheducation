-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 04 月 17 日 21:58
-- 服务器版本: 5.5.28
-- PHP 版本: 5.4.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `english_web`
--
CREATE DATABASE `english_web` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `english_web`;

-- --------------------------------------------------------

--
-- 表的结构 `en_dis_tail`
--

CREATE TABLE IF NOT EXISTS `en_dis_tail` (
  `dis_tailid` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `dis_tailcontent` varchar(256) NOT NULL COMMENT '尾巴内容',
  `dis_tailuserid` varchar(32) NOT NULL COMMENT '尾巴所属用户',
  `dis_flag` int(2) NOT NULL COMMENT '是否显示尾巴',
  PRIMARY KEY (`dis_tailid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `en_dis_type`
--

CREATE TABLE IF NOT EXISTS `en_dis_type` (
  `dis_typeid` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `dis_typename` varchar(32) NOT NULL COMMENT '分类名称',
  `dis_intro` varchar(128) NOT NULL COMMENT '分类简介',
  `dis_allcount` int(16) NOT NULL COMMENT '该分类帖子数量',
  `dis_id` bigint(32) NOT NULL COMMENT '最后一个帖id',
  PRIMARY KEY (`dis_typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `en_discuss`
--

CREATE TABLE IF NOT EXISTS `en_discuss` (
  `dis_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `dis_title` varchar(48) NOT NULL COMMENT '帖子标题',
  `dis_content` varchar(1024) NOT NULL COMMENT '帖子内容',
  `dis_state` varchar(16) NOT NULL COMMENT '帖子状态',
  `dis_recount` int(16) NOT NULL COMMENT '评论数量',
  `dis_userid` bigint(32) NOT NULL COMMENT '发帖作者',
  `dis_time` int(10) NOT NULL COMMENT '发帖时间',
  `dis_typeid` int(16) NOT NULL COMMENT '发帖所属类型',
  `dis_IP` varchar(16) NOT NULL COMMENT '发帖IP',
  PRIMARY KEY (`dis_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `en_imember`
--

CREATE TABLE IF NOT EXISTS `en_imember` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `userid` bigint(32) NOT NULL COMMENT '用户id',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `address` varchar(64) DEFAULT NULL COMMENT '家庭地址',
  `phone` varchar(16) DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12313 ;

-- --------------------------------------------------------

--
-- 表的结构 `en_level`
--

CREATE TABLE IF NOT EXISTS `en_level` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `points` int(16) NOT NULL COMMENT '积分段',
  `level` varchar(16) NOT NULL COMMENT '等级名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `en_member`
--

CREATE TABLE IF NOT EXISTS `en_member` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `userid` varchar(32) NOT NULL COMMENT '用户名id',
  `uname` varchar(16) NOT NULL COMMENT '昵称',
  `password` varchar(32) NOT NULL COMMENT 'MD5密码',
  `email` varchar(32) NOT NULL COMMENT '邮箱',
  `schoolid` int(16) NOT NULL COMMENT '学校id',
  `rname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `idtype` int(4) NOT NULL COMMENT '人员类型代号',
  `sex` char(1) NOT NULL COMMENT '性别',
  `qq` int(16) NOT NULL COMMENT 'QQ号码',
  `state` int(4) NOT NULL COMMENT '验证状态',
  `logintime` int(10) NOT NULL COMMENT '登录时间',
  `retime` int(10) NOT NULL COMMENT '注册时间',
  `loginIP` varchar(32) NOT NULL COMMENT '登录ip',
  `reIP` varchar(32) NOT NULL COMMENT '注册Pip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `en_question`
--

CREATE TABLE IF NOT EXISTS `en_question` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `userid` varchar(32) NOT NULL COMMENT '用户id',
  `question` varchar(64) NOT NULL COMMENT '验证问题',
  `answer` varchar(64) NOT NULL COMMENT '验证答案',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `en_rediscuss`
--

CREATE TABLE IF NOT EXISTS `en_rediscuss` (
  `redis_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `redis_content` varchar(526) NOT NULL COMMENT '评论内容',
  `redis_time` int(10) NOT NULL COMMENT '评论发表时间',
  `redis_fromuserid` varchar(32) NOT NULL COMMENT '评论人id',
  `redis_touserid` varchar(32) NOT NULL COMMENT '被评论人id',
  `dis_id` bigint(32) NOT NULL COMMENT '被评论帖子id',
  PRIMARY KEY (`redis_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `en_reredis`
--

CREATE TABLE IF NOT EXISTS `en_reredis` (
  `reredis_id` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `redis_id` int(16) NOT NULL COMMENT '所回复评论的id',
  `reredis_content` varchar(512) NOT NULL COMMENT '回复内容',
  `reredis_time` int(10) NOT NULL COMMENT '回复时间',
  `reredis_fromuserid` varchar(32) NOT NULL COMMENT '回复人的id',
  `reredis_touserid` varchar(32) NOT NULL COMMENT '被回复人的id',
  PRIMARY KEY (`reredis_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `en_usertype`
--

CREATE TABLE IF NOT EXISTS `en_usertype` (
  `idtype` int(16) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `typename` varchar(16) NOT NULL COMMENT '类型名称',
  `power` int(4) NOT NULL COMMENT '管理权限',
  PRIMARY KEY (`idtype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
