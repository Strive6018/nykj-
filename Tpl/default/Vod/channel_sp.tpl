<php>
$list_hits = ff_mysql_vod('cid:'.$list_id.';limit:36;page_is:true;page_id:list;page_p:'.$list_page.';cache_name:default;cache_time:default;order:vod_addtime desc,vod_id;sort:desc');
if($action == 'category'){
	$page = ff_url_page('vod/category',array('id'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
}else{
  $page = ff_url_page('vod/show',array('id'=>$list_id,'list_dir'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
}
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
</head>
 <body>
<include file="Home:heanvd" />
<div class="menu-box"></div>
  <div class="yk-container"> 
   <div class="yk-row"> 
	<div class="yk-pannel-box"> 
	<div class="yk-pannel_hd clearfix"> 
 <div class="selectList clearfix">
 <li class="item-first item-extend">
           <span class="sTit">类型：</span>
                    <p class="pSelect">
		<span><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  class="cur">全部</a></span>
    <volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length='24'><span><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></span></volist>
						</p>
                </li>
			<li>
           <span class="sTit">年代：</span>
                    <p class="pSelect">
	<span><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  class="cur">全部</a></span>
    <volist name=":explode(',',$list_extend['year'])" id="feifei" offset="0" length='15'><span><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$feifei,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></span></volist>
	<span><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'18001989','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  id="year{:md5('18002003')}">更早</a></span>
						</p>
                </li>

         </div>
		</div>
	 </div>
		 <div class="yk-pannel-box"> 
      <div class="yk-pannel_hd clearfix"> 
       <div class="yk-pannel_head clearfix"> 
<div class="v_th">
    <i class="iLine"></i>
    <p class="pTab">
<a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>addtime,'p'=>1),true)}" class="cur">最近更新</a>
<a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>hits,'p'=>1),true)}">最近热播</a>
<a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>gold,'p'=>1),true)}">评分最高</a>
	</p>
	
	
	    <div class="pSelected"><span class="sNum">共有<em>{:ff_page_count('list', 'records')}</em>个{$list_name}</span>
			</div>
		</div>
   </div>
 </div>
      <div class="yk-pannel_bd clearfix"> 
       <div class="yk-vodlist clearfix"> 
<volist name="list_hits" id="feifei">
<include file="Block:yk_img_2" />
</volist> 
</ul>
 </div>
 <div class="list-pager-v2">{$page}</div>
      </div>
      </div>
   </div>
 </div>

<include file="Home:forum" />
</body>
</html>