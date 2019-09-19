<volist name="item_list" id="feifeilist" offset="0" length="1">
	 <div class="yk-pannel clearfix"> 
     <div class="yk-pannel-box"> 
      <div class="yk-pannel_hd"> 
       <div class="yk-pannel_head clearfix"> 
	  
     <a class="text-muted pull-right right">今日更新:{:ff_list_count(999)}个影片</a>
        <h3 class="title">VIP独播影院  </h3> 
		<gt name="site_user_id" value="0"><span class="tips">看得越多，推荐的内容越符合你的口味哟~</span><else/>
        <span class="tips">猜的不准么？<a class="ff-user user-login-modal" href="{:ff_url('user/login')}" data-href="{:ff_url('user/center')}" data-toggle="tooltip" data-placement="bottom">登录</a> 后再看看吧~~</span> 
		</gt>
       </div> 
      </div> 
     
    <div class="yk-pannel_bd clearfix"> 
     <ul class="index-list-1 active clearfix">
      <volist name=":ff_mysql_vod('cid:1,2;limit:6;stars:5;order:vod_stars desc,vod_hits desc;')" id="feifei"> 
       <li class="yk-pack">
		<div class="p-thumb">
		<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank"></a>
		<img class="quic ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
		<div class="p-thumb-tagrt"><span class="red">VIP观看</span></div>
		<span class="figure_mask"></span>
		<span class="figure_thermometer _animate0">
		<i class="icon_thermometer"> 
		<i class="icon_thermometer_ball"></i> 
		<i class="icon_thermometer_progress" style="height: <gt name="feifei.vod_hits" value="100">100<else/>{$feifei.vod_hits}</gt>%;"> </i> </i> 
		<span class="thermometer_info"> 
		<span class="txt">播放指数</span> 
		<span class="txt"><gt name="feifei.vod_hits" value="100">100<else/>{$feifei.vod_hits}</gt>%</span> </span> 
		</div>
		<ul class="info-list">
		<li class="title"><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a></li>
		<span><in name="feifei.list_id" value="1,2" >主演：<include file="Home:vod_yyb" /><else/>{$feifei.vod_content|msubstr=0,15}</in></span>
		</ul>
		</li>
      </volist> 
     </ul>
    </div> 
   </div> 
  </div>

</volist>