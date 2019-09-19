<php>$item_special = ff_mysql_special('limit:35;tag_name:'.$special_type.';tag_list:special_type;page_is:true;page_id:special;page_p:'.$special_page.';cache_name:default;cache_time:default;order:special_addtime desc');
$page = ff_url_page('special/show',array('type'=>urlencode($special_type),'p'=>'FFLINK'),true,'special',4);
$totalpages = ff_page_count('special', 'totalpages');
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
<title>影视专题第{$special_page}页_{$site_name}</title>
    <meta name="keywords" content="{$list_keywords}">
    <meta name="description" content="{$list_description}">
<include file="Home:header_meta" />
</head>
<body class="bg-default">
<include file="Home:header" />
<section class="mod">

            <div class="swiper-container focus_banner">
                <div class="swiper-wrapper focus_banner_list">
                      <div class="swiper-slide focus_banner_item">
					  <span class="special"></span>
			</div>
            </div>

</section>
<section class="select">
        <ul class="show_select hidden">
		<volist name=":ff_mysql_nav('field:*;limit:10;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="1" length="4">
          <li><a href="#" title="{$feifei.nav_title}专题">{$feifei.nav_title}专题</a></li>
		  </volist>
        </ul>
    </section>
	
<section class="mod aui-margin-t-0">
<volist name="item_special" id="feifei">
	<div class="banners aui-margin-t-0 aui-clearfix">
			<div class="swiper-slidee">
				<a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}" title="{$feifei.special_name}">
					<img class="ff-img" data-original="{$feifei.special_logo|ff_url_img}">
					<div class="stitle"><p>{$feifei.special_name}</p></div>
				</a>
			</div>
		</div>
	</volist> 
	</div>
</section>


<div class="navigation">
	<ul class="clearfix">{$page}</ul>
</div>
</div>
</div>
<include file="Home:footer" />
</body>
</html>