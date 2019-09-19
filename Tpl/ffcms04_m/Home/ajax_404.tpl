<php>$item_list = ff_mysql_list('sid:1;limit:5;cache_name:default;cache_time:default;order:list_pid asc,list_oid;sort:asc');</php>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>抱歉，您访问的页面不存在 - {$site_name}</title>
<meta name="title" content="您找的页面飘得有点远-{$site_name}">
<meta name="keywords" content="视频,视频分享,视频搜索,视频播放" />
<meta name="description" content="视频服务平台,提供视频播放,视频发布,视频搜索,视频分享" />
<include file="Home:header_meta" />
</head>
<body>
<include file="Home:header" />
<style>
.yk-con{
    padding-top: 0;
}
.yk-error{
    color: #909090;
    text-align: center;
    position: absolute;
    width: 100%;
    left: 0;
    overflow: hidden;
    margin-bottom: .5rem;
    position: relative;
    height: 25rem;
    overflow: hidden;
    transform: translateZ(0);
}
.yk-error .yk-error-bg{
    height: 15rem;
    position: relative;
}
.yk-error .yk-error-bg .yk-error-img{
    height: 100%;
    background: url("/Public/ffcms/404/404bg.png") no-repeat top center;
    background-size: auto 100%;
    position: relative;
    z-index: 2;
}
.yk-error .yk-error-bg .yk-error-banner{
    top: 0;
    left: 0;
    position: absolute;
    z-index: 1;
    width: 100%;
}
.yk-error p,.yk-error a, .yk-error h1{
    font-family: "Microsoft YaHei", "微软雅黑", helvetica, arial, verdana, tahoma, sans-serif;
}

.yk-error .yk-error-bg2 .yk-error-banner {
    height: 100%;
    background-color:#66D0FF;
}

.yk-error h1{
    font-size:1.5rem;
    color: #3399e0;
    line-height: 32px;
    margin-bottom: 20px;
    font-weight: normal;
}
.yk-error .yk-error-detail{
	vertical-align: middle;
    width: auto;
    margin: 0 auto;
}
.yk-error .yk-error-detail:after {
    visibility: hidden;
    display: block;
    font-size: 0;
    content: " ";
    clear: both;
    height: 0;
}
.yk-error-detail .yk-error-info,.yk-error-detail .yk-error-app{
    float: left;
}
.yk-error-detail .yk-error-info{
	padding-left: .5rem;
    text-align: left;
    border-right: 1px solid #cecece;
    height: 2.5rem;
}
.yk-error-detail .yk-error-info span{
    display: block;
	font-size: .8rem;
    line-height: 1.5rem;
}
.yk-error-detail .yk-error-app{
    margin-left: 18px;
    padding: 10px 60px 10px 0;
    width: 145px;
    height: 44px;
    background-color: #1c98e7;
    border-radius: 2px;
    position: relative;
}
.yk-error-detail .yk-error-app:hover {
    background-color: #1a8ed8;
}
.yk-error-detail .yk-error-app span,.yk-error-detail .yk-error-info em{
    display: block;
    text-align: center;
}
.yk-error-detail .yk-error-app span{
    font-size: 20px;
    color: #ffffff;
    line-height: 22px;
}
.yk-error-detail .yk-error-app em {
    font-size: 14px;
    color: #95ddfc;
    line-height: 14px;
    margin-top: 8px;
    font-style: normal;
}
.yk-error-detail .yk-error-app img {
    position: absolute;
    right: 17px;
    bottom: 2px;
}
.yk-error  p{
    margin: 20px 0;
    text-align: center;
    font-size: 16px;
}
.yk-error  p img{
    vertical-align: bottom;
}
.yk-error .yk-error-btn{
	background-color: #1c98e7;
    color: #fff;
    padding: 0 10px;
    font-size: .75rem;
    line-height: 1.2rem;
    vertical-align: middle;
    display: inline-block;
    margin: 0 .3rem;
    zoom: 1;
}
.yk-error .yk-error-btn:hover {
    background-color: #1a89cf;
}
.yk-error a,.yk-error em {
    color:#3399e0 ;
    font-style: normal;
}
.yk-error .yk-error-detail img{
    vertical-align: middle;
}
.yk-drawer-rec-subscribe .yk-drawer-box .yk-head .yk-title .rec-title{
    color: #909090;
}
.yk-error-rec{
    padding-top: 540px;
}
.yk-error-rec .yk-drawer{
    border: none;
}
</style>
	<section class="mod aui-margin-t-0">
		<div class="mod-main clearfix">
<div class="yk-error">
       <div class="yk-error-bg yk-error-bg1 yk-error-bg2">
              <div class="yk-error-img"></div>
              <div class="yk-error-banner"></div>
        </div>
	<h1 id="errorcont">抱歉，您访问的页面不存在</h1>
	 <div class="yk-error-detail">
                            <div class="yk-error-info">
                                <span class="aui-ellipsis-1">若是通过站外搜索而报错，可以点击<a href="/" class="yk-error-btn"> 首页 </a>重新查找~~</span>
                                <span class="aui-ellipsis-1">若是查看站内链接而报错，请联系<a href="{:ff_url('forum/guestbook',array('p'=>1),true)}">{$site_name|msubstr=0,2}客服</a>哦(づ￣3￣)づ</span>
                            </div>

                        </div>
                        <p><img src="/Public/ffcms/404/4044E.png">还剩<em id="mes">10</em>秒</p>
                    
</div>

</div>
</div>

</div>
</div>
			</div>
		</div>
	</section>


<!--
<script language="javascript" type="text/javascript"> 
var i = 9; 
var intervalid; 
intervalid = setInterval("fun()", 1000); 
function fun() { 
if (i == 0) { 
window.location.href = "../"; 
clearInterval(intervalid); 
} 
document.getElementById("mes").innerHTML = i; 
i--; 
} 
</script>  
-->
<include file="Home:footer" />

</body>
</html>