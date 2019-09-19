<?php
class ForumAction extends HomeAction{

	public function _empty($action){
	 $this->_empty_forum($action);
	}
	
	protected function _empty_forum($action){//channel vod news special ajax post
		/*
		$tag = 'sid:1;limit:2;cache_name:default;cache_time:0;page_is:true;page_id:comment;page_p:2;order:forum_addtime;sort:desc';
		$data = ff_mysql_forum($tag);
		*/
		$info = $this->label();
		$this->assign($info);
		if(ff_module2sid($action)){
			$this->display('Forum:category_'.$action);
		}else{
			$this->display('Forum:'.$action);
		}
	}
	
	//讨论详情页展示
	public function detail(){
		$info = $this->label();
		$where = array();
		$where['forum_id'] = array('eq', $info['forum_id']);
		if(C('user_check')){
			$where['forum_status'] = 1;
		}
		$detail = D('Forum')->ff_find('*', $where, 'cache_page_forum_'.$info['id'], 'User');
		if(!$detail){
			$this->assign("jumpUrl", C('site_path'));
			$this->error('评论已删除！');
		}
		$detail = $this->Lable_Forum_Detail($info, $detail);
		$this->assign($info);
		$this->assign($detail);
		$this->display($detail['forum_skin']);
	}	
	
	//获取评论配置
	public function config(){
		$config = array();
		$config['forum_cid'] = intval($_GET['cid']);
		$config['forum_sid'] = intval($_GET['sid']);
		$config['forum_pid'] = intval($_GET['pid']);
		$config['forum_uid'] = intval($_GET['uid']);
		$config['forum_type'] = C('forum_type');
		$config['forum_module'] = ff_sid2module($config['forum_sid']);
		$config['uyan_uid'] = C('forum_type_uyan_uid');
		$config['changyan_appid'] = C('forum_type_changyan_appid');
		$config['changyan_conf'] = C('forum_type_changyan_conf');
		$this->ajaxReturn($config, 'ok', 200);
	}
	
	//更新回复数并返回值
	public function reply(){
		$forum_id = intval($_GET['id']);
		if($forum_id){
			$count = D('Forum')->where('forum_pid = '.$forum_id)->count("forum_id");
			if($count){
				D('Forum')-> where('forum_id='.$forum_id)->setField('forum_reply', $count);
				$this->ajaxReturn($count, "回复数", 200);
			}
		}
		$this->ajaxReturn(0, "回复数", 0);
	}
	
	//写入举报次数
	public function report(){
		$forum_id = intval($_GET['id']);
		if($forum_id){
			D("Forum")->setInc('forum_report', 'forum_id = '.$forum_id, 1);
			$this->ajaxReturn($count, "举报成功！", 200);
		}else{
			$this->ajaxReturn($count, "举报失败！", 0);
		}
	}
	
	// 发布讨论
  public function update(){
		$post = $_POST;
		$post['forum_cookie'] = md5('forum_'.intval($post['forum_sid']).'_'.intval($post['forum_pid']).intval($post['forum_uid']).'_'.intval($post['forum_cid']));
		$info = D("Forum")->ff_update($post);
		if($info){
			if (C('user_check')) {
				$this->ajaxReturn($info, "谢谢，我们会尽快审核你的发言！", 201);
			}else{
				$this->ajaxReturn($info, "感谢你的参与！", 200);
			}
		}else{
			$this->ajaxReturn('', D("Forum")->getError(), 0);
		}
  }
	
	// 删除评论
	public function delete(){
		$user_id = D('User')->ff_islogin();
		if($user_id){
			$where = array();
			$where['forum_id'] = array('eq', intval($_GET['id']));
			$where['forum_uid'] = array('eq', $user_id);
			if($info = D('Forum')->where($where)->delete()){
				$this->ajaxReturn($info, "删除评论成功！", 200);
			}else{
				$this->ajaxReturn(0, D("Forum")->getError(), 0);
			}
		}
		$this->ajaxReturn(0, '请先登录。', 0);
	}	
	
	// 评论普通标签
	private function label(){
		$get = array();
		$get['id'] = intval($_GET['id']);
		$get['cid'] = intval($_GET['cid']);
		$get['sid'] = intval($_GET['sid']);
		$get['uid'] = intval($_GET['uid']);
		$get['pid'] = intval($_GET['pid']);
		$get['page'] = !empty($_GET['p']) ? intval($_GET['p']) : 1;
		return $this->Lable_Forum($get);
	}
}
?>