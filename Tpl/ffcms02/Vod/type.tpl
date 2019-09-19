<php>$item_vod = ff_mysql_vod('cid:'.$type_id.';limit:40;tag_name:'.$type_type.';tag_list:vod_type;area:'.$type_area.';year:'.implode(',',str_split($type_year,4)).';actor:'.$type_star.';state:'.$type_state.';page_is:true;page_id:type;page_p:'.$type_page.';cache_name:default;cache_time:default;order:vod_'.$type_order.';sort:desc');
$params = array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>'FFLINK');
$page = ff_url_page('vod/type', $params, true, 'type', 4);
$totalpages = ff_page_count('type', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_type" />
</head>
<body class="bg-light vod-type">
<include file="BlockTheme:header" />
<include file="BlockTheme:vod_type_dl_item" />
<main class="container">
<div class="row">
<volist name="item_vod" id="feifei">
	<include file="BlockTheme:vod_card_item" />
</volist>
</div>
<ul class="mt-3 pagination d-flex flex-wrap justify-content-center">
{$page}
</ul>
</main>
<include file="BlockTheme:footer" />
</body>
</html>