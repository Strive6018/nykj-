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
preg_match('|"mp4":(.*?)}|i',$info,$m);
$m3 = str_replace('\\','',$m[1]);
preg_match('|"u4f4eu6e05":"(.*?)"|i',$m3,$m5);
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
    var flashvars={
        f:'<?php echo $m5[1] ?>',
        c:0,
        p:1
    };
    var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'};
    var video=['<?php echo $m5[1] ?>'];
    CKobject.embed('/ckplayer/ckplayer.swf','a1','ckplayer_a1','100%',h,false,flashvars,video,params);
</script>
</body>
</html>