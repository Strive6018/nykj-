<php>
$item_news = ff_mysql_news('cid:'.$list_id.';limit:10;tag_name:'.$type_type.';tag_list:news_type;page_is:true;page_id:list;page_p:'.$type_page.';cache_name:default;cache_time:default;order:news_addtime;sort:desc');
$page = ff_url_page('news/type',array('type'=>urlencode($type_type),'id'=>$list_id,'p'=>'FFLINK'), true, 'list', 4);
$totalpages = ff_page_count('list', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_type" />
</head>
<body class="news-type">
<include file="BlockTheme:header" />
<div class="container">
<ul class="nav nav-pills">
  <volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length="12">
  <eq name="feifei" value="$type_type">
  <li class="active"><a href="{:ff_url('news/type',array('type'=>urlencode($feifei),'id'=>$list_id,'p'=>1),true)}">{$feifei}</a></li>
  <else/>
  <li><a href="{:ff_url('news/type',array('type'=>urlencode($feifei),'id'=>$list_id,'p'=>1),true)}">{$feifei}</a></li>
  </eq>
  </volist>
</ul>
<div class="clearfix ff-clearfix"></div>
<div class="page-header">
  <h2>
  <a class="ff-text" href="{:ff_url_news_show($list_id,$list_dir,1)}">{$list_name}</a>
  <small>共有<span class="ff-text">{:ff_page_count('list', 'records')}</span>篇内容</small>
  </h2>
</div>
<!-- -->
<volist name="item_news" id="feifei">
	<include file="BlockTheme:news_item_medial" />
</volist>
<!-- -->
<gt name="totalpages" value="1">
<div class="clearfix"></div>
<div class="text-center">
  <ul class="pagination pagination-lg hidden-xs">
    {$page}
  </ul>
  <ul class="pager visible-xs">
    <gt name="type_pag" value="1">
      <li><a id="ff-prev" href="{:ff_url('news/type',array('type'=>$type_type,'id'=>$list_id,'p'=>$type_page-1))}">上一页</a></li>
    </gt>
    <lt name="type_pag" value="$totalpages">
      <li><a id="ff-next" href="{:ff_url('news/type',array('type'=>$type_type,'id'=>$list_id,'p'=>$type_page+1))}">下一页</a></li>
    </lt>
   </ul>
</div> 
</gt>
<!-- -->
<div class="page-header">
  <h2><span class="glyphicon glyphicon-signal ff-text"></span> 热门{$type_type}</h2>
</div>
<php>$item_news = ff_mysql_news('cid:'.$list_id.';tag_name:'.$type_type.';tag_type:news_type;limit:20;cache_name:default;cache_time:default;order:news_up;sort:desc');</php>
<ul class="news-item-ul ff-row">
  <volist name="item_news" id="feifei">
    <li class="col-xs-6 ff-col"><include file="BlockTheme:news_item_hot" /></li>
  </volist>
</ul>
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>