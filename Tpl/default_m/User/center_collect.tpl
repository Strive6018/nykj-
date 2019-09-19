<php>
$item_vod = ff_mysql_record('sid:1;uid:'.$user_id.';type:5;group:record_did;limit:30;page_is:true;page_id:record;page_p:'.$user_page.';cache_name:default;cache_time:default;order:record_id;sort:desc');
$page = ff_url_page('user/center',array('action'=>'collect','p'=>'FFLINK'),true,'record',4);
$totalpages = ff_page_count('record', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>我看过的影片_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户中心">
<meta name="description" content="欢迎回到{$site_name}用户中心">
</head>
<body class="user-center">
<include file="User:center_nav" />
<div class="container">
  <div class="page-header">
    <h2><span class="glyphicon glyphicon-menu-right ff-text"></span> 我看过的影片</h2>
  </div>
  <include file="User:inc_item_record" />
  <gt name="totalpages" value="1">
    <div class="clearfix"></div>
    <div class="text-center">
      <ul class="pager">
        <gt name="user_page" value="1">
          <li><a id="ff-prev" href="{:ff_url('user/center', array('action'=>'collect','p'=>($user_page-1)), true)}">上一页</a></li>
        </gt>
        <lt name="user_page" value="$totalpages">
          <li><a id="ff-next" href="{:ff_url('user/center', array('action'=>'collect','p'=>($user_page+1)), true)}">下一页</a></li>
        </lt>
       </ul> 
    </div>
  </gt>
</div>
<include file="User:footer" />
</body>
</html>