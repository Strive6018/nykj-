<php>$item_list = ff_mysql_forum('sid:'.$forum_sid.';cid:'.$forum_cid.';pid:'.$forum_pid.';status:1;limit:30;page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
$is_more = intval($_GET['ismore']);
if($forum_page > 1){
  if($forum_page > $page_array['totalpages']){
   exit();
  }
}</php>
<eq name="is_more" value="1">
	<include file="BlockBase:forum_item" />
<else/>
  <include file="BlockBase:forum_post" />
  <div class="ff-forum-item">
  <include file="BlockBase:forum_item" />
  </div>
  <gt name="page_array.totalpages" value="1">
  <include file="BlockBase:forum_page" />
  </gt>
</eq>