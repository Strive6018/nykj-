    <div class="yk-pannel clearfix"> 
     <div class="yk-pannel-box"> 
      <div class="yk-pannel_hd"> 
       <div class="yk-pannel_head clearfix"> 
	  <volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="7" length="1">
        <a class="more text-muted pull-right" href="{$feifei.nav_link}">更多</a> 
        <h3 class="title"><a href="{$feifei.nav_link}">影视专题</a></h3> 
		</volist> 
       </div> 
      </div> 
      <div class="yk-pannel_bd clearfix"> 
       <div class="yk-vodlist clearfix"> 
	   <div class="yk-special">
        <volist name=":ff_mysql_special('limit:5;order:special_addtime desc')" id="feifei">  
      <a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}" target="_blank" class="cover_item">
      <img class="cover_pic quic ff-img" data-original="{$feifei.special_logo|ff_url_img}" alt="{$feifei.special_name}">
        <div class="cover_title">{$feifei.special_name}</div>
		</a>
        </volist> 
		</div > 
       </div > 
      </div> 
     </div> 
    </div>