<?php
class SpecialAction extends HomeAction{
  // 专题列表
  public function show(){
		$params = array();
		$params['page'] = !empty($_GET['p']) ? intval($_GET['p']) : 1;
		$params['ajax'] = intval($_GET['ajax']);
		$params['type'] = htmlspecialchars(urldecode(trim($_REQUEST['type'])));
		$info = $this->Lable_Special_List($params);
		$this->assign($info);
		$this->display($info['special_skin']);
  }
	// 按ID读取影片
  public function read(){
		$detail = $this->get_cache_detail('id');
		$this->assign($detail);
		$this->display($detail['special_skin']);
  }
	// 按别名读取影片
	public function ename(){
		$detail = $this->get_cache_detail('ename');
		$this->assign($detail);
		$this->display($detail['special_skin']);
	}	
	// 从数据库获取内容数据
	private function get_cache_detail($action='id'){
		//参数
		$params = array();
		$params['id'] = intval($_REQUEST['id']);
		//条件
		$where = array();
		$where['special_status'] = array('eq', 1);
		if($action=='ename'){
			$where['special_ename'] = array('eq', $params['id']);
		}else{
			$where['special_id'] = array('eq', $params['id']);
		}
		//查库
		$info = D('Special')->ff_find('*', $where, 'cache_page_special_'.$params['id'], true);
		if(!$info){
			$this->assign("jumpUrl",C('site_path'));
			$this->error('此专题已经删除，请选择观看其它节目！');
		}
		//解析标签
		return $this->Lable_Special_Read($info);
	}
}
?>