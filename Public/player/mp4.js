//需要使用jquery库 配置为普通地址调用 帮助：http://www.ckplayer.com/tool/flashvars.htm
var flashvars = {
	f:cms_player.url,
	c:0,
	p:1
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