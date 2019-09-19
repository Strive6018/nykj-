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
<div class="container ff-bg">
<div class="page-header">
  <h2>
  	<span class="glyphicon glyphicon-calendar ff-text"></span>
    <span class="ff-text">影视专题</span>
    <small>共有<span class="ff-text">{:ff_page_count('special', 'records')}</span>个专题</small>
  </h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-90">
<volist name="item_special" id="feifei">
  <include file="BlockTheme:special_item_img" />
</volist>
</ul>
<gt name="totalpages" value="1">
	<div class="clearfix"></div>
  <div class="text-center">
    <ul class="pager">
      <gt name="special_page" value="1">
        <li><a id="ff-prev" href="{:ff_url('special/show',array('type'=>urlencode($special_type),'p'=>$special_page-1) )}">上一页</a></li>
      </gt>
      <lt name="special_page" value="$totalpages">
        <li><a id="ff-next" href="{:ff_url('special/show',array('type'=>urlencode($special_type),'p'=>$special_page+1) )}">下一页</a></li>
      </lt>
     </ul> 
	</div>
</gt>
</div>
<!--container end -->
<include file="BlockTheme:footer" />
</body>
</html>