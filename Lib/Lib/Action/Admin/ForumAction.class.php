<?php
class ForumAction extends BaseAction{
	// 用户评论管理
  public function show(){
		$admin = array();
		$admin['cid'] = $_GET['cid'];
		$admin['sid'] = $_GET['sid'];
		$admin['uid'] = $_GET['uid'];
		$admin['istheme'] = $_GET['istheme'];
		if(isset($admin['istheme'])){
			if($admin['istheme'] == 1){
				$admin['pid'] = '0';
			}else if($admin['istheme'] == 0){
				$admin['pid_not'] = '0';
			}
		}else{
			$admin['pid'] = $_GET['pid'];
		}
		$admin['status'] = $_GET['status'];
		$admin['wd'] = urldecode(trim($_REQUEST['wd']));
		$admin['limit'] = 20;
		$admin['page_is'] = true;
		$admin['page_id'] = 'forum';
		$admin['page_p'] = !empty($_GET['p'])?intval($_GET['p']):1;
		$admin['cache_time'] = 0;
		$admin['order'] = !empty($_GET['order'])?$_GET['order']:'forum_id';
		$admin['sort'] = !empty($_GET['sort'])?$_GET['sort']:'desc';
		$list = ff_mysql_forum($admin);
		//
		$page = $_GET['ff_page_forum'];
		$params = array('cid'=>$admin['cid'], 'sid'=>$admin['sid'], 'uid'=>$admin['uid'], 'pid'=>$admin['pid'], 'istheme'=>$admin['istheme'], 'status'=>$admin['status'], 'wd'=>urlencode($admin['wd']), 'order'=>$admin['order'], 'sort'=>$admin['sort'], 'p'=>'FFLINK');
		$pageurl = U('Forum/Show', $params, false, true);
		$admin['pages'] = '共'.$page['records'].'篇评论&nbsp;当前:'.$page['currentpage'].'/'.$page['totalpages'].'页&nbsp;'.getpage($page['currentpage'],$page['totalpages'],8,$pageurl,'pagego(\''.$pageurl.'\','.$page['totalpages'].')');
		$admin['list'] = $list;
		$this->assign($admin);
		//回跳URL
		$params['p'] = $admin['page_p'];
		$_SESSION['forum_jumpurl'] = U('Admin-Forum/Show', $params);
    $this->display('./Public/system/forum_show.html');
  }
	// 编辑界面
  public function add(){
		$array =  D('Forum')->ff_find('*', array('forum_id'=>array('eq',$_GET['id'])),false,false);
		$this->assign($array);	
    $this->display('./Public/system/forum_add.html');
  }
	// 更新
	public function update(){
		$data = $_REQUEST;
		$info = D("Forum")->ff_update($$data);
		if($info){
			$this->assign("jumpUrl",$_SESSION['forum_jumpurl']);
			$this->success('更新评论信息成功！');
		}else{
			$this->error(D("Forum")->getError());
			
		}
	}
	//置顶
	public function istop(){
		$where = array();
		$where['forum_id'] = array('eq', $_REQUEST['ids']);
		D('Forum')->where( $where )->setField('forum_istop', intval($_REQUEST['value']));
		$this->success('置顶状态修改完成！');
		//redirect($_SERVER['HTTP_REFERER']);
	}
	//状态
	public function status(){
		$where = array();
		if(is_array($_REQUEST['ids'])){
			$where['forum_id'] = array('in',implode(',', $_REQUEST['ids']));
		}else{
			$where['forum_id'] = array('eq', $_REQUEST['ids']);
		}
		D('Forum')->where( $where )->setField('forum_status', intval($_REQUEST['value']));
		$this->success('显示状态修改完成！');
		//redirect($_SERVER['HTTP_REFERER']);
	}
	// 删除
  public function del(){
		$ids = $_REQUEST['ids'];
		$where = array();
		if(is_array($ids)){
			$where['forum_id'] = array('in',implode(',', $ids));
			$where['forum_pid'] = array('in',implode(',', $ids));
		}else{
			$where['forum_id'] = array('eq', $ids);
			$where['forum_pid'] = array('eq', $ids);
		}
		$where['_logic'] = 'or';
		D('Forum')->where($where)->delete();
		$this->success('删除评论完成！');
  }
	// 清空
  public function clear(){
		$sid = $_REQUEST['sid'];
		$where = array();
		$where['forum_id'] = array('gt', 0);
		if(isset($sid)){
			$where['forum_sid'] = array('eq', $sid);
		}
		D('Forum')->where($where)->delete();
		$this->success('对应的评论已清空！');
  }				
}
?>