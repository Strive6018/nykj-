<php>
$item_vod = ff_mysql_vod('cid:'.$list_id.';limit:30;page_is:true;page_id:category;page_p:'.$list_page.';cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc');
$page = ff_url_page('vod/show',array('id'=>$list_id,'list_dir'=>$list_dir,'p'=>'FFLINK'),true,'category',4);
$totalpages = ff_page_count('category', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_list" />
</head>
<body class="vod-list">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
  <h2><a class="ff-text" href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a> <small>共有<span class="ff-text">{:ff_page_count('category', 'records')}</span>个影片 第<span class="ff-text">{$list_page}</span>页</small> 
  <a class="btn btn-xs btn-default pull-right" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','ispay'=>'','order'=>'hits','p'=>1),true)}"><span class="glyphicon glyphicon-th-list"></span> 筛选</a></h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-90">
  <volist name="item_vod" id="feifei">
    <li class="col-xs-2"><include file="BlockTheme:vod_item_img_sp" /></li>
  </volist>
</ul>
<div class="row">
  <div class="col-xs-12 text-center">
    <ul class="pagination pagination-lg hidden-xs">
      {$page}
    </ul>
    <ul class="pager visible-xs">
      <gt name="list_page" value="1">
        <li><a id="ff-prev" href="{:ff_url_vod_show($list_id,$list_dir,$list_page-1)}">上一页</a></li>
      </gt>
      <lt name="list_page" value="$totalpages">
        <li><a id="ff-next" href="{:ff_url_vod_show($list_id,$list_dir,$list_page+1)}">下一页</a></li>
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