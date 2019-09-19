<php>$item_vod = ff_mysql_vod('cid:'.$type_id.';tag_name:'.$type_type.';tag_list:vod_type;area:'.$type_area.';year:'.implode(',',str_split($type_year,4)).';actor:'.$type_star.';state:'.$type_state.';ispay:'.$type_ispay.';page_p:'.$type_page.';page_is:true;page_id:type;limit:30;cache_name:default;cache_time:default;order:vod_'.$type_order.';sort:desc');
$params = array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'ispay'=>$type_ispay,'order'=>$type_order,'p'=>'FFLINK');
$page = ff_url_page('vod/type', $params, true, 'type', 5);
$totalpages = ff_page_count('type', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_type" />
</head>
<body class="vod-type">
<include file="BlockTheme:header" />
<div class="container">
<div class="row">
	<div class="col-xs-12">
  	<div class="nav-sub">
      <ul class="list-inline col-xs-5">
        <php>$item = ff_mysql_list('field:*;sid:1;limit:5;cache_name:default;cache_time:default;order:list_pid asc,list_oid;sort:asc');</php>
        <volist name="item" id="feifei" offset="0" length="5">
        <eq name="feifei.list_id" value="$list_id">
        <li class="active"><a href="{:ff_url('vod/type',array('id'=>$feifei['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei.list_name}</a><span class="ico-arr"></span></li>
        <else/>
        <li><a href="{:ff_url('vod/type',array('id'=>$feifei['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei.list_name}</a></li>
        </eq>
        </volist>
      </ul>
      <ul class="list-inline col-xs-7 text-right" data-id="nav-sub-{$type_type|md5}">
        <php>$item_end = end($item); $item_end_extend = json_decode($item_end['list_extend'],true);</php>
        <volist name=":explode(',',$item_end_extend['type'])" id="feifei" offset="0" length="12">
        <li id="nav-sub-{:md5($feifei)}"><a href="{:ff_url('vod/type',array('id'=>$item_end['list_id'],'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a></li>
        </volist>
      </ul>
    </div>
  </div>
  <div class="clearfix"></div>
  <div class="col-xs-12">
    <dl class="dl-horizontal">
      <dt data-id="year{$type_year|md5}">年份：</dt>
      <dd class="ff-text-hidden">
      <a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'','star'=>urlencode($type_star),'state'=>urlencode($type_state),'ispay'=>$type_ispay,'order'=>$type_order,'p'=>1),true)}" id="year{:md5('')}">全部</a>
      <volist name=":explode(',',$list_extend['year'])" id="feifei" offset="0" length='15'>
      <a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$feifei,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'ispay'=>$type_ispay,'order'=>$type_order,'p'=>1),true)}" id="year{:md5($feifei)}">{$feifei}</a>
      </volist>
      </dd>
      <div class="clearfix"></div>
    </dl>
  </div>
  <div class="clearfix"></div>
  <ul class="list-unstyled order">
    <li class="col-xs-4"><strong>
    <eq name="type_order" value="hits">
    	<a class="active" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>'','ispay'=>$type_ispay,'order'=>'hits','p'=>1),true)}">按人气</a>
    <else/>
    	<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>'','ispay'=>$type_ispay,'order'=>'hits','p'=>1),true)}">按人气</a>
    </eq>
    <eq name="type_order" value="addtime">
    	<a class="active" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>'','ispay'=>$type_ispay,'order'=>'addtime','p'=>1),true)}">按更新</a>
    <else/>
    	<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>'','ispay'=>$type_ispay,'order'=>'addtime','p'=>1),true)}">按更新</a>
    </eq>
    </strong>
    </li>
    <li class="col-xs-8 text-right">
      {$type_type} {$type_area} {$type_year} {$type_star} {$type_state} 共有<label class="ff-text">{:ff_page_count('type', 'records')}</label>个影片  第<span class="ff-text">{$type_page}</span>页
    </li>
  </ul>
  <div class="clearfix ff-clearfix"></div>
  <div class="col-xs-12">
    <ul class="list-unstyled vod-item-img ff-img-90">
      <volist name="item_vod" id="feifei">
        <li class="col-xs-2"><include file="BlockTheme:vod_item_img_sp" /></li>
      </volist>
    </ul>
  </div>
  <div class="clearfix"></div>
  <div class="col-xs-12 text-center">
    <ul class="pagination pagination-lg hidden-xs">
      {$page}
    </ul>
    <ul class="pager visible-xs">
    	<gt name="page.totalpages" value="1">
        <php>$params['p'] = $type_page-1</php>
        <li><a id="ff-prev" href="{:ff_url('vod/type', $params, true)}">上一页</a></li>
      </gt>
      <lt name="list_page" value="$totalpages">
      	<php>$params['p'] = $type_page+1</php>
        <li><a id="ff-next" href="{:ff_url('vod/type', $params, true)}">下一页</a></li>
      </lt>
     </ul>
  </div>
</div><!--row end -->
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>