<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_detail_special" />
</head>
<body class="bg-light forum-detail-special ff-forum-reload">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item"><a href="{:ff_url('forum/index', array('sid'=>3), true)}">专题评论</a></li>
  <li class="breadcrumb-item active">详情</li>
</ul>
<div class="card mt-3">
  <div class="card-body">
		<div class="card-text forum-content">
			{$forum_content|htmlspecialchars}
			@<a href="{:ff_url('forum/special',array('cid'=>$forum_cid),true)}">主题</a>
		</div>
		<div class="mt-4 text-center">
			<a class="btn btn-outline-primary ff-updown-set" href="javascript:;" data-id="{$forum_id}" data-module="forum" data-type="up" data-toggle="tooltip" data-placement="top" title="有用">
				<i class="fa fa-thumbs-o-up mr-1"></i>赞（<span class="ff-updown-val">{$forum_up}</span>）
			</a>
			<a class="btn btn-outline-primary ff-updown-set" href="javascript:;" data-id="{$forum_id}" data-module="forum" data-type="down" data-toggle="tooltip" data-placement="top" title="反对">
				<i class="fa fa-thumbs-o-down mr-1"></i>踩（<span class="ff-updown-val">{$forum_down}</span>）
			</a>
		</div>
	</div> 
  <div class="card-footer text-right">
		<small>
		<a class="ff-text" href="{:ff_url('user/index',array('id'=>$user_id),true)}" target="_blank">{$user_name|htmlspecialchars}</a>
  	{$forum_addtime|date='Y-m-d H:i:s',###}
		</small>
	</div>
</div>
<include file="BlockBase:forum_ajax_forum" />
</main>
<include file="BlockTheme:footer" />
</body>
</html>