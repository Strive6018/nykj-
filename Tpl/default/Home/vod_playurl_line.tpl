  <volist name="playurl_line" id="feifei" key="sid"> 
   <a data-site="{$feifei.player_name_en}" class="player-{$sid} js-site ea-site ea-site-{$feifei.player_name_en} menu_class"><span>{$feifei.player_name_zh}</span> </a> 
  </volist> 
  <ul class="the_menu dropdown-menu" id="bofangyuan"> 
   <volist name="playurl_line" id="feifei" key="sid"> 
    <li class="menuli"><a data-site="{$feifei.player_name_en}" class="js-site ea-site ea-site-{$feifei.player_name_en}"><span>{$feifei.player_name_zh}</span></a></li> 
   </volist> 
  </ul>
</h2>  
  <volist name="playurl_line" id="feifei" key="sid"> 
   <div class="playurl-{$sid} top-list-ji-fl"> 
    <div class="ji-tab-content js-tab-content stui-pannel_bd col-pd"> 
     <div class="num-tab-main js-tab g-clear stui-content__playlist column10 clearfix"> 
      <volist name="feifei.son" id="feifeison" key="pid"> 
       <li><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}">{$feifeison.title}</a></li>
      </volist> 
     </div> 
    </div> 
   </div> 
  </volist>