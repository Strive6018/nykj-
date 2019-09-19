<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockTheme:inc_header" />
<title>热门视频搜索_{$site_name}</title>
</head>
<body class="ajax-search">
<include file="BlockTheme:nav_m" />
<div class="container ff-nav">
<div class="row">
	<div class="col-xs-12 ff-col"> 
  	<form id="ff-search" role="form" action="{:ff_url('vod/search',array('name'=>'FFWD'), true)}" method="post">
      <div class="form-group">
        <input type="text" class="form-control" id="ff-wd" name="wd" placeholder="Search">
      </div>
    </form>
  </div>
</div>
</div>
<div class="hidden" id="ff-nav-btn-item">
<include file="Home:block_nav_m_sub" />
</div>
<div class="container ajax-search">
<div class="row">
	<div class="col-xs-12 ff-col">
  	<dl>
    	<dt>热门搜索：</dt>
      <dd><volist name=":ff_mysql_vod('limit:30;cache_name:default;cache_time:default;order:vod_stars desc,vod_hits_lasttime;sort:desc')" id="feifei">
      <a class="btn btn-default btn-sm" href="{:ff_url_vod_play($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],1,1)}">{$feifei.vod_name|msubstr=0,15,'utf-8',true}</a>
      </volist></dd>
    </dl>
  </div>
</div>
</div>
<include file="BlockTheme:inc_footer" />
</body>
</html>