<?php
class SearchAction extends HomeAction{
	public function vod(){
		$params = array();
		$params['wd'] = htmlspecialchars(urldecode(trim($_REQUEST['wd'])));
		$params['field'] = 'list_id,list_dir,vod_id,vod_name,vod_ename,vod_jumpurl';
		$params['limit'] = !empty($_GET['limit'])?intval($_GET['limit']):20;
		$params['order'] = 'vod_stars desc,vod_hits desc,vod_id';
		$params['sort'] = 'desc';
		$params['cache_name'] = md5(C('cache_foreach_prefix').'_'.implode('_',$params));
		$params['cache_time']= intval(C('cache_foreach'));
		$where = array();
		$where['vod_name'] = array('like','%'.$params['wd'].'%');
		$infos = D("VodView")->ff_select_page($params,$where);
		if($infos){
			foreach($infos as $key=>$value){
				$infos[$key]['name'] = trim($value['vod_name']);
				$infos[$key]['link'] = ff_url_vod_read($value['list_id'],$value['list_dir'],$value['vod_id'],$value['vod_ename'],$value['vod_jumpurl']);
			}
			$this->ajaxReturn($infos,"ok",1);
		}else{
			$this->ajaxReturn($infos,"error",0);
		}
	}
	public function news(){
		$params = array();
		$params['wd'] = htmlspecialchars(urldecode(trim($_REQUEST['wd'])));
		$params['field'] = 'list_id,list_dir,news_id,news_name,news_ename,news_jumpurl';
		$params['limit'] = !empty($_GET['limit'])?intval($_GET['limit']):20;
		$params['order'] = 'news_stars desc,news_id';
		$params['sort'] = 'desc';
		$params['cache_name'] = md5(C('cache_foreach_prefix').'_'.implode('_',$params));
		$params['cache_time']= intval(C('cache_foreach'));
		$where = array();
		$where['news_name'] = array('like','%'.$params['wd'].'%');
		$infos = D("NewsView")->ff_select_page($params, $where);
		if($infos){
			foreach($infos as $key=>$value){
				$infos[$key]['name'] = trim($value['news_name']);
				$infos[$key]['link'] = ff_url_news_read($value['list_id'],$value['list_dir'],$value['news_id'],$value['news_ename'],$value['news_jumpurl']);
			}
			$this->ajaxReturn($infos, "ok", 1);
		}else{
			$this->ajaxReturn($infos, "error", 0);
		}
	}
}
?>