<php>if($special_tag_name){
	$item_vod = ff_mysql_vod('limit:40;tag_name:'.$special_tag_name.';tag_list:vod_tag;cache_name:default;cache_time:default;order:vod_hits desc');
}else{
	$item_vod = ff_mysql_vod('limit:40;ids:'.$special_ids_vod.';cache_name:default;cache_time:default;order:vod_hits desc');
}
</php>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<php>$list_dir = 'special';</php>
<title>{$special_title|default=$special_name.'－影视专题'}－{$site_name}</title>
<meta name="keywords" content="{$special_keywords|default='专题'.$special_name}">
<meta name="description" content="{$special_description|default=msubstr(h($special_content),0,100)}">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<include file="Home:header" />
<link rel="stylesheet" href="{$public_path}/ffcms/css/play.css"/>
</head>
<body>
<include file="Home:heanvd" />
<div class="menu-box"></div>
<div class="main-box">
  <div class="main-top clearfix"> 
   <dl> 
    <dt>
     <a href="{:ff_url('special/read', array('id'=>$special_id), true)}" title="{$special_name}"><img src="{:ff_url_img($special_logo,$special_content)}" alt="{$special_name}" width="820" height="380" /></a>
    </dt> 
    <dd> 
     <h1>{$special_name}</h1> 
     <div class="article-tips">
      <span>时间：{$special_addtime|date='Y-m-d H:i:s',###}</span>
      <span>责任编辑：{$site_name|msubstr=0,4}</span>
     </div> 
     <div class="article">
      <p>{$special_content}</p>
     </div> 
     <div class="share clearfix"> 
     <span class="ff-desc">分享给朋友：</span>
      <span class="ff-share"> </span>
     </div> 
    </dd> 
   </dl> 
  </div>
<div class="main-link"> 
   <ul> 
   <volist name=":ff_mysql_special('limit:5;order:special_addtime desc')" id="feifei">
    <li><a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}" title="{$feifei.special_name}">{$feifei.special_name}</a>&nbsp;/</li> 
	</volist> 
   </ul> 
  </div> 
  <div class="main-list"> 
   <ul class="show-model clearfix"> 
   <volist name="item_vod" id="feifei">
    <li class="model-mb"> 
     <dl> 
	 <dt class="playlike">
       <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank">
	   <img class="ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}" width="180" height="246" />
	   <span class="playicon"></span><span class="playshow"><include file="Home:vod_continu" /></span></a>
      </dt> 
      <dd> 
       <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank"><h3>{$feifei.vod_name}</h3></a> 
       <p>年代：{$feifei.vod_year}</p> 
	   <p>地区：{$feifei.vod_area}</p> 
       <p>导演：{$feifei.vod_director}</p> 
       <p>主演：{$feifei.vod_actor}</p> 
       <div class="show-model-art"> 

        <p>简介：{$feifei.vod_content|msubstr=0,25}...</p> 
        <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank">详情&gt;&gt;</a> 
       </div> 
      </dd> 
     </dl>
	 </li> 
	 </volist>
   </ul> 
  </div>  
 </div> 
</div> 

<include file="Home:forum" />
</body>
</html>
