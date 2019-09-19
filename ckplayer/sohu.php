<?php
error_reporting(0);
header("Content-Type: text/html; charset=utf-8"); 
// 检查是否直接访问本页面
if( isset($_SERVER['HTTP_REFERER']) ) {
    $url_array = explode('http://', $_SERVER['HTTP_REFERER']);
    $url = explode('/', $url_array[1]);
    if($_SERVER['SERVER_NAME'] != $url[0]) {
        // 您不是从本站来的;
        exit('Access Denied! You are not coming from the site!');
    }
} else {// 禁止直接访问此页;
    exit('Access Denied! Please do not load this page directly.');
}
$url1 = $_GET['v']; 
$url="http://acfunfix.sinaapp.com/mama.php?url=$url1&callback=MAMA2_HTTP_JSONP_CALLBACK0";
$info=file_get_contents($url);
$info = str_replace('\/','/',$info);
preg_match('|"m3u8":(.*?)}|i',$info,$m);
preg_match('|":"(.*?)"|i',$m[1],$m1);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
body {
	background-color: #000;
	margin-left: 0px;
	margin-top: 0px;
}
a:link {
	color: #093;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #093;
}
a:hover {
	text-decoration: underline;
	color: #093;
}
a:active {
	text-decoration: none;
	color: #093;
}
body,td,th {
	color: #093;
}
</style>
</head>
<body>
<div id="a1"></div>
<script type="text/javascript" src="/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
var h = window.parent.frames.Player.Height;
var flashvars = {
	f: '/ckplayer/m3u8.swf', 		//使用swf向播放器发送视频地址进行播放
	a: encodeURIComponent(decodeURIComponent('<?php echo $m1[1] ?>')),	//m3u8文件
	c: 0,		//调用 ckplayer.js 配置播放器
	p: 1,		//自动播放视频
	s: 4,		//flash插件形式发送视频流地址给播放器进行播放
	lv: 0,		//注意，如果是直播，需设置lv:1
	loaded: 'loadedHandler'
}
    var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always'};
    var video=['<?php echo $m1[1] ?>'];
    CKobject.embed('/ckplayer/ckplayer.swf','a1','ckplayer_a1','100%',h,false,flashvars,video,params);
</script>
</body>
</html>