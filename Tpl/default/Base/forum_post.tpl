<php>
if($forum_cid){
	$vod = D('Vod')->ff_find('vod_id,vod_cid,vod_name,vod_ename,vod_jumpurl', array('vod_id'=>array('eq',$forum_cid)), 'cache_page_vod_'.$forum_cid, true);
}
</php>
<form class="form-forum ff-forum-post" role="form" action="{$root}index.php?s=forum-update" method="post">
  <input name="forum_cid" type="hidden" value="{$forum_cid|default=0}" />
  <input name="forum_sid" type="hidden" value="{$forum_sid|default=5}" />
  <input name="forum_pid" type="hidden" value="{$forum_id|default=0}" />
  <div class="form-group">
    <textarea name="forum_content" class="form-control" rows="5" placeholder="<eq name="action" value="guestbook">期待您的宝贵意见！<else/>《{$vod.vod_name}》怎么样,说点什么!</eq>"></textarea>
  </div>
  <div class="form-group text-right">
    <label>
      <input class="btn-defauplol input-sm ff-vcode ff-vcode-input" name="forum_vcode" maxlength="4" type="text" placeholder="验证码">
    </label>
    <label>
      <button type="submit" class="btn-defaupl">发表评论</button>
    </label>
  </div>
  <div class="form-group ff-alert clearfix">
  </div>
</form>
<volist name=":ff_mysql_forum('cid:'.$forum_cid.';imit:2;order:forum_addtime;sort:desc')" id="feifei" key="k" offset="0" length="1">
<eq name="k" value="0"><else/><div class="comment-tab"><ul class="comment-tab-left"><li class="current comment-show">全部评论</li></ul></div></eq>
</volist>
