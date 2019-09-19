<php>if($special_tag_name){
	$item_vod = ff_mysql_vod('limit:60;tag_name:'.$special_tag_name.';tag_list:vod_tag;cache_name:default;cache_time:default;order:vod_hits desc');
}else{
	$item_vod = ff_mysql_vod('limit:60;ids:'.$special_ids_vod.';cache_name:default;cache_time:default;order:vod_hits desc');
}
</php>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <php>$list_dir = 'special';</php>
<title>{$special_title|default=$special_name.'－影视专题'}－{$site_name}</title>
    <meta name="keywords" content="{$special_keywords|default='专题'.$special_name}">
    <meta name="description" content="{$special_description|default=msubstr(h($special_content),0,100)}">
<include file="Home:header_meta" />
</head>
<body class="bg-default">
<include file="Home:header" />
<section class="mod aui-margin-t-0">
	<div class="banners aui-clearfix">
			<div class="swiper-slidee">
				<a href="{:ff_url('special/read', array('id'=>$special_id), true)}" title="{$special_name}">
					<img class="ff-img" data-original="{:ff_url_img($special_logo,$special_content)}">
					<div class="stitle"><p>{$special_name}</p></div>

				</a>
			</div>
		</div>
</div>
</section>
<section class="mod aui-margin-t-5">
<div class="theme_txt">
        {$special_content}
        <span class="down"></span>
    </div>
</section>
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">相关影片</span>
		</div>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list clearfix" m-list-skin="film">
<volist name="item_vod" id="feifei">
<include file="Home:vod_home" />
	</volist> 
			</ul>

		</div>

	</div>
</section>
</div>
{$special_hits_insert}
<include file="Home:footer" />
</body>
</html>