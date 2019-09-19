<php>$item_special = ff_mysql_special('limit:30;tag_name:'.$special_type.';tag_list:special_type;page_is:true;page_id:special;page_p:'.$special_page.';cache_name:default;cache_time:default;order:special_stars;sort:desc');
$page = ff_url_page('special/show',array('type'=>urlencode($special_type),'p'=>'FFLINK'),true,'special',4);
$totalpages = ff_page_count('special', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:special_list" />
</head>
<body class="special-list">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
	<h2>
	<a class="ff-text" href="{:ff_url('home/special','',true)}">网站专题</a> 
	<small> 共有<span class="ff-text">{:ff_page_count('special', 'records')}</span>个专题</small></h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-130">
<volist name="item_special" id="feifei">
<li class="col-xs-3 text-center">
  <p class="image">
    <a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}">
      <img class="img-responsive img-thumbnail ff-img" data-original="{:ff_url_img($feifei['special_logo'])}" alt="{$feifei.special_name}">
    </a>
  </p>
  <h2 class="ff-text-hidden ff-text-right ff-text">
    <a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}" title="{$feifei.special_name|msubstr=0,10}">{$feifei.special_name}</a>
  </h2>
</li>
</volist>
</ul>
<gt name="totalpages" value="1">
	<div class="clearfix"></div>
	<div class="text-center">
  <ul class="pagination pagination-lg hidden-xs">
    {$page}
  </ul>
  <ul class="pager visible-xs">
    <gt name="special_page" value="1">
      <li><a id="ff-prev" href="{:ff_url('special/show',array('type'=>urlencode($special_type),'p'=>$special_page-1) )}">上一页</a></li>
    </gt>
    <lt name="special_page" value="$totalpages">
      <li><a id="ff-next" href="{:ff_url('special/show',array('type'=>urlencode($special_type),'p'=>$special_page+1) )}">下一页</a></li>
    </lt>
   </ul> 
   </div>
</gt>
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>