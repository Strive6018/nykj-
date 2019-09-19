<volist name="item_list" id="feifeilist" offset="0" length="1">
<div class="yk-pannel clearfix"> 
   <div class="yk-pannel-box"> 
    <div class="yk-pannel_hd"> 
     <div class="yk-pannel_head clearfix"> 
      <a class="more text-muted pull-right rank" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'hits','p'=>1),true)}">{$feifeilist.list_name}排行</a> 
      <h3 class="title"><a href="{$feifeilist.list_link}">{$feifeilist.list_name}</a></h3> 
	  <div id="statetab1">
	  <ul class="t_tab">
		<li class="active"><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">最新</a></li>
		<li><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'动作','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">动作片</a></li>
		<li><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'科幻','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">科幻片</a></li>
		<li><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'警匪','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">警匪片</a></li>
		<li><a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'武侠','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">武侠片</a></li>
		</ul>
     </div> 
    </div> 
	</div> 
    <div class="yk-pannel_bd statetab1 clearfix"> 
     <ul class="index-list-1 tabcon clearfix active">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
     <ul class="index-list-1 tabcon clearfix">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;tag_name:科幻;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
     <ul class="index-list-1 tabcon clearfix">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;tag_name:战争,动作;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
     <ul class="index-list-1 tabcon clearfix">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;tag_name:动作,警匪;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
     <ul class="index-list-1 tabcon clearfix">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;tag_name:武侠,古装;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
       <include file="Block:yk_img" /> 
      </volist> 
     </ul>
    </div> 
   </div> 
  </div>
 </volist> 