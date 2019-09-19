<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_detail" />
</head>
<body class="news-detail">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<div class="page-header">
  <h3 class="text-center">{$news_name}</h3>
  <h6 class="text-muted text-center">
    来源：{$news_inputer|default='佚名'}
    人气：{$news_hits}
    更新：{$news_addtime|date='Y/m/d',###}
  </h6>         
</div>
<!-- -->
<div class="row ff-row">
<div class="col-xs-12 ff-col">
  <div class="news-content">
    {:ff_url_tags_content(nb(strip_tags($news_content,"<a>,<p>,<img>,<center>,<b>,<strong>")),$Tag)}
  </div> 
  <p class="tags text-right">  
    <volist name="Tag" id="feifei">
    <eq name="feifei.tag_list" value="news_type">
      <a class="btn btn-default btn-xs" href="{:ff_url('news/type',array('type'=>urlencode($feifei['tag_name']),'id'=>$list_id),true)}">
      <span class="glyphicon glyphicon-tag"></span> {$feifei.tag_name|msubstr=0,4}
      </a>
    <else/>
      <a class="btn btn-default btn-xs" href="{:ff_url_tags($feifei['tag_name'],$feifei['tag_list'])}">
      <span class="glyphicon glyphicon-tag"></span> {$feifei.tag_name|msubstr=0,4}
      </a>
    </eq>
    </volist>
  </p>   
  <!-- -->
  <php>$detail_prev = ff_detail_array('news', 'prev', $news_id, $news_cid);
  $detail_next = ff_detail_array('news', 'next', $news_id, $news_cid);</php>           
  <ul class="more">
  <empty name="detail_prev">
    <li>上一篇：没有了</li>
  <else/>
    <li>上一篇：<a id="ff-prev" href="{:ff_url_news_read($list_id,$list_dir,$detail_prev['news_id'],$detail_prev['news_ename'],$detail_prev['news_jumpurl'],1)}">{$detail_prev.news_name}</a></li>
  </empty>
  <empty name="detail_next">
    <li>下一篇：没有了</li>
  <else/>
    <li>下一篇：<a id="ff-next" href="{:ff_url_news_read($list_id,$list_dir,$detail_next['news_id'],$detail_next['news_ename'],$detail_next['news_jumpurl'],1)}">{$detail_next.news_name}</a></li>
  </empty>
  </ul> 
  <p class="tags text-center">
    <a class="btn btn-default btn-lg ff-updown-set" href="javascript:;" data-id="{$news_id}" data-module="news" data-type="up" data-toggle="tooltip" data-placement="top" title="支持">
      <span class="glyphicon glyphicon-thumbs-up"></span> 有用 (<span class="ff-updown-val">{$news_up}</span>)
    </a>
  	<gt name="news_page_count" value="1">
    <gt name="news_page" value="1">
      <a class="btn btn-default btn-lg" href="{:ff_url_news_read($list_id,$list_dir,$news_id,$news_ename,$news_jumpurl,$news_page-1)}">
      <span class="glyphicon glyphicon-chevron-left"></span> 上一页</a>
    </gt>
    <lt name="news_page" value="$news_page_count">
      <a class="btn btn-default btn-lg" href="{:ff_url_news_read($list_id,$list_dir,$news_id,$news_ename,$news_jumpurl,$news_page+1)}">
      <span class="glyphicon glyphicon-chevron-right"></span> 下一页</a>
    </lt>
    </gt>    
  </p>
</div>
</div><!--row end -->
</div><!--container end -->
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
<!-- -->
<include file="BlockBase:forum_ajax_news" />
{$news_hits_insert}
</div>
<!--container end -->
<include file="BlockTheme:footer" />
</body>
</html>