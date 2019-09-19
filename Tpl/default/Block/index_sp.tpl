<volist name="item_list" id="feifeilist" offset="4" length="1">
    <div class="yk-pannel clearfix"> 
     <div class="yk-pannel-box"> 
      <div class="yk-pannel_hd"> 
       <div class="yk-pannel_head clearfix"> 
        <a class="more text-muted pull-right" href="{$feifeilist.list_link}">更多</a> 
        <h3 class="title"><a href="{$feifeilist.list_link}">花絮·剧透</a></h3> 
       </div> 
      </div> 
      <div class="yk-pannel_bd clearfix"> 
	  	  <div id="myCarousel" class="carousel slide1">
	  <div class="carousel-inner">
       <div class="yk-vodlist clearfix item active"> 
        <volist name=":ff_mysql_vod('cid:5;limit:24;order:vod_stars desc,vod_id;sort:desc;')" id="feifei" key="k" offset="0" length="18">
<include file="Block:yk_img_2" />
        </volist> 
       </div > 
       </div > 
      </div> 
     </div> 
    </div>
 </div>
</volist> 