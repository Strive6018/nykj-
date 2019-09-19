<?php
class CjAction extends BaseAction{
	// 展示列表
	public function show(){
		$admin = array();
		$admin['cj_type'] = intval($_GET['type']);
		$list = D('Cj')->where('cj_type='.$admin['cj_type'])->order('cj_id asc')->select();
		$this->assign($admin);
		$this->assign('list_cj',$list);
		$this->assign('jumpurl',F('_cj/xucai'));
		if($admin['cj_type'] == 1){
			$this->display('./Public/system/cj_list_vod.html');
		}elseif($admin['cj_type'] == 2){
			$this->display('./Public/system/cj_list_news.html');
		}elseif($admin['cj_type'] == 4){
			$this->display('./Public/system/cj_list_user.html');
		}elseif($admin['cj_type'] == 5){
			$this->display('./Public/system/cj_list_forum.html');
		}elseif($admin['cj_type'] == 6){
			$this->display('./Public/system/cj_list_scenario.html');
		}else{
			$this->display('./Public/system/cj_list.html');
		}
	}
	// 添加编辑采集节点
  public function add(){
		$id = intval($_GET['id']);
	  $rs = D("Cj");
		if ($id) {
      $where['cj_id'] = $id;
			$list = $rs->where($where)->find();
		}
		$this->assign($list);
		$this->display('./Public/system/cj_add.html');
  }
	// 添加采集节点
	public function insert() {
		$rs = D("Cj");
		if ($rs->create()) {
			if ( false !==  $rs->add() ) {
				$this->assign("jumpUrl",'?s=Admin-Cj-Show-type-'.intval($_POST['cj_type']));
				$this->success('资源库添加完成！');
			}else{
				$this->error($rs->getError().'添加资源库地址失败！');
			}
		}else{
		    $this->error($rs->getError());
		}	
	}
	// 更新采集节点
	public function update(){
		$rs = D("Cj");
		if ($rs->create()) {
			$list = $rs->save();
			if ($list !== false) {
			  $this->assign("jumpUrl",'?s=Admin-Cj-Show-type-'.intval($_POST['cj_type']));
				$this->success('资源库修改完成！');
			}else{
				$this->error("更新资源库地址失败！");
			}
		}else{
			$this->error($rs->getError());
		}
	}	
	// 删除采集节点
	public function del(){
		$where['cj_id'] = $_GET['id'];
		D("Cj")->where($where)->delete();
		$this->assign("jumpUrl",'?s=Admin-Cj-Add');
		$this->success('删除资源库完成！');
	}
	// 检测第三方资源分类是否绑定
	public function setbind(){
		$rs = M("List");
		$list = $rs->field('list_id,list_pid,list_sid,list_name')->where('list_sid = '.$_GET['sid'])->order('list_id asc')->select();
		foreach($list as $key=>$value){
			if(!ff_list_isson($list[$key]['list_id'])){
				unset($list[$key]);
			}
		}
		$array_bind = F('_cj/bind');
		$this->assign('list',$list);//系统分类列表
		$this->assign('list_id_bind',$array_bind[$_GET['key']]);//绑定后对应的系统分类ID
		$this->assign('bind_key',$_GET['key']);
		$this->assign('bind_val',$_GET['val']);
		$this->display('./Public/system/cj_setbind.html');
	}
	// 存储第三方资源分类绑定
  public function insertbind(){
		$bindcache = F('_cj/bind');
		if (!is_array($bindcache)) {
			$bindcache = array();
			$bindcache['1_1'] = 0;
		}
		//keyvalue
		$bindinsert[$_GET['key']] = intval($_GET['val']);
		//合并
		$bindarray = array_merge($bindcache, $bindinsert);
		//保存
		F('_cj/bind',$bindarray);
		exit('ok');
	}	
	// 资源站定时采集
	public function win(){
		$list = D('Cj')->order('cj_id asc')->select();
		$this->assign('list_cj',$list);
		$this->display('./Public/system/cj_time_win.html');
	}
	// 执行定时采集任务
	public function wait(){
		$infos = D("List")->field('list_id')->where('list_sid=1')->order('list_id asc')->select();
		foreach($infos as $key=>$value){
			$list[$key] = $value['list_id'];
		}
		$this->assign('list_vod_all',implode(',',$list));
		//
		$array = $_REQUEST['ds'];
		$array['min'] = $array['caiji']+$array['create'];
		$this->assign($array);
		$this->display('./Public/system/cj_time_wait.html');
	}
	//采集入口
	public function apis(){
		$admin = array();
		$admin['cjid']   = $_REQUEST['cjid'];//采集项目ID
		$admin['cjtype']  = $_REQUEST['cjtype'];//1(vod)|2(news)|3(special)|4(user)|5(forum)|6(star)|7(role)
		$admin['action'] = $_REQUEST['action'];//all/ids/days/post/show
		$admin['xmlurl'] = $_REQUEST['xmlurl'];//采集网址
		$admin['xmltype'] = $_REQUEST['xmltype'];//资源站类型 josn|xml
		$admin['field'] = $_REQUEST['field'];//重采资料字段
		$admin['apikey'] = $_REQUEST['apikey'];//APIKEY参数
		$admin['page']   = !empty($_REQUEST['page'])?intval($_GET['page']):1;
		$params = array();
		//采集模块分支
		if($admin['cjtype'] == 1){//视频库
			$params['h'] = $_REQUEST['h'];//指定时间
			$params['cid'] = $_REQUEST['cid'];//指定视频分类
			$params['inputer'] = $_REQUEST['inputer'];//指定资源库频道
			$params['play'] = $_REQUEST['play']; //指定播放器组
			$params['wd'] = $_REQUEST['wd'];//指定关键字
			$params['limit'] = $_REQUEST['limit'];//每页采集的数量
			if($admin['action'] == 'ids'){
				$params['vodids'] = implode(',',$_REQUEST['ids']);//采集选中视频ID
			}
			$this->vod($admin, $params);
		}else if($admin['cjtype'] == 2){//文章库
			if($admin['action'] == 'ids'){
				$params['ids'] = implode(',',$_REQUEST['ids']);
			}
			$params['cid'] = $_REQUEST['cid'];
			$params['h'] = $_REQUEST['h'];
			$params['inputer'] = $_REQUEST['inputer'];
			$params['wd'] = $_REQUEST['wd'];
			$params['limit'] = $_REQUEST['limit'];//每页采集的数量
			$this->news($admin, $params);
		}else if($admin['cjtype'] == 4){//用户库
			$params['h'] = $_REQUEST['h'];
			$this->user($admin, $params);
		}else if($admin['cjtype'] == 5){//评论库
			$params['h'] = $_REQUEST['h'];
			$this->forum($admin, $params);
		}else if($admin['cjtype'] == 6){//剧情库
			$params['h'] = $_REQUEST['h'];
			$this->scenario($admin, $params);
		}else{
			dump(http_build_query($params));
			dump('采集模块出错。');
		}
	}
	//视频采集接口
	public function vod($admin, $params){
		$vod = D('Cj')->vod($admin, $params);
		if($vod['status'] != 200){
			$this->assign("waitSecond",10);
			$this->error($vod['infos']);
		}
		//格式化部份数据字段
		$admin['xmltype'] = $vod['type'];
		$json = $vod['infos'];
		unset($vod);
		// 获取到的远程栏目数据增加对应的绑定ID
		foreach($json['list'] as $key=>$value){
			$json['list'][$key]['bind_key'] = $admin['cjid'].'_'.$value['list_id'];
		}
		// 获取到的远程视频列表数据格式化处理
		foreach($json['data'] as $key=>$value){
			$json['data'][$key]['vod_cid'] = intval(ff_bind_id($admin['cjid'].'_'.$value['vod_cid']));
			if(!$json['data'][$key]['vod_reurl']){
				$json['data'][$key]['vod_reurl'] = base64_decode($admin['xmlurl']).$json['data'][$key]['vod_id'];
			}
		}
		// 是否采集入库
		if( in_array($admin['action'], array('ids','days','all','post')) ){
			D('Cj')->vod_update($admin, $params, $json);
		}else{
			//列表分页的方式展示抓取的数据列表
			$this->assign($admin);
			$this->assign($params);
			$this->assign('cj_page', $json['page']);
			$this->assign('cj_list', $json['list']);
			$this->assign('cj_data', $json['data']);
			//生成翻页并加载模板
			$admin['g'] = 'admin';
			$admin['m'] = 'cj';
			$admin['a'] = 'apis';
			$admin['page'] = 'FFLINK';
			$page_link = '?'.http_build_query(array_merge($admin, $params));
			$page_list = '共'.$json['page']['recordcount'].'条数据&nbsp;页次:'.$json['page']['pageindex'].'/'.$json['page']['pagecount'].'页&nbsp;'.getpage($json['page']['pageindex'],$json['page']['pagecount'], 5, $page_link, 'pagego(\''.$page_link.'\','.$json['page']['pagecount'].')');
			$this->assign('page_list', $page_list);
			$this->display('./Public/system/cj_show_vod.html');
		}
	}
	//文章采集接口
	public function news($admin, $params){
		$news = D('Cj')->news_json($admin, $params);
		if($news['status'] != 200){
			$this->assign("waitSecond",10);
			$this->error($vod['infos']);
		}
		//格式化部份数据字段
		$json = $news['infos'];unset($news);
		// 获取到的远程栏目数据增加对应的绑定ID
		foreach($json['list'] as $key=>$value){
			$json['list'][$key]['bind_key'] = $admin['cjid'].'_'.$value['list_id'];
		}
		// 获取到的远程视频列表数据格式化处理
		foreach($json['data'] as $key=>$value){
			$json['data'][$key]['news_cid'] = intval(ff_bind_id($admin['cjid'].'_'.$value['news_cid']));
			if(!$json['data'][$key]['news_reurl']){
				$json['data'][$key]['news_reurl'] = base64_decode($admin['xmlurl']).$json['data'][$key]['news_id'];
			}
		}
		// 是否采集入库
		if( in_array($admin['action'], array('ids','days','all','post')) ){
			D('Cj')->news_update($admin, $params, $json);
		}else{
			//列表分页的方式展示抓取的数据列表
			$this->assign($admin);
			$this->assign($params);
			$this->assign('cj_page', $json['page']);
			$this->assign('cj_list', $json['list']);
			$this->assign('cj_data', $json['data']);
			//生成翻页并加载模板
			$admin['g'] = 'admin';
			$admin['m'] = 'cj';
			$admin['a'] = 'apis';
			$admin['page'] = 'FFLINK';
			$page_link = '?'.http_build_query(array_merge($admin, $params));
			$page_list = '共'.$json['page']['recordcount'].'条数据&nbsp;页次:'.$json['page']['pageindex'].'/'.$json['page']['pagecount'].'页&nbsp;'.getpage($json['page']['pageindex'],$json['page']['pagecount'], 5, $page_link, 'pagego(\''.$page_link.'\','.$json['page']['pagecount'].')');
			$this->assign('page_list', $page_list);
			$this->display('./Public/system/cj_show_news.html');
		}
	}
	//用户采集接口
	public function user($admin, $params){
		$user = D('Cj')->user_json($admin, $params);
		if($user['status'] != 200){
			$this->assign("waitSecond", 10);
			$this->error($user['infos']);
		}
		D('Cj')->user_update($admin, $params, $user['infos']);
	}
	//评论采集接口
	public function forum($admin, $params){
		if(C('collect_forum') < 1){
			$this->assign('jumpUrl','?s=Admin-Admin-Config');
			$this->assign("waitSecond", 10);
			$this->error('请先设置用户ID最大随机值');
		}
		$user = D('Cj')->forum_json($admin, $params);
		if($user['status'] != 200){
			$this->assign("waitSecond", 10);
			$this->error($user['infos']);
		}
		D('Cj')->forum_update($admin, $params, $user['infos']);
	}
	//剧情采集接口
	public function scenario($admin, $params){
		$scenario = D('Cj')->scenario_json($admin, $params);
		if($scenario['status'] != 200){
			$this->assign("waitSecond", 10);
			$this->error($scenario['infos']);
		}
		D('Cj')->scenario_update($admin, $params, $scenario['infos']);
	}
}
?>