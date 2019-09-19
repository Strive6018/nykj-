<volist name="item_list" id="feifeilist" offset="1" length="1">
<div class="yk-pannel clearfix"> 
   <div class="yk-pannel-box"> 
    <div class="yk-pannel_hd"> 
     <div class="yk-pannel_head clearfix"> 
      <a class="more text-muted pull-right rank" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'hits','p'=>1),true)}">{$feifeilist.list_name}排行</a> 
      <h3 class="title"><a href="{$feifeilist.list_link}">{$feifeilist.list_name}</a></h3> 
	  <div id="statetab">
	  <ul class="t_tab">
		<li class="active"><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">最新</a></li>
		<li><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'内地','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">大陆剧</a></li>
		<li><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'韩国','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">日韩剧</a></li>
		<li><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'美国','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">英美剧</a></li>
		<li><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'香港','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">港台剧</a></li>
		</ul>
     </div> 
    </div> 
	</div>
    <div class="yk-pannel_bd statetab clearfix"> 
     <ul class="index-list-1 tabcon clearfix active">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
     <ul class="index-list-1 tabcon clearfix">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;area:内地;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
     <ul class="index-list-1 tabcon clearfix">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;area:日本,韩国;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
     <ul class="index-list-1 tabcon clearfix">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;area:美国,英国;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
     <ul class="index-list-1 tabcon clearfix">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;area:香港,台湾;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
    </div> 
   </div> 
  </div>
</volist>