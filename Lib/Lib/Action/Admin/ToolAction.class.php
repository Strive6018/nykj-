<?php
class ToolAction extends BaseAction{
	//批量工具
	public function batch(){
		$this->display('./Public/system/tool_batch.html');
	}
	//同名检测
	public function name(){
		$this->display('./Public/system/tool_name.html');
	}
	public function nameupdate(){
		$length = intval($_GET['length']);
		if($length > 0 ){
			$list = D('Vod')->field("left(vod_name, $length) as vod_name,count(*) as count")->where('vod_status > 0')->group("left(vod_name, $length)")->having('count(*)>1')->order('count desc')->select();
		}else{
			$list = D('Vod')->field('vod_name,count(*) as count')->where('vod_status > 0')->group('vod_name')->having('count(*)>1')->order('count desc')->limit(10)->select();
		}
		if(!$list){
			$this->success('恭喜您，无重名数据！');
			exit();
		}
		//跳转变量
		$admin = array();
		$admin['g'] = 'admin';
		$admin['m'] = 'vod';
		$admin['a'] = 'show';
		$admin['length'] = $length;
		$admin['p'] = !empty($_GET['p'])?intval($_GET['p']):1;
		//查询条件
		$where = array();
		$where['vod_status'] = array('gt',0);
		foreach($list as $key=>$value){
			$where['vod_name'][] = array('like', $value["vod_name"].'%');
		}
		$where['vod_name'][] = 'or';
		$list = D('VodView')->field('*')->where($where)->order('vod_name')->limit(30)->select();
		foreach($list as $key=>$val){
		  $list[$key]['list_url'] = '?s=Admin-Vod-Show-cid-'.$list[$key]['vod_cid'];
			$list[$key]['vod_url'] = ff_url_vod_read($list[$key]['list_id'],$list[$key]['list_dir'],$list[$key]['vod_id'],$list[$key]['vod_ename'],$list[$key]['vod_jumpurl']);
			$list[$key]['vod_starsarr'] = admin_star_arr($list[$key]['vod_stars']);
		}
		//变量赋值并输出模板
		$this->assign($admin);
		$this->assign('pages',$pages);
		$this->assign('list',$list);
	  $this->display('./Public/system/vod_show.html');
	}		
}
?>