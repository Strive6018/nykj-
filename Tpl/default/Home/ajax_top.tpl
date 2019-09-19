<php>$item_list = ff_mysql_list('sid:1;limit:5;cache_name:default;cache_time:default;order:list_pid asc,list_oid;sort:asc');</php>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>全网影视排行榜-{$site_name}</title>
<meta name="title" content="全网影视排行榜-{$site_name}">
<meta name="keywords" content="热搜榜、热门搜索排行榜、全网影视排行榜、影视排行、视频搜索，全网视频搜索，全网电影 、电视剧、综艺、动漫、明星、娱乐、音乐、游戏、高清视频"/>
<meta name="description" content="腾讯视频全网搜索，全网影视排行榜，提供最新最全的影视资料，最新最热费高清电影、电视剧、动漫、综艺等网络视频，搜啥有啥。"/>
<include file="Home:header" />
</head>
<body>
<include file="Home:heanvd" />
<div class="top_banner">
	<div class="banner_main">
		<div class="container_inner">
			<h1 class="banner_title">全网影视排行榜</h1>
		</div>
	</div>
</div>
<div class="main-box"> 
<volist name="item_list" id="feifeilist" offset="0" length="4">

<div class="exp-Sort">
 <h2 class="title"><a href="{$feifeilist.list_link}" target="_blank">{$feifeilist.list_name}</a><a href="{$feifeilist.list_link}" class="more" target="_blank">更多</a></h2>
 
<ul>
<volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:50;cache_name:default;cache_time:default;order:vod_hits desc,vod_addtime;sort:desc')" id="feifei" key="k" offset="0" length="1">
<li class="first">
<h2><i class="num colred{$k}">{$k}</i><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank" title="{$feifei.vod_name}" class="ellipsis">{$feifei.vod_name}</a>
<em class="exup"></em></h2>
<p class="expnum">播放指数：{$feifei.vod_hits}</p>
<p><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank" class="checked">
<img class="quic" src="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" title="{$feifei.vod_name}" alt="{$feifei.vod_name}">
</a></p>
</li>
</volist>
 <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:50;cache_name:default;cache_time:default;order:vod_hits desc,vod_addtime;sort:desc')" id="feifei" key="k" offset="1" length="50">
<li>
<h2><i class="num <in name="k" value="1,2">colred{$k+1}</in>">{$k+1}</i>
<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank" title="{$feifei.vod_name}" class="ellipsis">{$feifei.vod_name}</a>
<em class="<in name="k" value="1,2">up<else/>down</in>"></em></h2>
<p class="expnum">播放指数：{$feifei.vod_hits}</p>
</li>
</volist>

 </ul>
</div>

</volist>
</div>
</div>
<include file="Home:forum" />
</body>
</html>