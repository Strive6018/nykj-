<div class="media py-3 border-bottom">
	<a class="mr-3 mt-1" href="{:ff_url('user/index',array('id'=>$feifei['user_id']),true)}" target="_blank">
    <img class="border" src="{$feifei.user_face|default='face.jpg'|ff_url_img}" width="64" height="64">
  </a>
	<div class="media-body">
		<p class="mb-0 pb-0">
			<eq name="feifei.forum_istop" value="1"><span class="badge badge-secondary">置顶</span></eq>
			{$feifei.forum_content|htmlspecialchars|nb|msubstr=0,160,true}
		</p>
		<p class="mt-2 mb-0 pb-0 text-dark">
			<small>
			<i class="fa fa-clock-o"></i> <span class="text-muted">{$feifei.forum_addtime|date='Y/m/d',###}</span>
			<i class="fa fa-user-o ml-1"></i> <a class="text-muted" href="{:ff_url('user/index',array('id'=>$feifei['user_id']),true)}" target="_blank">{$feifei.user_name|htmlspecialchars}</a>
			<i class="fa fa-comment-o ml-1"></i> <a class="text-muted" href="{:ff_url('forum/detail', array('id'=>$feifei['forum_id']), true)}" title="评论详情">{$feifei.forum_reply|number_format}</a>
			<eq name="feifei.user_id" value="$site_user_id">
			<i class="fa fa-trash-o"></i> <a class="text-muted forum-delete" href="javascript:;" data-id="{$feifei.forum_id}" data-toggle="tooltip" data-placement="top" title="删除">删除</a>
			</eq>
			</small>
		</p>
	</div>
</div>