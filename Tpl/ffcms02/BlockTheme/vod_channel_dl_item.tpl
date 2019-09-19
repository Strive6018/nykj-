<dl class="border rounded mt-3 pt-2 pl-2 pr-2 bg-white">
	<dt class="text-theme">按类型</dt>
	<dd>
		<volist name=":explode(',',$list_extend['type'])" id="feifei">
		<a class="mr-2 text-dark" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a>
		</volist>
	</dd>
	<notempty name="list_extend.year">
	<dt class="text-theme">按年份</dt>
	<dd class="word-break">
		<php>$year_end = end(explode(',',$list_extend['year']));</php>
		<volist name=":explode(',',$list_extend['year'])" id="feifei">
		<a class="mr-2 text-dark" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$feifei,'star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a>
		</volist>
		<a class="mr-2 text-dark" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'1990'.($year_end-1),'star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更早</a>
	</dd>
	</notempty>
	<notempty name="list_extend.area">
	<dt class="d-none d-sm-block text-theme">按地区</dt>
	<dd class="d-none d-sm-block">
		<volist name=":explode(',',$list_extend['area'])" id="feifei">
		<a class="mr-2 text-dark" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($feifei),'year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a>
		</volist>
	</dd>
	</notempty>
	<notempty name="list_extend.star">
	<dt class="d-none d-sm-block text-theme">按明星</dt>
	<dd class="d-none d-sm-block">
		<volist name=":explode(',',$list_extend['star'])" id="feifei" offset="0" length="15">
		<a class="mr-2 text-dark" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'','star'=>urlencode($feifei),'state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a>
		</volist>
	</dd>
	</notempty>
</dl>