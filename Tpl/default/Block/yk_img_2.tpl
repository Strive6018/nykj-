         <li class="yk-pack"> 
          <div class="p-thumb"> 
           <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank"></a> 
           <img class="quic ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}" /> 
           <span class="playshow">{:date('i:s',$feifei['vod_length'])}</span> 
		   <div class="p-thumb-tagrt"><span class="red">推荐</span>
          </div> 
		  </div>
          <ul class="info-list"> 
           <li class="title"><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a></li> 
           <li><span>{$feifei.vod_hits}次播放</span></li> 
          </ul> 
		  </li> 