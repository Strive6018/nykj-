<php>
$list_hits = ff_mysql_vod('cid:'.$list_id.';limit:36;page_is:true;page_id:list;page_p:'.$list_page.';cache_name:default;cache_time:default;order:vod_addtime desc,vod_id;sort:desc');
if($action == 'category'){
	$page = ff_url_page('vod/category',array('id'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
}else{
  $page = ff_url_page('vod/show',array('id'=>$list_id,'list_dir'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
}
$totalpages = ff_page_count('list', 'totalpages');
</php>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title>{$site_title}</title>
    <meta name="keywords" content="{$site_keywords}">
    <meta name="description" content="{$site_description}">
<include file="Home:header_meta" />
</head>
<body class="bg-default">
<include file="Home:header" />
<section class="mod aui-margin-t-0">
		<div class="mod-head">
		<div class="mod-head-title">
			<span class="mod-head-name">{$list_name}</span>
		</div>
		<span class="change">共有“{:ff_page_count('list', 'records')}”个视频</span>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list aui-clearfix" m-list-skin="small">
			<volist name="list_hits" id="feifei">
<include file="Home:vod_homex" />
		</volist> 
			</ul>
		</div>
	</div>
</section>
<div class="navigation">
	<ul class="clearfix">{$page}</ul>
</div>
 
<include file="Home:footer" />
</body>
</html>