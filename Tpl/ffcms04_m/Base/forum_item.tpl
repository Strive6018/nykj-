<volist name="item_list" id="feifeicms">
<div class="cmt-item clearfix">
   <div class="cmt-user-icon">
    <a href="javascript:;" target="_parent"><img src="{$feifeicms.user_face|ff_url_img|default=$root.'Public/images/face/default.png'}" /></a>
   </div> 
   <div class="cmt-body">
    <div class="cmt-action">
     <a href="/" target="_parent" class="cmt-username cmt-user-vip">{$feifeicms.user_name|htmlspecialchars|nb}</a> 
     <a href="javascript:;" target="_parent"><img src="/Public/ffcms/images/vip<include file="Base:vod_svip" />.png" class="cmt-vip-icon" /></a> 
     <div class="cmt-action-btn">
      <div class="cmt-btn-like"><a class="ff-updown-set" href="javascript:;" data-id="{$feifeicms.forum_id}" data-module="forum" data-type="up" data-toggle="tooltip" data-placement="top" title="支持"><span class="ff-updown-val">{$feifeicms.forum_up}</span></a></div> 
      <div class="cmt-btn-dislike"><a class="ff-updown-set" href="javascript:;" data-id="{$feifeicms.forum_id}" data-module="forum" data-type="down" data-toggle="tooltip" data-placement="top" title="反对"><span class="ff-updown-val">{$feifeicms.forum_down}</span></a></div>
     </div>
    </div> 
    <div class="cmt-publish">{$feifeicms.forum_addtime|date='Y-m-d H:i:s',###}</div> 
    <span class="cmt-content">{$feifeicms.forum_content|htmlspecialchars|nb|msubstr=0,300}</span>
   </div>
  </div>
  </volist>