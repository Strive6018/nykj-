<php>$item_news = ff_mysql_news('limit:15;tag_name:'.$tag_name.';tag_list:news_tag;page_is:true;page_id:newstag;page_p:'.$tag_page.';cache_name:default;cache_time:default;order:news_addtime;sort:desc');
$page = ff_url_page('news/tags',array('name'=>urlencode($tag_name),'p'=>'FFLINK'), true, 'newstag', 4);
$totalpages = ff_page_count('newstag', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_tags" />
</head>
<body class="news-tags">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<div class="page-header">
  <h2>
    <span class="glyphicon glyphicon-list-alt ff-text"></span> 话题：{$tag_type}{$tag_tag}{$tag_name}
    <small>共有<span class="ff-text">{:ff_page_count('newstag', 'records')}</span>篇内容</small>
  </h2>
</div>
<!-- -->
<volist name="item_news" id="feifei">
	<include file="BlockTheme:news_item_medial" />
</volist>
<!-- -->
<div class="page-header">
  <h2><span class="glyphicon glyphicon-th-list ff-text"></span> 热门话题</h2>
</div>
<ul class="nav nav-pills news-nav-pills">
  <volist name=":ff_mysql_tags('limit:21;cid:4;group:tag_name,tag_list;cache_name:default;cache_time:default;order:tag_count;sort:desc')" id="feifei" mod="7">
  <eq name="feifei.tag_name" value="$tag_name">
  <li class="active"><a href="{:ff_url('news/tags',array('name'=>urlencode($feifei['tag_name'])),true)}">{$feifei.tag_name|msubstr=0,4}({$feifei.tag_count})</a></li>
  <else/>
  <li><a href="{:ff_url('news/tags',array('name'=>urlencode($feifei['tag_name'])),true)}">{$feifei.tag_name|msubstr=0,4}({$feifei.tag_count})</a></li>
  </eq>
  </volist>
</ul>
</div>
<!-- -->
<gt name="totalpages" value="1">
  <div class="clearfix ff-clearfix"></div>
  <div class="container ff-bg text-center">
    <ul class="pager">
      <gt name="tag_page" value="1">
        <li><a id="ff-prev" href="{:ff_url('news/tags', array('name'=>urlencode($tag_name),'p'=>$tag_page-1), true)}">上一页</a></li>
      </gt>
      <lt name="tag_page" value="$totalpages">
        <li><a id="ff-next" href="{:ff_url('news/tags', array('name'=>urlencode($tag_name),'p'=>$tag_page+1), true)}">下一页</a></li>
      </lt>
     </ul>
  </div>
</gt>
<!-- -->
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
<div class="page-header">
  <h2><span class="glyphicon glyphicon-signal ff-text"></span> 最近更新</h2>
</div>
<php>$item_news = ff_mysql_news('limit:20;cache_name:default;cache_time:default;order:news_addtime;sort:desc');</php>
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