<?php 
/**
 * @author 飞飞CMS影视管理系统
 * @copyright 2017
 * @email  www.ffcmsphp.com
 * @company 飞飞影视版权所有
 * @version    1.0
 *
 *
 * 严重警告：
 * 1、源码仅供学习交流使用。
 * 2、禁止用于危害官方利益的行为。
 * 3、禁止用于违反法律法规的行为。
 *
 */
?>
<!DOCTYPE html>
<html xmlns="http:www.w3.org/1999/xhtml">
<head>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>飞飞解析</title>
<style type="text/css">body,html,div{background-color:black;padding: 0;margin: 0;width:100%;height:100%;}</style>
</head>
<body>
<div id="a1"></div>
<script type="text/javascript" src="/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript"> 
    var purl = '<?php echo($_REQUEST['url']);?>';
	var flashvars={
	f:'/ckplayer/m3u8.swf',
	a:encodeURIComponent(purl), 
	s:4,
	c:0,
	p:1
    };

	    var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'};
    CKobject.embedSWF('/ckplayer/ckplayer.swf','a1','ckplayer_a1','100%','100%',flashvars,params);
    
	var isiPad = navigator.userAgent.match(/iPad|iPhone|Linux|Android|iPod/i) != null;
		if (isiPad) {
			var html = '<video src="'+purl+'" controls="controls" autoplay="autoplay" width="100%" height="100%"></video>';
			document.getElementById('a1').innerHTML = html;
		}
function playerstop(){
window.parent.frames.MacPlayer.GoNextUrl();
return false;
};
</script>
</div> 
</body>
</html>

