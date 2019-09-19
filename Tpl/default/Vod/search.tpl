<php>
if($search_wd){
$item_vod = ff_mysql_vod('cid:'.$search_id.';wd:'.$search_wd.';limit:5;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('id'=>$search_id,'wd'=>urlencode($search_wd),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_actor){
$item_vod = ff_mysql_vod('actor:'.$search_actor.';limit:30;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('actor'=>urlencode($search_actor),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_director){
$item_vod = ff_mysql_vod('director:'.$search_director.';limit:30;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('director'=>urlencode($search_director),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_name){
$item_vod = ff_mysql_vod('name:'.$search_name.';limit:30;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('name'=>urlencode($search_name),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_title){
$item_vod = ff_mysql_vod('title:'.$search_title.';limit:30;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('title'=>urlencode($search_title),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}
$totalpages = ff_page_count('search', 'totalpages');
</php>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<title>《{$search_name}{$search_actor}{$search_director}{$search_wd}》第{$search_page}页_{$site_name}</title>
<meta name="keywords" content="{$search_name}{$search_actor}{$search_director}{$search_wd}">
<meta name="description" content="{$search_name}{$search_actor}{$search_director}{$search_wd}">
<include file="Home:header" />
</head>
<body>
<include file="Home:heanvd" />
<div class="menu-box"></div>
<div class="main-box"> 

<ul class="styleTab mt15">
<i class="iLine"></i>
<script type="text/javascript">
$(document).ready(function(){
$("#id{$search_id|md5}").removeClass("btn-default").addClass('active');
});
</script>
<a href="{:ff_url('vod/search',array('id'=>0,'wd'=>$search_wd,'p'=>1),true)}" class="btn-default gallery-cell" id="idcfcd208495d565ef66e7dff9f98764da">
<em>全部</em>
<volist name=":ff_mysql_vod('cid:0;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
({:ff_page_count('search', 'records')})
</volist>
</a>
<volist name=":ff_mysql_vod('cid:1;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}" class="btn-default gallery-cell" id="id{:md5($feifei['list_id'])}">
<em>{$feifei.list_name}</em>({:ff_page_count('search', 'records')})</a></volist>

<volist name=":ff_mysql_vod('cid:2;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}" class="btn-default gallery-cell" id="id{:md5($feifei['list_id'])}">
<em>{$feifei.list_name}</em>({:ff_page_count('search', 'records')})</a></volist>

<volist name=":ff_mysql_vod('cid:3;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}" class="btn-default gallery-cell" id="id{:md5($feifei['list_id'])}">
<em>{$feifei.list_name}</em>({:ff_page_count('search', 'records')})</a></volist>

<volist name=":ff_mysql_vod('cid:4;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}" class="btn-default gallery-cell" id="id{:md5($feifei['list_id'])}">
<em>{$feifei.list_name}</em>({:ff_page_count('search', 'records')})</a></volist>

<volist name=":ff_mysql_vod('cid:5;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}" class="btn-default gallery-cell" id="id{:md5($feifei['list_id'])}">
<em>{$feifei.list_name}</em>({:ff_page_count('search', 'records')})</a></volist>
</ul>

<div class="itemList">
<volist name=":ff_mysql_vod('cid:'.$search_id.';wd:'.$search_wd.';limit:10;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<div class="item clearfix">
<div class="posterPlaceholder">
<div class="pic playlike">
<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank">
<img class="ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}" title="{$feifei.vod_name}">
<span class="playicon"></span>
<span class="playshow"><include file="Home:vod_continu" /></span>
</a>
</div>
</div>
<div class="txtIntroCon">
<div class="tit">
<h2>
<a target="_blank" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">
{:str_replace($search_wd,'<font color="red">'.$search_wd.'</font>',$feifei['vod_name'])}
</a>
</h2>
<span class="sTime">{$feifei.vod_year|default='2017'}</span>
<span class="sStyle">{$feifei.list_name}</span>
<span class="sScore">{$feifei.vod_gold}分</span>
</div>
<div class="wholeTxt">
<ul class="txtList minHeightTxt clearfix">
<eq name="feifei.vod_actor" value="1">
<gt name="feifei.vod_actor" value="0">
<else/>
</gt>
<else/>
<gt name="feifei.vod_actor" value="0">
<li>
<em class="emTit">主演：</em>
<notempty name="feifei.vod_type">
<volist name=":explode(',',$feifei['vod_actor'])" id="feifeitype">
<a href="{:ff_url('vod/search',array('wd'=>urlencode($feifeitype)),true)}" target="_blank">
{$feifeitype}
</a>
</volist>
</notempty>
</li>
<else/>
</gt>
</eq>
<eq name="feifei.vod_director" value="1">
<gt name="feifei.vod_director" value="0">
<else/>
</gt>
<else/>
<gt name="feifei.vod_director" value="0">
<li class="li_4">
<em class="emTit">导演：</em>
<notempty name="feifei.vod_director">
<volist name=":explode(',',$feifei['vod_director'])" id="feifeitype">
<a href="{:ff_url('vod/search',array('wd'=>urlencode($feifeitype)),true)}" target="_blank">
{$feifeitype}
</a>
</volist>
</notempty>
</li>
<else/>
</gt>
</eq>
<eq name="feifei.vod_type" value="1">
<gt name="feifei.vod_type" value="0">
<else/>
</gt>
<else/>
<gt name="feifei.vod_type" value="0">
<li class="li_4">
<em class="emTit">类型：</em>
<notempty name="feifei.vod_type">
<volist name=":explode(',',$feifei['vod_type'])" id="feifeitype">
<a href="{:ff_url('vod/type',array('id'=>$feifei['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'hits'),true)}">
{$feifeitype}
</a>
</volist>
</notempty>
</li>  
<else/>
</gt>
</eq>
<eq name="feifei.vod_area" value="1">
<gt name="vod_area" value="0">
<else/>
</gt>
<else/>
<gt name="feifei.vod_area" value="0">
<li class="li_4">
<em class="emTit">国家/地区：</em>
<notempty name="feifei.vod_area">
<volist name=":explode(',',$feifei['vod_area'])" id="feifeiarea">
<a href="{:ff_url('vod/type',array('id'=>$feifei['vod_cid'],'type'=>'','area'=>urlencode($feifeiarea),'year'=>'','star'=>'','state'=>'','order'=>'addtime'),true)}">
{$feifeiarea}
</a>
</volist>
</notempty>
</li>
<else/>
</gt>
</eq>
<li class="extend">
<em class="emTit">简介：</em>
<p class="pIntro">
<span>
{$feifei.vod_content|strip_tags|msubstr=0,260}
</span>
</p>
</li>
</ul>
<div class="playBtnCon clearfix">
<a href="{:ff_url_vod_play($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],1,1)}" target="_blank" class="v_blue_btn latestBtn">
<i class="iconfont"></i>立即播放</a>
	</div>
  </div>
 </div>
</div>
</volist>

</div>
</div>
<div class="list-pager-v2">{$page}</div>
</div>
<include file="Home:forum" />
</body>
</html>