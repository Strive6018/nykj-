<?php
class MapAction extends HomeAction{
  public function show(){
		$params = array();
		$params['id'] = !empty($_GET['id']) ? trim($_GET['id']):'rss';
		$params['page'] = !empty($_GET['p']) ? intval($_GET['p']) : 1;
		$params['limit'] = !empty($_GET['limit']) ? intval($_GET['limit']):30;
		$this->assign($params);
		$this->display('Map:'.$params['id'],'utf-8','text/xml'); 
	}	
}
?>