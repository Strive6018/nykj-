<?php
class VodAction extends BaseAction{
	private $id;
	// 影片列表
  public function show(){
		$admin = array();
		$admin['g'] = 'admin';
		$admin['m'] = 'vod';
		$admin['a'] = 'show';
		$admin['ids']= $_REQUEST['ids'];
		$admin['cid']= $_REQUEST['cid'];
		$admin['isend'] = $_REQUEST['isend'];
		$admin['status'] = $_REQUEST['status'];
		$admin['ispay'] = $_REQUEST['ispay'];
		$admin['price'] = $_REQUEST['price'];
		$admin['trysee'] = $_REQUEST['trysee'];
		$admin['stars'] = $_REQUEST['stars'];
		$admin['state'] = $_REQUEST['state'];
		$admin['series'] = $_REQUEST['series'];
		$admin['version'] = $_REQUEST['version'];
		$admin['area'] = $_REQUEST['area'];
		$admin['weekday'] = $_REQUEST['weekday'];
		$admin['player'] = $_REQUEST['player'];
		$admin['url'] = $_REQUEST['url'];
		$admin['scenario'] = $_REQUEST['scenario'];
		$admin['inputer'] = $_REQUEST['inputer'];
		$admin['like_length'] = $_REQUEST['like_length'];//3.9同名参数 空|0|2
		$admin['tag_name'] = urldecode(trim($_REQUEST['tag_name']));
		$admin['tag_list'] = trim($_REQUEST['tag_list']);
		$admin['wd'] = urldecode(trim($_REQUEST['wd']));
		$admin['type'] = !empty($_GET['type'])?$_GET['type']:C('admin_order_type');
		$admin['order'] = !empty($_GET['order'])?$_GET['order']:'desc';
		$admin['p'] = !empty($_GET['p'])?intval($_GET['p']):1;
		$_SESSION['vod_jumpurl'] = './index.php?'.http_build_query($admin);
		$this->assign('admin',$admin);
		//查询条件
		$where = array();
		if ($admin['ids']) {
			$where['vod_id']= array('in',$admin['ids']);
		}
		if ($admin['cid']) {
			$where['vod_cid']= array('in',ff_list_ids($admin['cid']));
		}
		if($admin["isend"] == 1){//连载中
			$where['vod_isend'] = 0;
		}else if($admin["isend"] == 2){//已完结
			$where['vod_isend'] = 1;
		}
		if ($admin['status'] == 1) {//已审核
			$where['vod_status'] = array('eq',1);
		}elseif ($admin['status'] == 2) {//未审核
			$where['vod_status'] = array('eq',0);
		}elseif ($admin['status'] == 3) {//待复查
			$where['vod_status'] = array('eq',-1);
		}		
		if($admin['ispay'] == 1){
			$where['vod_ispay'] = array('eq',1);
		}
		if($admin['price'] == 1){
			$where['vod_price'] = array('gt',0);
		}	
		if($admin['trysee'] == 1){
			$where['vod_trysee'] = array('gt',0);
		}	
		if($admin['stars']){
			$where['vod_stars'] = $admin['stars'];
		}		
		if($admin['inputer']){
			$where['vod_inputer'] = $admin['inputer'];
		}
		if($admin['state']){
			$where['vod_state'] = array('eq',urldecode($admin["state"]));
		}	
		if($admin['version']){
			$where['vod_version'] = array('eq',urldecode($admin["version"]));
		}
		if($admin['area']){
			$where['vod_area'] = array('like','%'.urldecode($admin["area"]).'%');
		}
		if($admin['weekday']){
			$where['vod_weekday'] = array('like','%'.urldecode($admin["weekday"]).'%');
		}
		if($admin['url']){
			$where['vod_url'] = array('eq','');
		}
		if($admin['scenario']){
			$where['vod_scenario'] = array('neq','');
		}
		if($admin['series']){
			$where['vod_series'] = array('neq','');
		}
		if($admin['player']){
			$where['vod_play'] = array('like','%'.trim($admin['player']).'%');
		}
		if ($admin['wd']) {
			$search['vod_name'] = array('like','%'.$admin['wd'].'%');
			$search['vod_title'] = array('like','%'.$admin['wd'].'%');
			$search['vod_actor'] = array('like','%'.$admin['wd'].'%');
			$search['vod_director'] = array('like','%'.$admin['wd'].'%');
			$search['_logic'] = 'or';
			$where['_complex'] = $search;
		}
		//是否为同名检测操作
		if ( isset($admin['like_length']) ) {
			//重置查询条件与排序方式
			$where = array();
			$where['vod_status'] = array('gt',0);
			if ($admin['cid']) {
				$where['vod_cid'] = array('eq',$admin['cid']);
			}
			//先查出重名数据交组装
			if($admin['like_length'] > 0 ){
				$list = D('Vod')->field('left(vod_name, '.$admin['like_length'].') as vod_name,count(*) as count')->where($where)->group('left(vod_name, '.$admin['like_length'].')')->having('count(*)>1')->order('count desc')->select();
			}else{
				$list = D('Vod')->field('vod_name,count(*) as count')->where($where)->group('vod_name')->having('count(*)>1')->order('count desc')->select();
			}
			if(!$list){
				$this->success('恭喜您，无重名数据！');
				exit();
			}
			foreach($list as $key=>$value){
				if($admin['like_length'] > 0 ){
					$where['vod_name'][] = array('like', $value["vod_name"].'%');
				}else{
					$where['vod_name'][] = array('eq', "".$value["vod_name"]."");
				}
			}
			$where['vod_name'][] = 'or';
			$admin['type'] = 'name';
		}
		//根据不同条件加载模型
		if($admin['tag_name']){
			$where['tag_list'] = $admin['tag_list'];
			$where['tag_name'] = $admin['tag_name'];
			$rs = D('TagvodView');
		}else{
			$rs = D('VodView');
		}
		//组合查询及分页信息
		$limit = 50;
		$order = 'vod_'.$admin["type"].' '.$admin['order'];
		$count = $rs->where($where)->count('vod_id');
		$totalpages = ceil($count/$limit);
		$currentpage = ff_page_max($admin['p'], $totalpages);
		//分页跳转参数
		$admin['p'] = 'FFLINK';
		$pageurl = './index.php?'.http_build_query($admin);
		$pages = '共'.$count.'部影片&nbsp;当前:'.$currentpage.'/'.$totalpages.'页&nbsp;'.getpage($currentpage,$totalpages,8,$pageurl,'pagego(\''.$pageurl.'\','.$totalpages.')');
		//查询数据
		$list = $rs->where($where)->limit($limit)->page($currentpage)->order($order)->select();
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
	// 添加编辑影片
  public function add(){
		$vod_id = intval($_GET['id']);
		if($vod_id){
			$where = array();
      $where['vod_id'] = $vod_id;
			$array = D('Vod')->ff_find('*', $where);
			foreach($array['Tag'] as $key=>$value){
				$tag[$value['tag_list']][$key] = $value['tag_name'];
			}
			$array['vod_type'] = implode(',',$tag['vod_type']);
			$array['vod_keywords'] = implode(',',$tag['vod_tag']);
			$array['vod_tplname'] = '编辑';
			$array['vod_starsarr'] = admin_star_arr($array['vod_stars']);
			$_SESSION['vod_jumpurl'] = $_SERVER['HTTP_REFERER'];
		}else{
		  $array['vod_cid'] = cookie('vod_cid');
		  $array['vod_stars'] = 1;
		  $array['vod_status'] = 1;
			$array['vod_hits'] = 0;
			$array['vod_addtime'] = time();
			$array['vod_continu'] = 0;
			$array['vod_inputer'] = $_SESSION['admin_name'];
			$array['vod_starsarr'] = admin_star_arr(1);
			$array['vod_tplname'] = '添加';
			//默认配置
			$array["list_extend"]['type'] = C('play_type');
			$array["list_extend"]['area'] = C('play_area');
			$array["list_extend"]['year'] = C('play_year');
			$array["list_extend"]['state'] = C('play_state');
			$array["list_extend"]['language'] = C('play_language');
			$array["list_extend"]['version'] = C('play_version');
		}
		//模板相关赋值
		$this->assign($array);
		$this->assign("jumpUrl",$_SESSION['vod_jumpurl']);
		$this->display('./Public/system/vod_add.html');
  }
	//新增与编辑前置操作
  public function _before_update(){
		// 完结
		if($_POST["vod_continu"]){
			$_POST["vod_isend"] = 0;
		}else{
			$_POST["vod_isend"] = 1;
		}
		//播放器组与地址组
		$play = $_POST["vod_play"];
		$server = $_POST["vod_server"];
		foreach($_POST["vod_url"] as $key=>$val){
			$val = trim($val);
			if($val){
			  $vod_play[] = $play[$key];
				$vod_server[] = $server[$key];
				$vod_url[] = $val;
			};
		}
		$_POST["vod_play"] = strval(implode('$$$',$vod_play));
		$_POST["vod_server"] = strval(implode('$$$',$vod_server));
		$_POST["vod_url"] = strval(implode('$$$',$vod_url));
	}
	//新增与更新数据
	public function update(){
		$rs = D('Vod');
		$data = $rs->update($_POST);
		if(!$data){
			$this->error($rs->getError());
		}
		$this->id = $data['vod_id'];
	}
	// 后置操作
	public function _after_update(){
		$vod_id = $this->id;
		if($vod_id){
			//记录最后的主分类ID
			cookie('vod_cid', intval($_POST["vod_cid"]));
			//删除数据缓存
			if(C('cache_page_vod')){
				S(md5('cache_page_vod_'.$vod_id),NULL);
			}
			//删除静态缓存
			if(C('html_cache_on')){
				$id = md5($vod_id).C('html_file_suffix');
				@unlink('./Html/Vod_read/'.$vod_id);
				@unlink('./Html/Vod_play/'.$vod_id);
			}
			//生成网页
			if(C('url_html')){
				echo'<iframe scrolling="no" src="?s=Admin-Create-vod_detail_id-ids-'.$vod_id.'" frameborder="0" style="display:none"></iframe>';
			}
			//最后跳转
			$this->assign("jumpUrl",$_SESSION['vod_jumpurl']);
			$this->success('恭喜您，数据库、缓存、静态所有操作已完成！');
		}else{
			$this->error('数据库操作完成，附加操作不做处理！');
		}		
	}
	// 删除影片
  public function del(){
		$this->delfile($_GET['id']);
		redirect($_SESSION['vod_jumpurl']);
  }
	// 删除影片all
  public function delall(){
		if(empty($_POST['ids'])){
			$this->error('请选择需要删除的影片！');
		}	
		$array = $_POST['ids'];
		foreach($array as $val){
			$this->delfile($val);
		}
		redirect($_SESSION['vod_jumpurl']);
  }
	// 删除静态文件与图片
  public function delfile($id){
		$where = array();
		//删除影片观看记录
		//$rs = D("View");
		//$where['did'] = $id;
		//$rs->where($where)->delete();
		//删除专题收录
		$rs = D("Topic");
		$where['topic_sid'] = 1;
		$where['topic_did'] = $id;
		$rs->where($where)->delete();
		unset($where);					
		//删除影片评论
		$rs = D("Cm");
		$where['cm_cid'] = $id;
		$where['cm_sid'] = 1;
		$rs->where($where)->delete();
		unset($where);	
		//删除影片TAG
		$rs = D("Tag");
		$where['tag_id'] = $id;
		$where['tag_sid'] = 1;
		$rs->where($where)->delete();
		unset($where);
		//删除静态文件与图片
		$rs = D('Vod');
		$where['vod_id'] = $id;
		$array = $rs->field('vod_id,vod_cid,vod_pic,vod_name')->where($where)->find();
		@unlink(ff_url_img($arr['vod_pic']));
		if(C('url_html')){
			@unlink(ff_url_vod_read($array['list_id'],$array['list_dir'],$array['vod_id'],$array['vod_ename'],$array['vod_jumpurl']));
		}
		unset($where);
		//删除影片ID
		$where['vod_id'] = $id;
		$rs->where($where)->delete();
		unset($where);
  }
	// 批量生成数据
  public function create(){
		if($_POST['ids']){
			redirect('?s=Admin-Create-vod_detail_id-ids-'.implode(',',$_POST['ids']));
		}else{
			$this->assign("jumpUrl",$_SESSION['vod_jumpurl']);
			$this->error('操作错误！');
		}
  }	
	// 批量转移影片
  public function pestcid(){
		if(empty($_POST['ids'])){
			$this->error('请选择需要转移的影片！');
		}	
		$cid = intval($_POST['pestcid']);
		if (ff_list_isson($cid)) {
			$rs = D('Vod');
			$data['vod_cid'] = $cid;
			$where['vod_id'] = array('in',$_POST['ids']);
			$rs->where($where)->save($data);
			redirect($_SESSION['vod_jumpurl']);
		}else{
			$this->error('请选择当前大类下面的子分类！');		
		}
  }
	// 批量设置系列
  public function series(){
		if(empty($_POST['ids'])){
			$this->error('请选择需要操作的影片！');
		}
		$cid = trim($_POST['vod_series']);
		$where['vod_id'] = array('in',$_POST['ids']);
		D('Vod')->where($where)->save( array('vod_series'=>$_POST['vod_series']) );
		redirect($_SESSION['vod_jumpurl']);
  }	
	// 设置状态
  public function status(){
		$where = array();
		if(is_array($_REQUEST['ids'])){
			$where['vod_id'] = array('in',implode(',', $_REQUEST['ids']));
		}else{
			$where['vod_id'] = array('eq', $_REQUEST['id']);
		}
		D('Vod')->where( $where )->setField('vod_status', intval($_REQUEST['value']));
		$this->success('状态修改完成！');
		//redirect($_SESSION['vod_jumpurl']);
  }	
	// Ajax设置星级
  public function ajaxstars(){
		$where['vod_id'] = $_GET['id'];
		$data['vod_stars'] = intval($_GET['stars']);
		D('Vod')->where($where)->save($data);		
		echo('ok');
  }	
	// Ajax设置连载
  public function ajaxcontinu(){
		$where['vod_id'] = $_GET['id'];
		$data['vod_continu'] = trim($_GET['continu']);
		D('Vod')->where($where)->save($data);		
		echo('ok');
  }	
	// 锁定采集更新
	public function inputer(){
		$data = array();
		$data['vod_id'] = intval($_GET['id']);
		$data['vod_inputer'] = $_GET['value'];
		D('Vod')->save($data);
		redirect($_SESSION['vod_jumpurl']);
	}
	// 展开关闭筛选条件
	public function select(){
		if($_GET['id'] == 'set'){
			setcookie('vod_select', 1, 0);
			echo('1');
		}else if($_GET['id'] == 'null'){
			setcookie('vod_select', NULL);
			echo('0');
		}else{
			if(isset($_COOKIE['vod_select'])){
				echo('1');
			}else{
				echo('0');
			}
		}
	}
	//批量删除播放地址
	public function delplay(){
		$player = $_REQUEST['player'];
		if(!$player){
			$this->error('请选择需要删除的播放器！');
		}
		//参数
		$params = array();
		$params['field'] = 'vod_id,vod_play,vod_server,vod_url';
		$params['limit'] = 50; 
		$params['play'] = $player;
		$params['order'] = 'vod_id';
		$params['sort'] = 'asc';
		$params['page_is'] = true;
		$params['page_id'] = 'vod';
		$params['page_p'] = !empty($_GET['p'])?intval($_GET['p']):1;
		$params['cache_name'] = 'default';
		$params['cache_time'] = 0;
		$data = ff_mysql_vod($params);
		if(!$data){
			$this->assign("jumpUrl","?s=Admin-Tool-Batch");
			$this->success('所有（'.$player.'）播放地址已清理完成！');
		}
		foreach($data as $key=>$value){
			$array_play = explode('$$$',$value['vod_play']);
			$array_server = explode('$$$',$value['vod_server']);
			$array_url = explode('$$$',$value['vod_url']);
			$search_key = array_search($player, $array_play);
			unset($array_play[$search_key]);
			unset($array_server[$search_key]);
			unset($array_url[$search_key]);
			$vod = array();
			$vod['vod_id'] = $value['vod_id'];
			$vod['vod_play'] = strval(implode('$$$',$array_play));
			$vod['vod_server'] = strval(implode('$$$',$array_server));
			$vod['vod_url'] = strval(implode('$$$',$array_url));
			$vod['vod_addtime'] = time();
			M('Vod')->save($vod);
			echo('<p>'.$vod['vod_id'].'含有('.$player.')的播放地址已被清除。</p>');
			ob_flush();flush();
		}
		$this->redirect('Vod/Delplay', array('player'=>$player), C('collect_time'),'页面跳转中~');
	}
	//批量处理拼音路径
	public function ename(){
		$minid = intval($_REQUEST['minid']);
		$maxlen = ff_default($_REQUEST['maxlen'],20);
		//参数
		$params = array();
		$params['field'] = 'vod_id,vod_name,vod_ename';
		$params['limit'] = 50; 
		$params['id_min'] = $minid;
		$params['order'] = 'vod_id';
		$params['sort'] = 'asc';
		$params['cache_name'] = 'default';
		$params['cache_time'] = 0;
		$data = ff_mysql_vod($params);
		if(!$data){
			$this->assign("jumpUrl","?s=Admin-Tool-Batch");
			$this->success('操作完成！');
		}
		foreach($data as $key=>$value){
			$vod_id = $value['vod_id'];
			$vod_ename = ff_pinyin($value['vod_name']);
			if(strlen($vod_ename) > $maxlen){
				$vod_ename = ff_pinyin($value['vod_name'],true);
			}
			//唯一值处理
			$where = array();
			$where['vod_id'] = array(array('lt',$vod_id), array('gt',$vod_id), 'and');
			$where['vod_ename'] = array('eq',"".$vod_ename."");
			$find = M('Vod')->field('vod_id')->where($where)->find();
			if($find){
				$vod_ename = $vod_ename.$vod_id;
			}
			//更新链接别名
			$vod = array();
			$vod['vod_id'] = $vod_id;
			$vod['vod_ename'] = $vod_ename;
			M('Vod')->save($vod);
			echo('<p>'.$vod_id.'('.$value['vod_name'].')->'.$vod_ename.'</p>');
			ob_flush();flush();
		}
		F('_feifeicms/enamevod',$vod_id);
		$this->redirect('Vod/Ename', array('minid'=>$vod_id,'maxlen'=>$maxlen), C('collect_time'),'<p>页面跳转中~</p>');
	}
}
?>