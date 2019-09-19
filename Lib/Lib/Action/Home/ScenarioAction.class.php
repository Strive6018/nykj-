<?php
class ScenarioAction extends HomeAction{
	//分集剧情频道
  public function index(){
		$info = $this->label();
		$this->assign($info);
		$this->display('Scenario:index');
  }
	// 按ID读取影片分集
  public function detail(){
		$detail = $this->Lable_Vod_Scenario($this->get_cache_detail('id'), array('id'=>intval($_GET['id']), 'pid'=>intval($_GET['pid'])));
		$this->assign($detail);
		$this->display($detail['scenario_skin']);
  }
	// 按别名读取影片分集
	public function ename(){
		$detail = $this->get_cache_detail('ename');
		$detail = $this->Lable_Vod_Scenario($detail, array('id'=>$detail['vod_id'], 'pid'=>intval($_GET['pid'])));
		$this->assign($detail);
		$this->display($detail['scenario_skin']);
	}
	// more
	public function _empty($action){
		if(is_numeric($_GET['id'])){
	 		$detail = $this->get_cache_detail('id');
		}else{
			$detail = $this->get_cache_detail('ename');
		}
		$this->assign($detail);
		$this->display('Scenario:'.$action);
	}
	// 剧情普通标签
	private function label(){
		$get = array();
		$get['scenario_page'] = !empty($_GET['p']) ? intval($_GET['p']) : 1;
		return $get;
	}
	// 从数据库获取内容数据
	private function get_cache_detail($action='id'){
		//参数
		$params = array();
		//条件
		$where = array();
		$where['vod_status'] = array('eq', 1);
		if($action=='ename'){
			$params['id'] = htmlspecialchars($_GET['id']);
			$where['vod_ename'] = array('eq', $params['id']);
		}else{
			$params['id'] = intval($_GET['id']);
			$where['vod_id'] = array('eq', $params['id']);
		}
		//查库
		$info = D('Vod')->ff_find('*', $where, 'cache_page_vod_'.$params['id'], true);
		if(!$info){
			$this->assign("jumpUrl",C('site_path'));
			$this->error('此影片已经删除，请选择观看其它节目！');
		}
		//解析标签
		return $this->Lable_Vod_Read($info);
	}
}
?>