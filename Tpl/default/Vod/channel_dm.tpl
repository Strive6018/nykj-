<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>{$site_title}</title>
<meta name="keywords" content="{$site_keywords}">
<meta name="description" content="{$site_description}">
<include file="Home:header" />
</head>
<body>
<include file="Home:heanvd" />
<div class="lunhuan" id="carousel1">
    <div id="lunhuanback">
	<volist name=":ff_mysql_slide('cid:'.$list_id.';limit:10;order:slide_oid;sort:desc')" id="feifei" offset="0" length="1">
        <a style="background-image:url({$feifei.slide_pic|ff_url_img});opacity: 1;display: block;background-color:{$feifei.slide_content};" href="{$feifei.slide_url}" ></a>
	</volist>
	<volist name=":ff_mysql_slide('cid:'.$list_id.';limit:10;order:slide_oid;sort:desc')" id="feifei" offset="1" length="9">
        <a style="background-image:url({$feifei.slide_pic|ff_url_img});opacity: 0;display: none;background-color:{$feifei.slide_content};" href="{$feifei.slide_url}" ></a>
	</volist>
    </div>
	<div class="slider_nav" id='lunbonum'>
		<volist name=":ff_mysql_slide('cid:'.$list_id.';limit:10;order:slide_oid;sort:desc')" id="feifei" offset="0" length="1" key="k">
			 <a href="{$feifei.slide_url}" class="current"  target="_blank"><div class="tit">{$feifei.slide_name}</div><div class="txt">{$feifei.slide_logo}</div></a>
					  </volist>
			<volist name=":ff_mysql_slide('cid:'.$list_id.';limit:10;order:slide_oid;sort:desc')" id="feifei" offset="1" length="9" key="k">
			 <a href="{$feifei.slide_url}" target="_blank"><div class="tit">{$feifei.slide_name}</div><div class="txt">{$feifei.slide_logo}</div></a>
					  </volist>

			 </div>
		<div class="slider_mask"></div>
</div>
		<div class="column">
			<div class="le_screen">
				<div class="nav_box nav_box1">
					<h4>按类型</h4>
					<ul>
		<volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length="10">
		<li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a></li>
		</volist>
	<li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>'addtime','p'=>1),true)}">更多</a></li>
					</ul>
				</div>
				</volist>
				<div class="nav_box nav_box1">
					<h4>按类型</h4>
					<ul>
		<volist name=":explode(',',$list_extend['type'])" id="feifei" offset="10" length="12">
		<li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a></li>
		</volist>
	<li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>'addtime','p'=>1),true)}">更多</a></li>
					</ul>
				</div>
				</volist>
				<div class="nav_box nav_box1">
					<h4>按地区</h4>
					<ul>
		<volist name=":explode(',',$list_extend['area'])" id="feifei" offset="0" length="12">
		<li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($feifei),'year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a></li></volist>
		<li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($type_type),'area'=>'','year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>'addtime','p'=>1),true)}">更多</a></li>
					</ul>
				</div>
				</volist>
				<div class="nav_box nav_box2">
					<h4>按年代</h4>
					<ul>
		<volist name=":explode(',',$list_extend['year'])" id="feifei" offset="0" length="9">
		<li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$feifei,'star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a></li>
		</volist>
		<li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'19902009','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更早</a></li>
					</ul>
				</div>
				</volist>
			</div>
		</div>

 <div class="yk-container"> 
   <div class="yk-row"> 
<!--最近更新-->
<div class="yk-pannel clearfix"> 
   <div class="yk-pannel-box"> 
    <div class="yk-pannel_hd"> 
     <div class="yk-pannel_head clearfix"> 
      <h3 class="title">最近更新</h3> 
     </div> 
    </div> 
    <div class="yk-pannel_bd clearfix"> 
     <ul class="index-list-1 active clearfix">
      <volist name=":ff_mysql_vod('cid:'.$list_id.';limit:12;order:vod_addtime desc')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
    </div> 
   </div> 
  </div>
 </volist> 

<volist name=":explode(',',$list_extend['type'])" id="feifeilist" offset="0" length="8">
<php>$item_vod=ff_mysql_vod('cid:'.$list_id.';tag_name:'.$feifeilist.';tag_list:vod_type;limit:12;cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc');if(!$item_vod){continue;}</php>
<!--{$feifeilist}动漫-->
<div class="yk-pannel clearfix"> 
   <div class="yk-pannel-box"> 
    <div class="yk-pannel_hd"> 
     <div class="yk-pannel_head clearfix"> 
      <a class="more text-muted pull-right" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifeilist),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多{$feifeilist}动漫</a> 
      <h3 class="title">{$feifeilist}动漫</h3> 
     </div> 
    </div> 
    <div class="yk-pannel_bd clearfix"> 
     <ul class="index-list-1 active clearfix">
      <volist name="item_vod" id="feifei">
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
    </div> 
   </div> 
  </div>
 </volist> 
</div> 
</div>
<include file="Home:forum" />
</body>
</html>