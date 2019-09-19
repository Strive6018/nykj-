      <li class="tv-landscape-con playlike">
        <div class="hot-pic-like js-collect fv-cut" data-name="{$feifei.vod_name}">
          <p><a class="poster-src" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank" title="{$feifei.vod_name}"> 
		  <img class="ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" width="180" height="240" alt="{$feifei.vod_name}"><span class="hot-pic-shadow"></span><span class="playicon"></span></a>
		  <include file="Home:vod_qxd" /></p>
          <p class="hot-pic-text"><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank"><include file="Home:vod_contino" /></a></p>
        </div>
        <div class="hot-pic-text-box">
          <p class="hot-pic-tit clearfix"> <span class="score"> {$feifei.vod_gold}</span> <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank" class="hot-pic-name" title="{$feifei.vod_name}">{$feifei.vod_name}</a></p>
          <p class="hot-pic-tip">主演：<include file="Home:vod_yyb" /></p>
        </div>
      </li>