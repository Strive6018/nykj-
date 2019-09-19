//需要使用jquery库 配置为普通地址调用 http://www.ckplayer.com/tool/flashvars.htm
//test http://ztest.qiniudn.com/sintel.m3u8
var flashvars = {
	    f: 'http://www.ckplayer.com/ckplayer/m3u8.swf', 		//使用swf向播放器发送视频地址进行播放
			a: cms_player.url,     
	    c: 0,		//调用 ckplayer.js 配置播放器
	    p: 1,		//自动播放视频
	    s: 4,		//flash插件形式发送视频流地址给播放器进行播放
	    lv: 0
};
var params = {
	bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'
};
var video = [
	cms_player.url+'->video/mp4',
	cms_player.url+'->video/webm',
	cms_player.url+'->video/ogg'
];
var getScript = function(url, callback){
  var script = document.createElement("script");
  script.type = "text/javascript";
  if(typeof(callback) != "undefined"){
    if (script.readyState) {
      script.onreadystatechange = function () {
        if (script.readyState == "loaded" || script.readyState == "complete") {
          script.onreadystatechange = null;
          callback();
        }
      };
    } else {
      script.onload = function () {
        callback();
      };
    }
  }
  script.src = url;
  document.body.appendChild(script);
}
getScript("http://www.ckplayer.com/ckplayer/6.8/ckplayer.js", function() {
	CKobject.embed('http://www.ckplayer.com/ckplayer/6.8/ckplayer.swf','cms_player','ckplayer_cms_player','100%','100%',false,flashvars,video,params);
});