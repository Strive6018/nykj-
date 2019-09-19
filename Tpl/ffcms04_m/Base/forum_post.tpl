<php>
if($forum_cid){
	$vod = D('Vod')->ff_find('vod_id,vod_cid,vod_name,vod_ename,vod_jumpurl', array('vod_id'=>array('eq',$forum_cid)), 'cache_page_vod_'.$forum_cid, true);
}
</php>
<form class="form-forum ff-forum-post" role="form" action="{$root}index.php?s=forum-update" method="post">
  <input name="forum_cid" type="hidden" value="{$forum_cid|default=0}" />
  <input name="forum_sid" type="hidden" value="{$forum_sid|default=5}" />
  <input name="forum_pid" type="hidden" value="{$forum_pid|default=0}" />
  <div class="form-group">
    <textarea name="forum_content" class="form-controle" rows="5" placeholder="<eq name="action" value="guestbook">期待您的宝贵意见！<else/>《{$vod.vod_name}》怎么样,说点什么!</eq>"></textarea>
  </div>
  
    <div class="form-group text-right">
    <label>
	  <input class="input ff-vcode ff-vcode-input" name="forum_vcode" maxlength="4" type="text" placeholder="验证码">
    </label>
    <label>
      <button type="submit" class="btn-sms">提交</button>
    </label>
  </div>
  <div class="ff-alert clearfix">
  </div>
   </div>
   </div>
</form>
