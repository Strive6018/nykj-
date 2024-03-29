﻿SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `ff_admin` (
  `admin_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_pwd` char(32) NOT NULL,
  `admin_count` smallint(6) NOT NULL,
  `admin_ok` varchar(50) NOT NULL,
  `admin_del` bigint(1) NOT NULL,
  `admin_ip` varchar(40) NOT NULL,
  `admin_email` varchar(40) NOT NULL,
  `admin_logintime` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
INSERT INTO `ff_admin` (`admin_id`, `admin_name`, `admin_pwd`, `admin_count`, `admin_ok`, `admin_del`, `admin_ip`, `admin_email`, `admin_logintime`) VALUES
(1, 'admin', '7fef6171469e80d32c0559f88b377245', 206, '1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1', 0, '127.0.0.1', '2251209984@qq.com', 2251209984);


CREATE TABLE IF NOT EXISTS `ff_ads` (
  `ads_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `ads_name` varchar(50) NOT NULL,
  `ads_content` text NOT NULL,
  PRIMARY KEY (`ads_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
INSERT INTO `ff_ads` (`ads_id`, `ads_name`, `ads_content`) VALUES
(1, '90_m', '工具>网站广告管理>广告标识（90_m）'),
(2, '60_m', '工具>网站广告管理>广告标识（60_m）'),
(3, '300_250', '工具>网站广告管理>广告标识（300_250）'),
(4, '300_250m', '工具>网站广告管理>广告标识（300_250m）'),
(5, '300_300', '工具>网站广告管理>广告标识（300_300）'),
(6, '960_90', '工具>网站广告管理>广告标识（960_90）');

CREATE TABLE IF NOT EXISTS `ff_card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_number` varchar(64) NOT NULL,
  `card_face` mediumint(8) NOT NULL,
  `card_uid` int(11) NOT NULL DEFAULT '0',
  `card_status` tinyint(1) NOT NULL DEFAULT '0',
  `card_addtime` int(11) NOT NULL,
  `card_usetime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_cj` (
  `cj_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `cj_name` varchar(255) NOT NULL,
  `cj_url` varchar(255) NOT NULL,
  `cj_type` tinyint(2) NOT NULL DEFAULT '1',
  `cj_appid` varchar(50) NOT NULL,
  `cj_appkey` varchar(50) NOT NULL,
  PRIMARY KEY (`cj_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
INSERT INTO `ff_cj` (`cj_id`, `cj_name`, `cj_url`, `cj_type`, `cj_appid`, `cj_appkey`) VALUES

(1, '好影视资源1', 'http://www.haozy.cc/inc/api.php', 1, '', ''),
(2, '酷云资源库2', 'http://caiji.kuyun98.com/inc/ldg_api.php', 1, '', ''),
(3, '影视资源库3', 'http://www.apizyp.com/inc/feifei3/', 1, '', ''),
(4, '酷云资源库4', 'http://caiji.kuyunzyw.com/inc/ldg_kkm3u8.asp', 1, '', ''),
(5, '影视资源库5', 'http://cdn.feifeicms.co/api/hao124/', 1, '', ''),
(6, '猫眼资源库6', 'http://www.maoyanys.com/inc/api.php', 1, '', ''),
(7, '秒播资源库7', 'http://caiji.mb77.vip/inc/mbckm3u8.php', 1, '', ''),
(8, '迅雷资源库8', 'http://fp.feifeiv.com/index.php', 1, '', '');
CREATE TABLE IF NOT EXISTS `ff_forum` (
  `forum_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `forum_cid` mediumint(9) NOT NULL,
  `forum_cid_ep` smallint(5) NOT NULL,
  `forum_sid` tinyint(1) NOT NULL DEFAULT '1',
  `forum_uid` mediumint(9) NOT NULL DEFAULT '1',
  `forum_pid` mediumint(9) NOT NULL DEFAULT '0',
  `forum_title` varchar(255) NOT NULL,
  `forum_content` text NOT NULL,
  `forum_up` mediumint(9) NOT NULL DEFAULT '0',
  `forum_down` mediumint(9) NOT NULL DEFAULT '0',
  `forum_reply` mediumint(9) NOT NULL DEFAULT '0',
  `forum_report` mediumint(9) NOT NULL DEFAULT '0',
  `forum_ip` varchar(20) NOT NULL,
  `forum_addtime` int(11) NOT NULL,
  `forum_status` tinyint(1) NOT NULL DEFAULT '0',
  `forum_istop` tinyint(1) NOT NULL DEFAULT '0',
  `forum_referer` varchar(150) NOT NULL,
  PRIMARY KEY (`forum_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `ff_link` (
  `link_id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) NOT NULL,
  `link_logo` varchar(255) NOT NULL,
  `link_url` varchar(255) NOT NULL,
  `link_order` tinyint(4) NOT NULL,
  `link_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
INSERT INTO `ff_link` (`link_id`, `link_name`, `link_logo`, `link_url`, `link_order`, `link_type`) VALUES
(1, '飞飞官方网站', '', 'http://www.fificms.com', 1, 1),
(2, '至尊版系统介绍', '', 'http://www.ffcmsphp.com/thread-3118-1-1.html', 2, 1),
(3, '商业版系统介绍', '', 'http://www.ffcmsphp.com/forum.php?mod=viewthread&tid=100&extra=page%3D1', 3, 1),
(4, '淘片屋影视', '', 'http://v.fificms.com', 4, 1);

CREATE TABLE IF NOT EXISTS `ff_list` (
  `list_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `list_pid` smallint(3) NOT NULL,
  `list_oid` smallint(3) NOT NULL,
  `list_sid` tinyint(1) NOT NULL,
  `list_name` char(20) NOT NULL,
  `list_skin` char(20) NOT NULL,
  `list_skin_detail` varchar(20) NOT NULL DEFAULT 'detail',
  `list_skin_play` varchar(20) NOT NULL DEFAULT 'play',
  `list_skin_type` varchar(20) NOT NULL DEFAULT 'type',
  `list_dir` varchar(90) NOT NULL,
  `list_status` tinyint(1) NOT NULL DEFAULT '1',
  `list_keywords` varchar(255) NOT NULL,
  `list_title` varchar(50) NOT NULL,
  `list_description` varchar(255) NOT NULL,
  `list_copyright` smallint(3) NOT NULL,
  `list_ispay` tinyint(1) NOT NULL DEFAULT '0',
  `list_price` smallint(6) NOT NULL DEFAULT '0',
  `list_trysee` smallint(6) NOT NULL DEFAULT '0',
  `list_extend` text,
  PRIMARY KEY (`list_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
INSERT INTO `ff_list` (`list_id`, `list_pid`, `list_oid`, `list_sid`, `list_name`, `list_skin`, `list_skin_detail`, `list_skin_play`, `list_skin_type`, `list_dir`, `list_status`, `list_keywords`, `list_title`, `list_description`, `list_copyright`, `list_ispay`, `list_price`, `list_trysee`, `list_extend`) VALUES
(1, 0, 1, 1, '电影', 'channel_dy', 'detail', 'play', 'type', 'dianying', 1, '电影,电影大全,电影天堂,最新电影,好看的电影,电影排行榜', '', '为您提供更新电影、好看的电影排行榜及电影迅雷下载，免费在线观看伦理电影、动作片、喜剧片、爱情片、搞笑片等全新电影。', 0, 0, 0, 0, '{"type":"\\u559c\\u5267,\\u7231\\u60c5,\\u6050\\u6016,\\u52a8\\u4f5c,\\u79d1\\u5e7b,\\u5267\\u60c5,\\u6218\\u4e89,\\u8b66\\u532a,\\u72af\\u7f6a,\\u52a8\\u753b,\\u5947\\u5e7b,\\u6b66\\u4fa0,\\u5192\\u9669,\\u67aa\\u6218,\\u6050\\u6016,\\u60ac\\u7591,\\u60ca\\u609a,\\u7ecf\\u5178,\\u9752\\u6625,\\u6587\\u827a,\\u5fae\\u7535\\u5f71,\\u53e4\\u88c5,\\u5386\\u53f2,\\u8fd0\\u52a8,\\u519c\\u6751,\\u513f\\u7ae5,\\u7f51\\u7edc\\u7535\\u5f71","area":"\\u5185\\u5730,\\u7f8e\\u56fd,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u97e9\\u56fd,\\u65e5\\u672c,\\u6cd5\\u56fd,\\u82f1\\u56fd,\\u5fb7\\u56fd,\\u6cf0\\u56fd,\\u5370\\u5ea6,\\u6b27\\u6d32,\\u4e1c\\u5357\\u4e9a,\\u5176\\u4ed6","year":"2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000","star":"\\u738b\\u5b9d\\u5f3a,\\u9ec4\\u6e24,\\u5468\\u8fc5,\\u5468\\u51ac\\u96e8,\\u8303\\u51b0\\u51b0,\\u9648\\u5b66\\u51ac,\\u9648\\u4f1f\\u9706,\\u90ed\\u91c7\\u6d01,\\u9093\\u8d85,\\u6210\\u9f99,\\u845b\\u4f18,\\u6797\\u6b63\\u82f1,\\u5f20\\u5bb6\\u8f89,\\u6881\\u671d\\u4f1f,\\u5f90\\u5ce5,\\u90d1\\u607a,\\u5434\\u5f66\\u7956,\\u5218\\u5fb7\\u534e,\\u5468\\u661f\\u9a70,\\u6797\\u9752\\u971e,\\u5468\\u6da6\\u53d1,\\u674e\\u8fde\\u6770,\\u7504\\u5b50\\u4e39,\\u53e4\\u5929\\u4e50,\\u6d2a\\u91d1\\u5b9d,\\u59da\\u6668,\\u502a\\u59ae,\\u9ec4\\u6653\\u660e,\\u5f6d\\u4e8e\\u664f,\\u6c64\\u552f,\\u9648\\u5c0f\\u6625","state":"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e","language":"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83","version":"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248","weekday":"\\u4e00,\\u4e8c,\\u4e09,\\u56db,\\u4e94,\\u516d,\\u65e5"}'),
(2, 0, 2, 1, '电视剧', 'channel_ds', 'detail', 'play', 'type', 'dianshiju', 1, '电视剧,最新电视剧,好看的电视剧,热播电视剧,电视剧在线观看', '', '为您提供新电视剧排行榜，韩国电视剧、泰国电视剧、香港TVB全新电视剧排行榜、好看的电视剧等热播电视剧排行榜，并提供免费高清电视剧下载及在线观看。', 0, 0, 0, 0, '{"type":"\\u53e4\\u88c5,\\u6218\\u4e89,\\u9752\\u6625\\u5076\\u50cf,\\u559c\\u5267,\\u5bb6\\u5ead,\\u72af\\u7f6a,\\u52a8\\u4f5c,\\u5947\\u5e7b,\\u5267\\u60c5,\\u5386\\u53f2,\\u7ecf\\u5178,\\u4e61\\u6751,\\u60c5\\u666f,\\u5546\\u6218,\\u7f51\\u5267,\\u5176\\u4ed6","area":"\\u5185\\u5730,\\u97e9\\u56fd,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u65e5\\u672c,\\u7f8e\\u56fd,\\u6cf0\\u56fd,\\u82f1\\u56fd,\\u65b0\\u52a0\\u5761,\\u5176\\u4ed6","year":"2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2006,2005,2004","star":"\\u738b\\u5b9d\\u5f3a,\\u80e1\\u6b4c,\\u970d\\u5efa\\u534e,\\u8d75\\u4e3d\\u9896,\\u5218\\u6d9b,\\u5218\\u8bd7\\u8bd7,\\u9648\\u4f1f\\u9706,\\u5434\\u5947\\u9686,\\u9646\\u6bc5,\\u5510\\u5ae3,\\u5173\\u6653\\u5f64,\\u5b59\\u4fea,\\u674e\\u6613\\u5cf0,\\u5f20\\u7ff0,\\u674e\\u6668,\\u8303\\u51b0\\u51b0,\\u6797\\u5fc3\\u5982,\\u6587\\u7ae0,\\u9a6c\\u4f0a\\u740d,\\u4f5f\\u5927\\u4e3a,\\u5b59\\u7ea2\\u96f7,\\u9648\\u5efa\\u658c,\\u674e\\u5c0f\\u7490","state":"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e","language":"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83","version":"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248","weekday":"\\u4e00,\\u4e8c,\\u4e09,\\u56db,\\u4e94,\\u516d,\\u65e5"}'),
(3, 0, 3, 1, '动漫', 'channel_dm', 'detail', 'play', 'type', 'dongman', 1, '动漫,动漫大全,最新动漫,好看的动漫,日本动漫,动漫排行榜', '', '为您提供新动漫、好看的动漫排行榜，免费高清在线观看热血动漫、卡通动漫、新番动漫、百合动漫、搞笑动漫、国产动漫、动漫电影等热门动漫。', 0, 0, 0, 0, '{"type":"\\u60c5\\u611f,\\u79d1\\u5e7b,\\u70ed\\u8840,\\u63a8\\u7406,\\u641e\\u7b11,\\u5192\\u9669,\\u841d\\u8389,\\u6821\\u56ed,\\u52a8\\u4f5c,\\u673a\\u6218,\\u8fd0\\u52a8,\\u6218\\u4e89,\\u5c11\\u5e74,\\u5c11\\u5973,\\u793e\\u4f1a,\\u539f\\u521b,\\u4eb2\\u5b50,\\u76ca\\u667a,\\u52b1\\u5fd7,\\u5176\\u4ed6","area":"\\u56fd\\u4ea7,\\u65e5\\u672c,\\u6b27\\u7f8e,\\u5176\\u4ed6","year":"2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000","star":"","state":"","language":"","version":"TV\\u7248,\\u7535\\u5f71\\u7248,OVA\\u7248,\\u771f\\u4eba\\u7248","weekday":"\\u4e00,\\u4e8c,\\u4e09,\\u56db,\\u4e94,\\u516d,\\u65e5"}'),
(4, 0, 4, 1, '综艺', 'channel_zy', 'detail', 'play', 'type', 'zongyi', 1, '综艺,综艺节目,最新综艺节目,综艺节目排行榜', '', '为您提供新综艺节目、好看的综艺节目排行榜，免费高清在线观看选秀、情感、访谈、搞笑、真人秀、脱口秀等热门综艺节目。', 0, 0, 0, 0, '{"type":"\\u9009\\u79c0,\\u60c5\\u611f,\\u8bbf\\u8c08,\\u64ad\\u62a5,\\u65c5\\u6e38,\\u97f3\\u4e50,\\u7f8e\\u98df,\\u7eaa\\u5b9e,\\u66f2\\u827a,\\u751f\\u6d3b,\\u6e38\\u620f\\u4e92\\u52a8,\\u8d22\\u7ecf,\\u6c42\\u804c","area":"\\u5185\\u5730,\\u6e2f\\u53f0,\\u65e5\\u97e9,\\u6b27\\u7f8e","year":"2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000","star":"\\u4f55\\u7085,\\u6c6a\\u6db5,\\u8c22\\u5a1c,\\u5468\\u7acb\\u6ce2,\\u9648\\u9c81\\u8c6b,\\u5b5f\\u975e,\\u674e\\u9759,\\u6731\\u519b,\\u6731\\u4e39,\\u534e\\u5c11,\\u90ed\\u5fb7\\u7eb2,\\u6768\\u6f9c","state":"","language":"","version":"","weekday":"\\u4e00,\\u4e8c,\\u4e09,\\u56db,\\u4e94,\\u516d,\\u65e5"}'),
(5, 0, 5, 1, '娱乐', 'channel_sp', 'detail_sp', 'play_sp', 'type_sp', 'yule', 1, '', '', '', 0, 0, 0, 0, '{"type":"VR,\\u641e\\u7b11,\\u6e38\\u620f,\\u79d1\\u6280,\\u52a8\\u6f2b,\\u661f\\u5ea7,\\u65c5\\u6e38,\\u5065\\u5eb7\\u517b\\u751f,\\u8fd0\\u52a8\\u5065\\u8eab,\\u97f3\\u4e50,\\u821e\\u8e48,\\u6c7d\\u8f66,\\u7f8e\\u5973,\\u738b\\u8005\\u8363\\u8000,\\u82f1\\u96c4\\u8054\\u76df","area":"\\u5185\\u5730,\\u6e2f\\u53f0,\\u65e5\\u97e9,\\u6b27\\u7f8e","year":"2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000","star":"","state":"","language":"","version":"","weekday":"\\u4e00,\\u4e8c,\\u4e09,\\u56db,\\u4e94,\\u516d,\\u65e5"}'),
(6, 0, 6, 2, '资讯', 'list', 'detail', 'play', 'type', 'zixun', 1, '影视资讯,剧情介绍', '最新影视资讯', '影视资讯,剧情介绍,搞笑段子,微信热文,伤感文章,情感日志,心情日记,散文精选。', 0, 0, 0, 0, '{"type":"\\u5f71\\u89c6\\u8d44\\u8baf,\\u5267\\u60c5\\u4ecb\\u7ecd,\\u641e\\u7b11\\u6bb5\\u5b50,\\u5fae\\u4fe1\\u70ed\\u6587,\\u4f24\\u611f\\u6587\\u7ae0,\\u60c5\\u611f\\u65e5\\u5fd7,\\u5fc3\\u60c5\\u65e5\\u8bb0,\\u6563\\u6587\\u7cbe\\u9009","area":"","year":"","star":"","state":"","language":"","version":""}');

CREATE TABLE IF NOT EXISTS `ff_nav` (
  `nav_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nav_pid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nav_oid` tinyint(3) NOT NULL DEFAULT '1',
  `nav_title` varchar(50) NOT NULL DEFAULT '',
  `nav_tips` varchar(50) NOT NULL DEFAULT '',
  `nav_link` varchar(255) NOT NULL DEFAULT '',
  `nav_status` tinyint(1) NOT NULL DEFAULT '1',
  `nav_target` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;
INSERT INTO `ff_nav` (`nav_id`, `nav_pid`, `nav_oid`, `nav_title`, `nav_tips`, `nav_link`, `nav_status`, `nav_target`) VALUES
(1, 0, 1, '首页', 'index', '/', 1, 0),
(2, 0, 2, '电视剧', 'dianshiju', '?s=/vod-show-id-2.html', 1, 0),
(3, 0, 3, '电影', 'dianying', '?s=/vod-show-id-1.html', 1, 0),
(4, 0, 4, '动漫', 'dongman', '?s=/vod-show-id-3.html', 1, 0),
(5, 0, 5, '综艺', 'zongyi', '?s=/vod-show-id-4.html', 1, 0),
(6, 0, 6, '娱乐', 'yule', '?s=/vod-show-id-5.html', 1, 0),
(7, 0, 7, '资讯', 'zixun', '?s=news-show-id-6.html', 1, 0),
(8, 0, 8, '专题', 'special', '?s=special-show-p-1.html', 1, 0),
(9, 0, 9, '评论', 'forum', '?s=forum-index.html', 1, 0),
(10, 0, 10, '剧情', 'scenario', '?s=scenario-index.html', 1, 0);

CREATE TABLE IF NOT EXISTS `ff_news` (
  `news_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `news_cid` smallint(6) NOT NULL DEFAULT '0',
  `news_name` varchar(255) NOT NULL,
  `news_ename` varchar(255) DEFAULT NULL,
  `news_keywords` varchar(255) NOT NULL,
  `news_type` varchar(255) DEFAULT '',
  `news_color` char(8) NOT NULL,
  `news_pic` varchar(255) NOT NULL,
  `news_pic_bg` varchar(255) DEFAULT NULL,
  `news_pic_slide` varchar(255) DEFAULT NULL,
  `news_inputer` varchar(50) NOT NULL,
  `news_reurl` varchar(255) NOT NULL,
  `news_remark` text NOT NULL,
  `news_content` text NOT NULL,
  `news_hits` mediumint(8) NOT NULL,
  `news_hits_day` mediumint(8) NOT NULL,
  `news_hits_week` mediumint(8) NOT NULL,
  `news_hits_month` mediumint(8) NOT NULL,
  `news_hits_lasttime` int(11) NOT NULL,
  `news_stars` tinyint(1) NOT NULL,
  `news_status` tinyint(1) NOT NULL DEFAULT '1',
  `news_up` mediumint(8) NOT NULL,
  `news_down` mediumint(8) NOT NULL,
  `news_jumpurl` varchar(255) NOT NULL,
  `news_letter` char(2) NOT NULL,
  `news_addtime` int(11) NOT NULL,
  `news_skin` varchar(30) NOT NULL,
  `news_gold` decimal(3,1) NOT NULL,
  `news_golder` smallint(6) NOT NULL,
  PRIMARY KEY (`news_id`),
  KEY `news_cid` (`news_cid`),
  KEY `news_up` (`news_up`),
  KEY `news_down` (`news_down`),
  KEY `news_gold` (`news_gold`),
  KEY `news_hits` (`news_hits`,`news_cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `ff_player` (
  `player_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `player_name_zh` varchar(128) NOT NULL,
  `player_name_en` varchar(128) NOT NULL,
  `player_info` varchar(250) NOT NULL,
  `player_order` smallint(3) NOT NULL DEFAULT '0',
  `player_status` tinyint(1) NOT NULL DEFAULT '1',
  `player_copyright` smallint(3) NOT NULL DEFAULT '0',
  `player_jiexi` varchar(120) NOT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
INSERT INTO `ff_player` (`player_id`, `player_name_zh`, `player_name_en`, `player_info`, `player_order`, `player_status`, `player_copyright`, `player_jiexi`) VALUES
(1, '框架引用', 'iframe', 'iframe引用任何网页', 1, 1, 0, ''),
(2, '影音先锋', 'xfplay', '需下载安装影音先锋', 2, 1, 0, ''),
(3, '西瓜影音', 'xigua', '需下载安装西瓜播放器', 3, 1, 0, ''),
(4, '吉吉影音', 'jjvod', '需下载安装吉吉影音播放器', 4, 1, 0, ''),
(5, '非凡影音', 'ffhd', '需下载安装非凡影音播放器', 5, 1, 0, ''),
(6, '优酷网', 'youku', '视频来源优酷网', 6, 1, 0, ''),
(7, '腾讯视频', 'qq', '视频来源腾讯视频', 9, 1, 0, ''),
(8, '爱奇艺', 'iqiyi', '视频来源爱奇艺', 8, 1, 0, ''),
(9, '乐视网', 'letv', '视频来源乐视网', 21, 1, 0, ''),
(10, '搜狐', 'sohu', '视频来源搜狐网', 7, 1, 0, ''),
(11, '土豆网', 'tudou', '视频来源土豆网', 13, 1, 0, ''),
(12, 'PPTV', 'pptv', '视频来源pptv', 14, 1, 0, ''),
(13, '芒果TV', 'mgtv', 'mgtv', 10, 1, 0, ''),
(14, '响巢看看', 'kankan', 'kankan', 22, 1, 0, ''),
(15, 'CkPlayer', 'ckplayer', 'ckplayer', 33, 1, 0, ''),
(16, '下载', 'down', 'down', 12, 1, 0, ''),
(17, '风行', 'fun', '视频来源风行', 25, 1, 0, ''),
(18, '迅雷', 'xunlei', 'xunlei', 27, 1, 0, ''),
(19, 'M1905', 'm1905', '视频来源m1905', 24, 1, 0, ''),
(20, 'CNTV', 'cntv', '视频来源央视', 16, 1, 0, ''),
(21, '自定义播放器', 'video', '自定义播放器html5的video标签', 29, 1, 0, ''),
(22, 'CCTV', 'cctv', '视频来源央视', 17, 1, 0, ''),
(23, 'PPS', 'pps', '视频来源PPS', 23, 1, 0, ''),
(24, 'IFENG', 'ifeng', '视频来源凤凰网', 20, 1, 0, ''),
(25, 'm3u8', 'm3u8', 'm3u8', 32, 1, 0, ''),
(26, 'mp4', 'mp4', '', 34, 1, 0, ''),
(27, '线路1', 'ckm3u8', 'ckm3u8', 35, 1, 0, ''),
(28, '线路2', 'kkm3u8', 'kkm3u8', 36, 1, 0, ''),
(29, '线路3', 'jsm3u8', 'jsm3u8', 37, 1, 0, ''),
(30, '线路4', 'kuyun', '', 39, 1, 0, ''),
(31, '线路5', 'kkyun', '', 40, 1, 0, ''),
(32, '线路6', 'mbckm3u8', '秒播M3U8', 41, 1, 0, ''),
(33, '线路7', 'mbyun', '秒播云', 42, 1, 0, ''),
(34, '线路7', 'maoyanm3u8', '猫眼m3u8', 43, 1, 0, ''),
(35, '线路8', 'maoyanzy', '猫眼云播', 44, 1, 0, ''),
(36, '线路9', 'jsyun', '', 45, 1, 0, '');
CREATE TABLE IF NOT EXISTS `ff_orders` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_sign` varchar(32) NOT NULL,
  `order_status` tinyint(1) NOT NULL DEFAULT '0',
  `order_uid` mediumint(8) NOT NULL DEFAULT '0',
  `order_gid` mediumint(8) NOT NULL DEFAULT '0',
  `order_total` smallint(6) NOT NULL,
  `order_money` decimal(18,2) NOT NULL DEFAULT '0.00',
  `order_ispay` tinyint(1) NOT NULL DEFAULT '0',
  `order_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `order_addtime` int(11) NOT NULL,
  `order_paytime` int(11) NOT NULL,
  `order_confirmtime` int(11) NOT NULL,
  `order_info` tinytext NOT NULL,
  `order_paytype` varchar(64) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_uid` mediumint(8) NOT NULL DEFAULT '1',
  `record_sid` mediumint(8) NOT NULL DEFAULT '1',
  `record_did` mediumint(8) NOT NULL,
  `record_did_sid` tinyint(3) NOT NULL,
  `record_did_pid` smallint(6) NOT NULL,
  `record_type` tinyint(2) NOT NULL,
  `record_time` int(11) NOT NULL,
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `record_id` (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_score` (
  `score_id` int(10) NOT NULL AUTO_INCREMENT,
  `score_uid` mediumint(8) NOT NULL,
  `score_sid` tinyint(3) NOT NULL,
  `score_did` mediumint(8) NOT NULL,
  `score_type` tinyint(3) NOT NULL,
  `score_ext` mediumint(8) NOT NULL,
  `score_addtime` int(11) NOT NULL,
  PRIMARY KEY (`score_id`),
  KEY `score_id` (`score_id`),
  KEY `score_uid` (`score_uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_slide` (
  `slide_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `slide_oid` tinyint(3) NOT NULL,
  `slide_cid` tinyint(3) NOT NULL DEFAULT '1',
  `slide_name` varchar(255) NOT NULL,
  `slide_logo` varchar(255) NOT NULL,
  `slide_pic` varchar(255) NOT NULL,
  `slide_url` varchar(255) NOT NULL,
  `slide_content` varchar(255) NOT NULL,
  `slide_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`slide_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_special` (
  `special_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `special_banner` varchar(150) NOT NULL,
  `special_logo` varchar(150) NOT NULL,
  `special_name` varchar(150) NOT NULL,
  `special_type` varchar(255) NOT NULL,
  `special_ename` varchar(255) DEFAULT NULL,
  `special_tag_name` varchar(255) NOT NULL,
  `special_ids_vod` varchar(255) DEFAULT NULL,
  `special_ids_news` varchar(255) DEFAULT NULL,
  `special_title` varchar(150) DEFAULT NULL,
  `special_keywords` varchar(150) NOT NULL,
  `special_description` varchar(255) NOT NULL,
  `special_color` char(8) NOT NULL,
  `special_skin` varchar(50) NOT NULL,
  `special_addtime` int(11) NOT NULL,
  `special_hits` mediumint(8) NOT NULL,
  `special_hits_day` mediumint(8) NOT NULL,
  `special_hits_week` mediumint(8) NOT NULL,
  `special_hits_month` mediumint(8) NOT NULL,
  `special_hits_lasttime` int(11) NOT NULL,
  `special_stars` tinyint(1) NOT NULL DEFAULT '1',
  `special_status` tinyint(1) NOT NULL,
  `special_content` text NOT NULL,
  `special_up` mediumint(8) NOT NULL,
  `special_down` mediumint(8) NOT NULL,
  `special_gold` decimal(3,1) NOT NULL,
  `special_golder` smallint(6) NOT NULL,
  PRIMARY KEY (`special_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `ff_tag` (
  `tag_id` mediumint(8) NOT NULL,
  `tag_cid` tinyint(2) DEFAULT '0',
  `tag_name` varchar(50) NOT NULL,
  `tag_list` varchar(32) DEFAULT 'vod_tag' COMMENT 'vod_tag|news_tag|vod_type|news_type',
  `tag_ename` varchar(255) DEFAULT NULL,
  KEY `tag_id` (`tag_id`),
  KEY `tag_cid` (`tag_cid`),
  KEY `tag_list` (`tag_list`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `ff_user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_pid` mediumint(8) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_pwd` char(32) NOT NULL,
  `user_score` mediumint(9) NOT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT '1',
  `user_follow` mediumint(8) NOT NULL DEFAULT '0',
  `user_group` tinyint(1) NOT NULL,
  `user_logip` varchar(16) NOT NULL,
  `user_lognum` smallint(5) NOT NULL DEFAULT '1',
  `user_logtime` int(10) NOT NULL,
  `user_joinip` varchar(16) NOT NULL,
  `user_jointime` int(10) NOT NULL,
  `user_deadtime` int(10) NOT NULL,
  `user_qq` varchar(20) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_face` varchar(50) NOT NULL,
  `user_up` mediumint(8) NOT NULL DEFAULT '0',
  `user_down` mediumint(9) NOT NULL DEFAULT '0',
  `user_hits` mediumint(8) NOT NULL DEFAULT '0',
  `user_api_token` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO `ff_user` (`user_id`, `user_pid`, `user_name`, `user_pwd`, `user_score`, `user_status`, `user_follow`, `user_group`, `user_logip`, `user_lognum`, `user_logtime`, `user_joinip`, `user_jointime`, `user_deadtime`, `user_qq`, `user_email`, `user_face`, `user_up`, `user_down`, `user_hits`) VALUES
(1, 0, '游客', '7fef6171469e80d32c0559f88b377245', 842, 1, 0, 0, '127.0.0.1', 1, 1502804676, '', 1970, 1503236536, '', '2251209984@qq.com', '', 0, 0, 0);

CREATE TABLE IF NOT EXISTS `ff_vod` (
  `vod_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vod_cid` smallint(6) NOT NULL,
  `vod_name` varchar(255) NOT NULL,
  `vod_ename` varchar(255) DEFAULT '',
  `vod_title` varchar(255) DEFAULT '',
  `vod_keywords` varchar(255) DEFAULT '',
  `vod_type` varchar(255) DEFAULT '',
  `vod_color` char(8) DEFAULT '',
  `vod_actor` varchar(255) DEFAULT '',
  `vod_director` varchar(255) DEFAULT '',
  `vod_content` text,
  `vod_pic` varchar(255) DEFAULT '',
  `vod_pic_bg` varchar(255) DEFAULT '',
  `vod_pic_slide` varchar(255) DEFAULT '',
  `vod_area` char(10) DEFAULT '',
  `vod_language` char(10) DEFAULT '',
  `vod_year` smallint(4) DEFAULT '0',
  `vod_continu` varchar(20) DEFAULT '0',
  `vod_total` mediumint(9) DEFAULT '0',
  `vod_isend` tinyint(1) DEFAULT '1',
  `vod_addtime` int(11) DEFAULT '0',
  `vod_filmtime` int(11) DEFAULT '0',
  `vod_hits` mediumint(8) DEFAULT '0',
  `vod_hits_day` mediumint(8) DEFAULT '0',
  `vod_hits_week` mediumint(8) DEFAULT '0',
  `vod_hits_month` mediumint(8) DEFAULT '0',
  `vod_hits_lasttime` int(11) DEFAULT '0',
  `vod_stars` tinyint(1) DEFAULT '1',
  `vod_status` tinyint(1) DEFAULT '1',
  `vod_up` mediumint(8) DEFAULT '0',
  `vod_down` mediumint(8) DEFAULT '0',
  `vod_ispay` tinyint(1) DEFAULT '0',
  `vod_price` smallint(6) DEFAULT '0',
  `vod_trysee` smallint(6) NOT NULL,
  `vod_play` varchar(255) DEFAULT '',
  `vod_server` varchar(255) DEFAULT '',
  `vod_url` longtext,
  `vod_inputer` varchar(30) DEFAULT '',
  `vod_reurl` varchar(255) DEFAULT '',
  `vod_jumpurl` varchar(150) DEFAULT '',
  `vod_letter` char(2) DEFAULT '',
  `vod_skin` varchar(30) DEFAULT '',
  `vod_gold` decimal(3,1) DEFAULT '0.0',
  `vod_golder` smallint(6) DEFAULT '0',
  `vod_length` smallint(6) DEFAULT '0',
  `vod_weekday` varchar(60) DEFAULT '',
  `vod_series` varchar(120) DEFAULT '',
  `vod_copyright` smallint(3) DEFAULT '0',
  `vod_state` varchar(30) DEFAULT '',
  `vod_version` varchar(30) DEFAULT '',
  `vod_tv` varchar(30) DEFAULT '',
  `vod_douban_id` int(11) DEFAULT '0',
  `vod_douban_score` decimal(3,1) DEFAULT '0.0',
  `vod_scenario` longtext,
  `vod_extend` text,
  PRIMARY KEY (`vod_id`),
  KEY `vod_cid` (`vod_cid`),
  KEY `vod_up` (`vod_up`),
  KEY `vod_down` (`vod_down`),
	KEY `vod_gold` (`vod_gold`),
  KEY `vod_addtime` (`vod_addtime`,`vod_cid`),
  KEY `vod_hits` (`vod_hits`,`vod_cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
