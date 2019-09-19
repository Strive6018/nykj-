<volist name="item_list" id="feifeicms">
<div class="comment-item">
<div class="comment-user-avatar">
<a href="{:ff_url('user/index',array('id'=>$feifeicms['user_id']),true)}" target="_blank"><img src="{$feifeicms.user_face|ff_url_img|default=$root.'Public/images/face/default.png'}"></a>
</div>
<div class="media-body comment-section">
<div class="comment-user-info">
<a href="{:ff_url('user/index',array('id'=>$feifeicms['user_id']),true)}" class="redname" target="_blank">{$feifeicms.user_name|htmlspecialchars}</a>
<a href="javascript:;" title="{$site_name|msubstr=0,2}VIP会员：VIP<include file="Base:vod_svip" />" target="_blank">
<span class="vip-level-icon level-vip<include file="Base:vod_svip" />"></span>
</a>

<a href="javascript:;" target="_blank" title="{$site_name|msubstr=0,2}用户等级：Lv<include file="Base:vod_vipdj" />" class="user-grade-icon user-grade-lv<include file="Base:vod_vipdj" />"></a>
<span class="comment-timestamp">{$feifeicms.forum_addtime|date='Y-m-d H:i:s',###}</span>
</div>
    <p class="comment-text">{$feifeicms.forum_content|htmlspecialchars|msubstr=0,300}</p>
    <p class="comment-handle">
      <a class="ff-updown-set comment-handle-btn comment-handle-up" href="javascript:;" data-id="{$feifeicms.forum_id}" data-module="forum" data-type="up" data-toggle="tooltip" data-placement="top" title="支持"><span class="ff-updown-val">{$feifeicms.forum_up}</span></a>
      <a class="ff-updown-set comment-handle-btn comment-handle-down" href="javascript:;" data-id="{$feifeicms.forum_id}" data-module="forum" data-type="down" data-toggle="tooltip" data-placement="top" title="反对"><span class="ff-updown-val">{$feifeicms.forum_down}</span></a></p>
    <p class="collapse forum-reply" data-id="{$feifeicms.forum_id}"></p>
    </p>
  </div>
</div>
</volist>



