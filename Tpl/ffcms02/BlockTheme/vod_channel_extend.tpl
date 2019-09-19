<div class="row mt-3">
	<dl class="col-md mb-0">
		<dt>按类型</dt>
		<dd>
			<volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length="16">
			<a class="mr-2 text-secondary" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a>
			</volist>
		</dd>
	</dl>
	<notempty name="list_extend.year">
	<dl class="col-md mb-0">
	<dt>按年份</dt>
	<dd class="word-break">
		<php>$year_end = end(explode(',',$list_extend['year']));</php>
		<volist name=":explode(',',$list_extend['year'])" id="feifei">
		<a class="mr-2 text-secondary" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$feifei,'star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a>
		</volist>
		<a class="mr-2 text-secondary" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'1990'.($year_end-1),'star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更早</a>
	</dd>
	</dl>
	</notempty>
	<notempty name="list_extend.star">
	<dl class="col-md mb-0 d-none d-sm-block">
	<dt>按明星</dt>
	<dd>
		<volist name=":explode(',',$list_extend['star'])" id="feifei" offset="0" length="15">
		<a class="mr-2 text-secondary" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'','star'=>urlencode($feifei),'state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a>
		</volist>
	</dd>
	</dl>
	</notempty>
	<notempty name="list_extend.area">
	<dl class="col-md mb-0 d-none d-sm-block">
	<dt>按地区</dt>
	<dd>
		<volist name=":explode(',',$list_extend['area'])" id="feifei" offset="0" length="16">
		<a class="mr-2 text-secondary" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($feifei),'year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a>
		</volist>
	</dd>
	</dl>
	</notempty>
</div>