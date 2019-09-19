<php>
$item_vod = ff_mysql_vod('cid:1,2,3,4;limit:30;tag_name:'.$tag_name.';tag_list:vod_tag;page_is:true;page_id:vodtags;page_p:'.$tag_page.';cache_name:default;cache_time:default;order:vod_addtime;sort:desc');
$page = ff_url_page('vod/tags',array('name'=>urlencode($tag_name),'p'=>'FFLINK'), true, 'vodtags', 4);
$totalpages = ff_page_count('vodtags', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_tags" />
</head>
<body class="vod-search vod-list">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
  <h2>话题（{$tag_type}{$tag_tag}{$tag_name}）<small>共有<span class="ff-text">{:ff_page_count('vodtags', 'records')}</span>个影片 第<span class="ff-text">{$tag_page}</span>页</small></h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-215">
  <volist name="item_vod" id="feifei">
  	<li class="col-xs-2"><include file="BlockTheme:vod_item_img" /></li>
  </volist>
</ul>
<div class="row">
<div class="col-xs-12 text-center">
  <ul class="pagination pagination-lg hidden-xs">
    {$page}
  </ul>
   <ul class="pager visible-xs">
      <gt name="search_page" value="1">
        <php>$params['p'] = $search_page-1</php>
        <li><a id="ff-prev" href="{:ff_url('vod/search', $params, true)}">上一页</a></li>
      </gt>
      <lt name="search_page" value="$totalpages">
        <php>$params['p'] = $search_page+1</php>
        <li><a id="ff-next" href="{:ff_url('vod/search', $params, true)}">下一页</a></li>
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