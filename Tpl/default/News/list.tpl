<php>$item_news = ff_mysql_news('cid:'.$list_id.';limit:15;page_is:true;page_id:list;page_p:'.$list_page.';cache_name:default;cache_time:default;order:news_addtime;sort:desc');
$page = ff_url_page('news/'.$action,array('id'=>$list_id,'list_dir'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
$totalpages = ff_page_count('list', 'totalpages');
</php>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title>{$type_year}{$type_area}{$type_type}{$type_star}{$type_state}{$list_name}大全-{$list_name}排行榜-{$site_name}</title>
  <meta name="keywords" content="{$list_keywords}">
  <meta name="description" content="{$list_description}">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
  <meta name="renderer" content="webkit|ie-comp|ie-stand" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<include file="Home:header" />
<link rel="stylesheet" href="{$public_path}/ffcms/css/news.css"/>
</head>
 <body>
<include file="Home:heanvd" />
<div class="menu-box"></div>
<div class="main-box">
<div class="main newslist">
<div class="listl list2">
<div class="yrdaohang">当前位置：<a href="/">{$site_name}</a> &gt; <a href="{:ff_url_news_show($list_id,$list_dir,1)}">{$list_name}</a></div>
		<ul>
		<volist name="item_news" id="feifei">
                <li>
					<div class="viewimg">
                    <a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}">
                    <img src="{$feifei.news_pic|ff_url_img=$feifei['news_content']}" alt="{$feifei.news_name}" width="250" height="165"></a>
					</div>
					<h3><a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}" title="{$feifei.news_name}">{$feifei.news_name}</a></h3>
					<p>{$feifei.news_content|trim|msubstr=0,120}</p>
					<div class="hotimgbz"><span>栏目：{$feifei.list_name}</span><span>时间：{$feifei.news_addtime|date='Y-m-d H:i:s',###}</span><span>热度：<egt name="feifei.news_hits" value="100">100<else/>{$feifei.news_hits}</egt>℃</span></div>
				</li>
				</volist>
				</ul>
	<div class="list-pager-v2">{$page}</div>
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
  $(document).ready(function(){
  $(".news_content p").last().append("<a href='{$site_url}' target='_blank'><span class='ykico'><em class='ykegt'>返回{$site_name}首页&gt;&gt;</em></span></a>");
});

</script>
<include file="Home:forum" />
</body>
</html>
