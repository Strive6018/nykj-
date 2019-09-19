<php>$item_special = ff_mysql_special('limit:35;tag_name:'.$special_type.';tag_list:special_type;page_is:true;page_id:special;page_p:'.$special_page.';cache_name:default;cache_time:default;order:special_addtime desc');
$page = ff_url_page('special/show',array('type'=>urlencode($special_type),'p'=>'FFLINK'),true,'special',4);
$totalpages = ff_page_count('special', 'totalpages');
</php>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<php>$list_dir = 'special';</php>
<title>影视专题第{$special_page}页_{$site_name}</title>
<meta name="keywords" content="{$list_keywords}">
<meta name="description" content="{$list_description}">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<include file="Home:header" />
 </head>
<body>
<include file="Home:heanvd" />
<div class="top_banner">
	<div class="banner_main">
		<div class="container_inner">
			<h1 class="banner_title Special_title">全网影视专题榜</h1>
			<div class="banner_img"></div>
		</div>
	</div>
</div>
  <div class="yk-container"> 
   <div class="yk-row"> 
    <div class="yk-pannel clearfix"> 
     <div class="yk-pannel-box"> 

      <div class="yk-pannel_bd clearfix"> 
       <div class="yk-vodlist clearfix"> 
	   <div class="yk-special">
        <volist name="item_special" id="feifei">
      <a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}" target="_blank" class="cover_item">
      <img class="cover_pic quic ff-img" data-original="{$feifei.special_logo|ff_url_img}" alt="{$feifei.special_name}">
        <div class="cover_title">{$feifei.special_name}</div></a>
        </volist> 
		</div > 
       </div > 
      </div> 
     </div> 
    </div>
 <div class="list-pager-v2">{$page}</div>
      </div>
      </div>
   </div>
 </div>
<include file="Home:forum" />
</body>
</html>