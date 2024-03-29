<php>
$item_score = ff_mysql_score('uid:'.$user_id.';limit:30;page_is:true;page_id:score;page_p:'.$user_page.';cache_name:default;cache_time:default;order:score_id;sort:desc');
$page = ff_url_page('user/center',array('action'=>'buy','p'=>'FFLINK'),true,'score',4);
$totalpages = ff_page_count('score', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>消费记录_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户中心">
<meta name="description" content="欢迎回到{$site_name}用户中心">
</head>
<body>
<body class="user-center">
<include file="User:center_nav" />
<div class="container">
  <div class="page-header">
    <h2><span class="glyphicon glyphicon-menu-right ff-text"></span> 我的影币记录</h2>
  </div>
  <table class="table table-bordered table-responsive text-center">
  <thead>
    <tr>
      <th class="text-center">频道</th>
      <th class="text-center">类型</th>
      <th class="text-center">变化值</th>
    </tr>
  </thead>
  <tbody>
   <volist name="item_score" id="feifei">
    <tr>
      <td><switch name="feifei.score_sid"><case value="1">视频</case><case value="2">文章</case><case value="3">专题</case><default/>用户</switch></td>
      <td><switch name="feifei.score_type"><case value="1">影币充值</case><case value="2">注册赠送</case><case value="3">管理员操作</case><case value="4">推广奖励</case><case value="5">退货返还</case><case value="21">升级VIP</case><case value="22"><a href="{:ff_url('vod/read',array('id'=>$feifei['score_did']),true)}" target="_blank">付费点播</case><default/>未知</switch></td>
      <td class="ff-text">{$feifei.score_ext}</td>
    </tr>
    </volist>
  </tbody>
  </table>
  <gt name="totalpages" value="1">
    <div class="clearfix"></div>
    <div class="text-center">
    <ul class="pager">
      <gt name="user_page" value="1">
        <li><a id="ff-prev" href="{:ff_url('user/center', array('action'=>'buy','p'=>($user_page-1)), true)}">上一页</a></li>
      </gt>
      <lt name="user_page" value="$totalpages">
        <li><a id="ff-next" href="{:ff_url('user/center', array('action'=>'buy','p'=>($user_page+1)), true)}">下一页</a></li>
      </lt>
     </ul> 
     </div>
  </gt>
</div>
<include file="User:footer" />
</body>
</html>