<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>{$news_name}_{$site_name}</title>
<meta name="keywords" content="{$list_keywords}">
<meta name="description" content="{$list_description}">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<include file="Home:header" />
<link rel="stylesheet" href="{$public_path}ffcms/css/news.css"/>
</head>
<include file="Home:heanvd" />
<div class="menu-box"></div>
<div class="main-box">
<div class="main newslist">
<div class="listl list2">
<div class="news_title">
        <h1>{$news_name}</h1>
        <div class="news_line">
          <div class="news_z">
            <li><a href="{:ff_url_news_show($list_id,$list_dir,1)}" target="_self">{$list_name}</a></li>
            </ul>
          </div>
          <div class="news_time">发布时间：<span>{$news_addtime|date='Y-m-d H:i:s',###}</span></div>
        <div class="news_time">来源：<span>{$site_name}</span></div>
        </div>
      </div>
	<div class="news_content">{$news_content}
	  <div class="tags text-center">
    <a class="btn btn-default btn-lg ff-updown-set" href="javascript:;" data-id="{$news_id}" data-module="news" data-type="up" data-toggle="tooltip" data-placement="top" title="支持">
      <span class="glyphicon glyphicon-thumbs-up"></span> 有用 (<span class="ff-updown-val">{$news_up}</span>)
    </a>  
	<span class="ff-desc">分享给朋友：</span><span class="ff-share"></span>
  </div>
	
	</div>
	</div>
	
    <div class="listr">
   <div class="recommend">
	<div class="module-tit"> 
	  <h2>今日头条</h2>
	</div>
	<ul class="ulfix">
		<volist name=":ff_mysql_news('limit:14;order:news_hits desc')" id="feifei">
            <li><a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}" title="{$feifei.news_name}" target="_blank"></em>
				<div class="viewimg"><img src="{$feifei.news_pic|ff_url_img=$feifei['news_content']}" alt="{$feifei.news_name}" width="150" height="98"></div>
				 <p>{$feifei.news_name|msubstr=0,23}</p></a></li>
			</volist>
			</ul>
		</div>
   
	 </div>	
  </div>	
</div>	
</div>	

{$news_hits_insert}
   

<script> 
var top1=$(".scroll").offset().top;
　　　　$(window).scroll(function(){
　　　　　　var  win_top=$(this).scrollTop();
　　　　　　var  top=$(".scroll").offset().top;
　　　　　　if(win_top>=top){
　　　　　　　　$(".scroll").css({"position":"fixed","top":"0","right":"13.5%","z-index":"10"}).addClass('stosition');  
　　　　　　}
　　　　　　if(win_top<top1){
　　　　　　　　$(".scroll").css({"position":"","top":"","right":"","z-index":""}).removeClass('stosition');   
　　　　　　}
  });

</script>
<include file="Home:forum" />


</body>
</html>
