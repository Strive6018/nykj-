<php>$item_vod = ff_mysql_vod('cid:'.$type_id.';limit:42;tag_name:'.$type_type.';tag_list:vod_type;area:'.$type_area.';year:'.implode(',',str_split($type_year,4)).';actor:'.$type_star.';state:'.$type_state.';page_is:true;page_id:type;page_p:'.$type_page.';cache_name:default;cache_time:default;order:vod_'.$type_order.';sort:desc');
$params = array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>'FFLINK');
$page = ff_url_page('vod/type', $params, true, 'type', 4);
$totalpages = ff_page_count('type', 'totalpages');
</php>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <title>{$type_year}{$type_area}{$type_type}{$type_star}{$type_state}{$list_name}大全-{$list_name}排行榜-{$site_name}</title>
  <meta name="keywords" content="{$list_keywords}">
  <meta name="description" content="{$list_description}">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
  <meta name="renderer" content="webkit|ie-comp|ie-stand" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<include file="Home:header" />
</head>
 <body>
<include file="Home:heanvd" />
<div class="menu-box"></div>
  <div class="yk-container"> 
   <div class="yk-row"> 
	<div class="yk-pannel-box"> 
	<div class="yk-pannel_hd clearfix"> 
 <div class="selectList clearfix">
 <li class="item-extend">
                    <span class="sTit">频道：</span>
                    <p class="pSelect">
                        <span>
<volist name=":ff_mysql_list('sid:1;limit:5;cahce_name:default;cahce_time:default;order:list_pid asc,list_oid;sort:asc')" id="feifei">
<a href="{:ff_url('vod/type',array('id'=>$feifei['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}"  id="id{:md5($feifei['list_id'])}">{$feifei.list_name}</a></volist>
                        </span>
                    </p>
                </li>
				
			<li>
           <span class="sTit">类型：</span>
                    <p class="pSelect">
		<span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>'','area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  id="type{:md5('')}">全部</a></span>
    <volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length='24'><span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($feifei),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  id="type{:md5($feifei)}">{$feifei}</a></span></volist>
						</p>
                </li>
			<li>
           <span class="sTit">地区：</span>
                    <p class="pSelect">
		<span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>'','year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  id="area{:md5('')}">全部</a></span>
    <volist name=":explode(',',$list_extend['area'])" id="feifei">
	<span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($feifei),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  id="area{:md5($feifei)}">{$feifei}</a></span></volist> 
						</p>
                </li>
			<li>
           <span class="sTit">年代：</span>
                    <p class="pSelect">
	<span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  id="year{:md5('')}">全部</a></span>
    <volist name=":explode(',',$list_extend['year'])" id="feifei" offset="0" length='15'><span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$feifei,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  id="year{:md5($feifei)}">{$feifei}</a></span></volist>
	<span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'18001989','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"  id="year{:md5('18002003')}">更早</a></span>
						</p>
                </li>
			<in name="list_id" value="1,2,4" ><li>
           <span class="sTit">明星：</span>
                    <p class="pSelect">
<span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>'','state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}" id="star{:md5('')}">全部</a></span>
    <volist name=":explode(',',$list_extend['star'])" id="feifei" offset="0" length='20'><span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($feifei),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}" id="star{:md5($feifei)}">{$feifei}</a></span></volist>
						</p>
                </li>
			<else/></in>
			<in name="list_id" value="1,2" ><li>
           <span class="sTit">状态：</span>
                    <p class="pSelect">
<span> <a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>'','order'=>$type_order,'p'=>1),true)}"  id="state{:md5('')}">全部</a></span>
    <volist name=":explode(',',$list_extend['state'])" id="feifei" offset="0" length='15'><span><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($feifei),'order'=>$type_order,'p'=>1),true)}" id="state{:md5($feifei)}">{$feifei}</a></span></volist>
						</p>
                </li>
				<else/></in>
         </div>
		</div>
	 </div>
		 <div class="yk-pannel-box"> 
      <div class="yk-pannel_hd clearfix"> 
       <div class="yk-pannel_head clearfix"> 
		<div class="v_th">
			<i class="iLine"></i>
			<p class="pTab">
		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>addtime,'p'=>1),true)}" id="orderaddtime">最近更新</a>

		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>hits,'p'=>1),true)}" id="orderhits">最近热播</a>

		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>gold,'p'=>1),true)}" id="ordergold">评分最高</a>
			</p>
			
				<div class="pSelected">
		<if condition="$type_type|$type_area|$type_year|$type_star|$type_state">
		<span class="sTit">您已选择：</span>
		<eq name="type_type" value="1">
		<gt name="type_type" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_type" value="0">
		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>'','area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>'addtime','p'=>1),true)}" target="_self" id="closeSelect_type" class="aSelected">
		<em>{$type_type}</em>
		<i class="iconfont iClose glyphicon glyphicon-remove"></i>
		</a>
		<else/>
		</gt>
		</eq>
		<eq name="type_area" value="1">
		<gt name="type_area" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_area" value="0">
		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>'','year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>'addtime','p'=>1),true)}" target="_self" id="closeSelect_type" class="aSelected">
		<em>{$type_area}</em>
		<i class="iconfont iClose glyphicon glyphicon-remove"></i>
		</a>
		<else/>
		</gt>
		</eq>
		<eq name="type_year" value="1">
		<gt name="type_year" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_year" value="0">
		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>'addtime','p'=>1),true)}" target="_self" id="closeSelect_type" class="aSelected">
		<em>{$type_year}</em>
		<i class="iconfont iClose glyphicon glyphicon-remove"></i>
		</a>
		<else/>
		</gt>
		</eq>
		<eq name="type_star" value="1">
		<gt name="type_star" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_star" value="0">
		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>'','state'=>urlencode($type_state),'order'=>'addtime','p'=>1),true)}" target="_self" id="closeSelect_type" class="aSelected">
		<em>{$type_star}</em>
		<i class="iconfont iClose glyphicon glyphicon-remove"></i>
		</a>
		<else/>
		</gt>
		</eq>
		<eq name="type_state" value="1">
		<gt name="type_state" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_state" value="0">
		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>'','order'=>'addtime','p'=>1),true)}" target="_self" id="closeSelect_type" class="aSelected">
		<em>{$type_state}</em>
		<i class="iconfont iClose glyphicon glyphicon-remove"></i>
		</a>
		<else/>
		</gt>
		</eq>

		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" target="_self" id="closeSelect_clear" class="aSelected">
		<i class="iconfont iChange glyphicon glyphicon-refresh"></i>
		<em>重新筛选</em>
		</a>
		</if>
		<span class="sNum">共有<em>{:ff_page_count('type', 'records')}</em>部{$list_name}</span>
			</div>
		</div>
   </div>
 </div>
      <div class="yk-pannel_bd clearfix"> 
       <ul class="index-list-1 active clearfix"> 
<volist name="item_vod" id="feifei">
<include file="Block:yk_img" />
</volist> 
</ul>
 </div>
 <div class="list-pager-v2">{$page}</div>
      </div>
      </div>
   </div>
 </div>
<script>
$("#id{$type_id|md5}").addClass("cur"); 
$("#area{$type_area|md5}").addClass("cur");
$("#type{$type_type|md5}").addClass("cur");
$("#year{$type_year|md5}").addClass("cur");
$("#star{$type_star|md5}").addClass("cur");
$("#order{$type_order}").addClass("cur");
$("#state{$type_state|md5}").addClass("cur");
</script>   
<include file="Home:forum" />
</body>
</html>