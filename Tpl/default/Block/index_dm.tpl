<volist name="item_list" id="feifeilist" offset="2" length="1">
<div class="yk-pannel clearfix"> 
   <div class="yk-pannel-box"> 
    <div class="yk-pannel_hd"> 
     <div class="yk-pannel_head clearfix">
      <h3 class="title">{$feifeilist.list_name}</h3> 
	  <div class="title_action">
	 <ul class="mod_link_list">
	<volist name="item_list" id="feifeilist" offset="2" length="1">
	<volist name=":explode(',',$feifeilist['list_extend']['type'])" id="feifeitype" key="k" offset="0" length="6">
	<li class="item"><a class="link" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" target="_blank"><span class="txt">{$feifeitype}动漫</span></a></li>
	</volist>
		</volist>
      <li class="item item_ad"></li>
      <li class="item"><a href="{$feifeilist.list_link}" target="_blank" class="link"><i class="icon_text">更多{$feifeilist.list_name}</i></a></li>
    </ul>
	  </div>
     </div> 
    </div> 
    <div class="yk-pannel_bd clearfix"> 
     <ul class="index-list-2 active clearfix" id="MainTab-1">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:14;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei" key="k" offset="0" length="1">
       <include file="Block:yk_img_1" /> 
      </volist> 
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:14;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei" key="k" offset="1" length="8">
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
    </div> 
   </div> 
  </div>
</volist>