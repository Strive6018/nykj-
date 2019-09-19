<?php
class AdminAction extends BaseAction{
	// 用户管理
  public function show(){
	  $rs = D("Admin");
		$list = $rs->order('admin_logintime desc')->select();
		$this->assign('url_html_suffix',C('url_html_suffix'));
		$this->assign('html_file_suffix',C('html_file_suffix'));
		$this->assign('list',$list);
    $this->display('./Public/system/admin_show.html');
  }	
	// 用户添加
  public function add(){
		$array = array();
		$where['admin_id'] = $_GET['id'];
		$rs = D("Admin");
		$array = $rs->where($where)->find();
		$type = explode(',',$array['admin_ok']);
		$this->assign('admin',$type);
		$this->assign($array);
    $this->display('./Public/system/admin_add.html');
  }	
	//处理权限入库
	public function _before_insert(){
		$ok = $_POST['ids'];
		for($i=0;$i<20;$i++){
			if($ok[$i]){
				$rs[$i]=$ok[$i];
			}else{
				$rs[$i]=0;
			}
		}
		$_POST['admin_ok'] = implode(',',$rs);
	}
	// 写入数据
	public function insert(){
		$rs = D("Admin");
		if($rs->create()){
			if(false !==  $rs->add()){
			    $this->assign("jumpUrl",'?s=Admin-Admin-Show');
				$this->success('添加后台管理员成功！');
			}else{
				$this->error('添加后台管理员失败');
			}
		}else{
		    $this->error($rs->getError());
		}		
	}
	// 更新数据
	public function update(){
	    $this->_before_insert();
		$rs = D("Admin");
		if ($rs->create()) {
			if(false !==  $rs->save()){
			    $this->assign("jumpUrl",'?s=Admin-Admin-Show');
				$this->success('更新管理员信息成功！');
			}else{
				$this->error("更新管理员信息失败！");
			}
		}else{
			$this->error($rs->getError());
		}
	}
	// 删除用户
  public function del(){
		$rs = D("Admin");
		$rs->where('admin_id='.$_GET['id'])->delete();
		$this->success('删除后台管理员成功！');
  }
	// 批量删除
  public function delall(){
		$where['admin_id'] = array('in',implode(',',$_POST['ids']));
		$rs = D("Admin");
		$rs->where($where)->delete();
		$this->success('批量删除后台管理员成功！');
  }	
}
?>