<volist name="item_list" id="feifei">
<div class="media my-3 pb-3 border-bottom">
  <a class="mr-3" href="{:ff_url('user/index',array('id'=>$feifei['user_id']),true)}" target="_blank">
    <img class="rounded" src="{$feifei.user_face|ff_url_img|default=$root.'Public/images/face/default.png'}" width="50" height="50">
  </a>
  <div class="media-body">
    <h6 class="forum-user-name">
      <a href="{:ff_url('user/index',array('id'=>$feifei['user_id']),true)}" target="_blank">{$feifei.user_name|htmlspecialchars}</a>
      <small class="text-muted">{$feifei.forum_addtime|date='Y/m/d',###}</small>
    </h6>
    <div class="text-muted forum-content">
      <small>{$feifei.forum_content|htmlspecialchars|nb|msubstr=0,160}
			<strong><a class="text-muted" href="{:ff_url('forum/detail', array('id'=>$feifei['forum_id']), true)}">...</a></strong></small>
      <a class="forum-report" href="javascript:;" data-id="{$feifei.forum_id}" title="举报"><small>举报</small></a>
    </div>
		<div class="btn-group btn-group-sm forum-btn mt-2 mb-0">
			<a class="btn btn-outline-dark ff-updown-set" href="javascript:;" data-id="{$feifei.forum_id}" data-module="forum" data-type="up" data-toggle="tooltip" data-placement="top" title="支持"><i class="fa fa-thumbs-o-up"></i> <span class="ff-updown-val">{$feifei.forum_up|number_format}</span></a>
      <a class="btn btn-outline-dark ff-updown-set" href="javascript:;" data-id="{$feifei.forum_id}" data-module="forum" data-type="down" data-toggle="tooltip" data-placement="top" title="反对"><i class="fa fa-thumbs-o-down"></i> <span class="ff-updown-val">{$feifei.forum_down|number_format}</span></a>
      <a class="btn btn-outline-dark forum-reply-set" href="javascript:;" data-id="{$feifei.forum_id}" data-toggle="collapse" title="回复"><i class="fa fa-comment-o"></i> <span class="forum-reply-val">{$feifei.forum_reply|number_format}</span></a>
		</div>
    <div class="forum-reply mt-2" data-id="{$feifei.forum_id}"></div>
  </div>
</div>
</volist>