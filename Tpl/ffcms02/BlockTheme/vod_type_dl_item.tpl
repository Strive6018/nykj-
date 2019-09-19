<div class="bg-eee" >
<div class="container mt-3">	
<dl class="mb-0">
	<dt class="text-dark">按频道</dt>
	<dd class="ff-gallery">
		<volist name=":ff_mysql_list('sid:1;limit:12;cahce_name:default;cahce_time:default;order:list_pid asc,list_oid;sort:asc')" id="feifei"><a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="id{:md5($feifei['list_id'])}" href="{:ff_url('vod/type',array('id'=>$feifei['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei.list_name}</a></volist>
	</dd>
	<dt class="text-dark">按类型</dt>
	<dd class="ff-gallery">
		<a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="type{:md5('')}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>'','area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">全部</a><volist name=":explode(',',$list_extend['type'])" id="feifei"><a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="type{:md5($feifei)}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($feifei),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></volist>
	</dd>
	<notempty name="list_extend.year">
	<dt class="text-dark">按年份</dt>
	<dd class="ff-gallery">
		<a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="year{:md5('')}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">全部</a><volist name=":explode(',',$list_extend['year'])" id="feifei" offset="0" length='8'><a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="year{:md5($feifei)}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$feifei,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></volist><a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="year{:md5('20002010')}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'20002010','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">2010-2000</a><a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="year{:md5('19901999')}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'19901999','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">90年代</a><a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="year{:md5('18001989')}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'18001989','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">更早</a>
		</dd>
	</dd>
	</notempty>
	<notempty name="list_extend.area">
	<dt class="text-dark">按地区</dt>
	<dd class="ff-gallery">
		<a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="area{:md5('')}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>'','year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">全部</a><volist name=":explode(',',$list_extend['area'])" id="feifei"><a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="area{:md5($feifei)}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($feifei),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></volist>
	</dd>
	</notempty>
	<notempty name="list_extend.star">
	<dt class="text-dark">按明星</dt>
	<dd class="ff-gallery">
		<a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="star{:md5('')}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>'','order'=>$type_order,'p'=>1),true)}">全部</a><volist name=":explode(',',$list_extend['star'])" id="feifei"><a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="star{:md5($feifei)}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($feifei),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></volist>
	</dd>
	</notempty>
	<notempty name="list_extend.state">
    <dt class="text-dark">按资源</dt>
    <dd class="ff-gallery">
    <a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="state{:md5('')}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>'','order'=>$type_order,'p'=>1),true)}">全部</a><volist name=":explode(',',$list_extend['state'])" id="feifei"><a class="gallery-cell mr-2 mr-md-3 text-nowrap text-dark" id="state{:md5($feifei)}" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($feifei),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></volist>
		</dd>
    </notempty>
</dl>
</div>
</div>
<!-- -->
<div class="container mt-3">	
<div class="btn-group mb-0">
	<a class="btn btn-outline-secondary" id="orderhits" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>hits,'p'=>1),true)}">最近热播</a>
	<a class="btn btn-outline-secondary" id="orderaddtime" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>addtime,'p'=>1),true)}">最新上映</a>
	<a class="btn btn-outline-secondary" id="ordergold" href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>gold,'p'=>1),true)}">评分最高</a>
</div>
</div>
<script>
$("#id{$type_id|md5}").removeClass("text-dark").addClass("text-primary gallery-active");
$("#type{$type_type|md5}").removeClass("text-dark").addClass("text-primary gallery-active");
$("#area{$type_area|md5}").removeClass("text-dark").addClass("text-primary gallery-active");
$("#year{$type_year|md5}").removeClass("text-dark").addClass("text-primary gallery-active");
$("#star{$type_star|md5}").removeClass("text-dark").addClass("text-primary gallery-active");
$("#state{$type_state|md5}").removeClass("text-dark").addClass("text-primary gallery-active");
$("#order{$type_order}").addClass("active");
</script>