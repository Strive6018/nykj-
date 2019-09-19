<php>$item_list = ff_mysql_list('sid:1;limit:5;cache_name:default;cache_time:default;order:list_pid asc,list_oid;sort:asc');</php>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<php>$list_dir = 'index';</php>
<title>{$site_title}</title>
<meta name="keywords" content="{$site_keywords}">
<meta name="description" content="{$site_description}">
<include file="Home:header" />
</head>
<body>
<include file="Home:heanvd" />
<div class="lunhuan" id="carousel1">
    <div id="lunhuanback">
	<volist name=":ff_mysql_slide('limit:10;order:slide_oid;sort:desc')" id="feifei" offset="0" length="1">
        <a style="background-image:url({$feifei.slide_pic|ff_url_img});opacity: 1;display: block;background-color:{$feifei.slide_content};" href="{$feifei.slide_url}" ></a>
	</volist>
	<volist name=":ff_mysql_slide('limit:10;order:slide_oid;sort:desc')" id="feifei" offset="1" length="9">
        <a style="background-image:url({$feifei.slide_pic|ff_url_img});opacity: 0;display: none;background-color:{$feifei.slide_content};" href="{$feifei.slide_url}" ></a>
	</volist>
    </div>
	<div class="slider_nav" id='lunbonum'>
		<volist name=":ff_mysql_slide('limit:10;order:slide_oid;sort:desc')" id="feifei" offset="0" length="1" key="k">
			 <a href="{$feifei.slide_url}" class="current"  target="_blank"><div class="tit">{$feifei.slide_name}</div><div class="txt">{$feifei.slide_logo}</div></a>
					  </volist>
			<volist name=":ff_mysql_slide('limit:10;order:slide_oid;sort:desc')" id="feifei" offset="1" length="9" key="k">
			 <a href="{$feifei.slide_url}" target="_blank"><div class="tit">{$feifei.slide_name}</div><div class="txt">{$feifei.slide_logo}</div></a>
					  </volist>

			 </div>
		<div class="slider_mask"></div>
</div>
 <div class="yk-container"> 
   <div class="yk-row"> 
<div class="yk-guide clearfix"> 
<ul class="nav-guide">
		<li class="nav-group">
		<volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" key="k" offset="1" length="1">
		<span class="channel yk-dsj"><a href="{$feifei.nav_link}" target="_self">{$feifei.nav_title}</a>
		<dl class="channel-layer"> 
   <span class="arrow"></span> 
   <dt> 
    <a title="进入{$feifei.nav_title}" href="{$feifei.nav_link}">进入{$feifei.nav_title} &gt;</a> 
   </dt> 
   <dd class="col-left"> 
   <volist name=":ff_mysql_vod('cid:2;limit:8;order:vod_addtime desc')" id="feifei" key="k" offset="0" length="4">
    <a title="{$feifei.vod_name}" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a> 
	</volist>
   </dd> 
   <dd> 
   <volist name=":ff_mysql_vod('cid:2;limit:8;order:vod_addtime desc')" id="feifei" key="k" offset="4" length="4">
    <a title="{$feifei.vod_name}" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a> 
	</volist>
   </dd> 
  </dl>
  </span>
  </volist>
		<volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" key="k" offset="2" length="1">
		<span class="channel yk-dyj"><a href="{$feifei.nav_link}" target="_self">{$feifei.nav_title}
		<dl class="channel-layer"> 
   <span class="arrow"></span> 
   <dt> 
    <a title="进入{$feifei.nav_title}" href="{$feifei.nav_link}">进入{$feifei.nav_title} &gt;</a> 
   </dt> 
   <dd class="col-left"> 
   <volist name=":ff_mysql_vod('cid:1;limit:8;order:vod_addtime desc')" id="feifei" key="k" offset="0" length="4">
    <a title="{$feifei.vod_name}" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a> 
	</volist>
   </dd> 
   <dd> 
   <volist name=":ff_mysql_vod('cid:1;limit:8;order:vod_addtime desc')" id="feifei" key="k" offset="4" length="4">
    <a title="{$feifei.vod_name}" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a> 
	</volist>
   </dd> 
  </dl>
  </a>
  </span>
  </volist>
		<volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" key="k" offset="3" length="4">
		<span class="channel"><a href="{$feifei.nav_link}" target="_self">{$feifei.nav_title}</a></span><eq name="k" value="1"><br></eq>
		</volist>
			</li>

			<li class="nav-group">
	<volist name="item_list" id="feifeilist" offset="1" length="1">
    <volist name=":explode(',',$feifeilist['list_extend']['star'])" id="feifeitype" key="k" offset="0" length="6">
	<span class="channel"><a href="{:ff_url('vod/search',array('wd'=>urlencode($feifeitype)),true)}" target="_blank">{$feifeitype}</a></span><eq name="k" value="3"><br></eq>
    </volist>
	</volist>
		</volist>	
		</li>
			<li class="nav-group">
	<volist name="item_list" id="feifeilist" offset="1" length="1">
	<volist name=":explode(',',$feifeilist['list_extend']['type'])" id="feifeitype" key="k" offset="0" length="6">
	<span class="channel"><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" target="_self">{$feifeitype}剧</a></span><eq name="k" value="3"><br></eq>
	</volist>
		</volist>	
		</li>

			<li class="nav-group">
	<volist name="item_list" id="feifeilist" offset="0" length="1">
	<volist name=":explode(',',$feifeilist['list_extend']['type'])" id="feifeitype" key="k" offset="0" length="6">
	<span class="channel"><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" target="_self">{$feifeitype}片</a></span><eq name="k" value="3"><br></eq>
	</volist>
		</volist>	
		</li>
	<li class="nav-group nav-group-icon">
		<span class="channel-icon channel-list">
		<volist name="item_list" id="feifeilist" offset="1" length="1">
			<a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" target="_blank">{$site_name|msubstr=0,2}片库</a>
			</volist>	
		</span>    
		<span class="colx channel-icon channel-index">
			<a href="{:ff_url('ajax/top', '', true)}" target="_blank">热搜榜</a>
		</span>   
		<span class="colx channel-icon  channel-dayu">
			<volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="5" length="1">
			<a href="{$feifei.nav_link}" target="_self">推荐精选</a>
			</volist>
		</span>                   
		<span class="channel-icon channel-download">
			<volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="7" length="1">
			<a href="{$feifei.nav_link}" target="_self">影视专题</a>
			</volist>
		</span>                 
	</li>    
 </ul>	
</div>

   
<include file="Block:index_rb" />
<include file="Block:index_tv" />
<include file="Block:index_dy" />

<include file="Block:index_zy" />
<include file="Block:index_dm" />
<include file="Block:index_sp" />
<include file="Block:index_new" />

    <div class="yk-pannel clearfix"> 
     <div class="yk-pannel-box"> 
      <div class="yk-pannel_hd"> 
       <div class="yk-pannel_head clearfix"> 
        <h3 class="title">友情·链接</h3> 
       </div> 
      </div> 
      <div class="yk-pannel_bd clearfix"> 
	  	   <div class="yk-text-link">
  <volist name=":ff_mysql_link('limit:20;cache_name:default;cache_time:default;order:link_order;sort:asc')" id="feifei"><li><a href="{$feifei.link_url}" target="_blank">{$feifei.link_name}</a></li></volist>
  </div>
     </div> 
    </div>
 </div>
</div>
</div>
<include file="Home:forum" />
</body>
</html>