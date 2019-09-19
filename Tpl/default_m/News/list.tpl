<php>$item_news = ff_mysql_news('cid:'.$list_id.';limit:15;page_is:true;page_id:list;page_p:'.$list_page.';cache_name:default;cache_time:default;order:news_addtime;sort:desc');
$page = ff_url_page('news/'.$action,array('id'=>$list_id,'list_dir'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
$totalpages = ff_page_count('list', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_list" />
</head>
<body class="news-list">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<ul class="nav nav-pills news-nav-pills">
  <volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length="12">
  <li><a href="{:ff_url('news/type',array('type'=>urlencode($feifei),'id'=>$list_id,'p'=>1),true)}">{$feifei}</a></li>
  </volist>
</ul>
<div class="clearfix ff-clearfix"></div>
<div class="page-header">
  <h2>
  <span class="glyphicon glyphicon-list-alt ff-text"></span>
  <a href="{:ff_url_news_show($list_id,$list_dir,1)}">{$list_name}</a>
  <small>共有<span class="ff-text">{:ff_page_count('list', 'records')}</span>篇内容</small>
  </h2>
</div>
<!-- -->
<volist name="item_news" id="feifei">
	<include file="BlockTheme:news_item_medial" />
</volist>
</div>
<!-- -->
<gt name="totalpages" value="1">
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg text-center">
  <ul class="pager">
    <gt name="list_page" value="1">
      <li><a id="ff-prev" href="{:ff_url_news_show($list_id,$list_dir,$list_page-1)}">上一页</a></li>
    </gt>
    <lt name="list_page" value="$totalpages">
      <li><a id="ff-next" href="{:ff_url_news_show($list_id,$list_dir,$list_page+1)}">下一页</a></li>
    </lt>
   </ul>
</div>
</gt>
<!-- -->
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
<div class="page-header">
  <h2><span class="glyphicon glyphicon-signal ff-text"></span> 热门{$list_name}</h2>
</div>
<php>$item_news = ff_mysql_news('cid:'.$list_id.';limit:20;cache_name:default;cache_time:default;order:news_hits;sort:desc');</php>
<ul class="news-item-ul ff-row">
  <volist name="item_news" id="feifei">
    <include file="BlockTheme:news_item_hot" />
  </volist>
</ul>
</div>
<!--container end -->
<include file="BlockTheme:footer" />
</body>
</html>