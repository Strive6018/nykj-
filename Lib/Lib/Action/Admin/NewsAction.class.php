<?php
class NewsAction extends BaseAction{	
	private $id;
	// 新闻管理
  public function show(){
		$admin = array();
		$admin['g'] = 'admin';
		$admin['m'] = 'news';
		$admin['a'] = 'show';
		$admin['ids']= $_REQUEST['ids'];
		$admin['cid']= $_REQUEST['cid'];
		$admin['status'] = $_REQUEST['status'];
		$admin['stars'] = $_REQUEST['stars'];
		$admin['inputer'] = $_REQUEST['inputer'];
		$admin['tag_name'] = urldecode(trim($_REQUEST['tag_name']));
		$admin['tag_list'] = trim($_REQUEST['tag_list']);
		$admin['wd'] = urldecode(trim($_REQUEST['wd']));
		$admin['type'] = !empty($_GET['type'])?$_GET['type']:C('admin_order_type');
		$admin['order'] = !empty($_GET['order'])?$_GET['order']:'desc';
		$admin['p'] = !empty($_GET['p'])?intval($_GET['p']):1;
		$_SESSION['news_jumpurl'] = './index.php?'.http_build_query($admin);
		$this->assign('admin',$admin);
		//$admin['orders'] = 'news_'.$admin["type"].' '.$admin['order'];
		//$admin['p'] = '';
		//查询条件
		$where = array();
		if ($admin['ids']) {
			$where['news_id']= array('in',$admin['ids']);
		}
		if ($admin['cid']) {
			$where['news_cid']= array('in',ff_list_ids($admin['cid']));
		}
		if ($admin['status'] == 1) {//已审核
			$where['news_status'] = array('eq',1);
		}elseif ($admin['status'] == 2) {//未审核
			$where['news_status'] = array('eq',0);
		}elseif ($admin['status'] == 3) {//待复查
			$where['news_status'] = array('eq',-1);
		}
		if($admin['stars']){
			$where['news_stars'] = $admin['stars'];
		}
		if($admin['inputer']){
			$where['news_inputer'] = $admin['inputer'];
		}
		if ($admin['wd']) {
			$search = array();
			$search['news_name'] = array('like','%'.$admin['wd'].'%');
			$search['news_remark'] = array('like','%'.$admin['wd'].'%');
			$search['_logic'] = 'or';
			$where['_complex'] = $search;
		}
		//根据不同条件加载模型
		if($admin['tag_name']){
			$where['tag_list'] = $admin['tag_list'];
			$where['tag_name'] = $admin['tag_name'];
			$rs = D('TagnewsView');
		}else{
			$rs = D("NewsView");
		}
		//组合查询及分页信息
		$limit = 50;
		$order = 'news_'.$admin["type"].' '.$admin['order'];
		$count = $rs->where($where)->count('news_id');
		$totalpages = ceil($count/$limit);
		$currentpage = ff_page_max($admin['p'], $totalpages);
		//分页跳转参数
		$admin['p'] = 'FFLINK';
		$pageurl = './index.php?'.http_build_query($admin);
		$pages = '共'.$count.'部文章&nbsp;当前:'.$currentpage.'/'.$totalpages.'页&nbsp;'.getpage($currentpage,$totalpages,8,$pageurl,'pagego(\''.$pageurl.'\','.$totalpages.')');
		//查询数据
		$list = $rs->where($where)->limit($limit)->page($currentpage)->order($order)->select();
		foreach($list as $key=>$val){
		  $list[$key]['list_url'] = '?s=Admin-News-Show-cid-'.$list[$key]['news_cid'];
			$list[$key]['news_url'] = ff_url_news_read($list[$key]['list_id'],$list[$key]['list_dir'],$list[$key]['news_id'],$list[$key]['news_ename'],$list[$key]['news_jumpurl'],1);
			$list[$key]['news_starsarr'] = admin_star_arr($list[$key]['news_stars']);
		}
		//dump($rs->getLastSql());
		//变量赋值并输出模板
		$this->assign($admin);
		$this->assign('pages',$pages);
		$this->assign('list',$list);
	  $this->display('./Public/system/news_show.html');
  }
	// 添加编辑
  public function add(){
		$rs = D("News");
		$news_id = intval($_GET['id']);
		if($news_id){
			$where = array();
      $where['news_id'] = $news_id;
			$array = $rs->ff_find('*', $where);
			foreach($array['Tag'] as $key=>$value){
				$tag[$value['tag_list']][$key] = $value['tag_name'];
			}
			$array['news_starsarr'] = admin_star_arr($array['news_stars']);
			$array['news_type'] = implode(',',$tag['news_type']);
			$array['news_keywords'] = implode(',',$tag['news_tag']);
			$array['news_tplname'] = '编辑';
			$array['list_extend'] = json_decode($array['list_extend'],true);//转化json格式
			$_SESSION['news_jumpurl'] = $_SERVER['HTTP_REFERER'];
		}else{
		  $array['news_cid'] = cookie('news_cid');
		  $array['news_stars'] = 0;
			$array['news_inputer'] = $_SESSION['admin_name'];
			$array['news_addtime'] = time();
			$array['news_starsarr'] = admin_star_arr(1);
			$array['news_tplname'] = '添加';
			$array["list_extend"]['type'] = C('news_type');
		}
		$this->assign($array);
		$this->display('./Public/system/news_add.html');
  }
	// 新增与更新数据
	public function update(){
		$rs = D('News');
		$data = $rs->update($_POST);
		if(!$data){
			$this->error($rs->getError());
		}
		$this->id = $data['news_id'];
	}
	// 后置操作
	public function _after_update(){
		$news_id = $this->id;
		if($news_id){
			//记录最后的主分类ID
			cookie('news_cid', intval($_POST["news_cid"]) );
			//删除数据缓存
			if(C('cache_page_news')){
				S(md5('cache_page_news_'.$news_id), NULL);
			}	
			//删除静态缓存
			if(C('html_cache_on')){
				$id = md5($news_id).C('html_file_suffix');
				@unlink('./Html/News_read/'.$news_id);
			}
			//生成网页
			if(C('url_html')){
				echo'<iframe scrolling="no" src="?s=Admin-Create-new_detail_id-ids-'.$news_id.'" frameborder="0" style="display:none"></iframe>';
			}
			//跳转网页
			$this->assign("jumpUrl",$_SESSION['news_jumpurl']);
			$this->success('恭喜您，数据库、缓存、静态所有操作已完成！');
		}else{
			$this->error('数据库操作完成，附加操作不做处理！');
		}		
	}	
	// Ajax设置星级
  public function ajaxstars(){
		$where['news_id'] = $_GET['id'];
		$data['news_stars'] = intval($_GET['stars']);
		$rs = D("News");
		$rs->where($where)->save($data);		
		exit('ok');
  }
	// 设置状态
  public function status(){
		$where['news_id'] = $_GET['id'];
		$rs = D("News");
		if($_GET['value']){
			$rs->where($where)->setField('news_status',1);
		}else{
			$rs->where($where)->setField('news_status',0);
		}
		redirect($_SESSION['news_jumpurl']);
  }
	// 删除文章
  public function del(){
		$this->delfile($_GET['id']);
		redirect($_SESSION['news_jumpurl']);
  }
	// 删除文章all
  public function delall(){
		if(empty($_POST['ids'])){
			$this->error('请选择需要删除的文章！');
		}	
		$array = $_POST['ids'];
		foreach($array as $val){
			$this->delfile($val);
		}
		redirect($_SESSION['news_jumpurl']);
  }
	// 删除静态文件与图片
  public function delfile($id){
		//删除专题收录
		$rs = D("Topic");
		$where['topic_sid'] = 1;
		$where['topic_did'] = $id;
		$rs->where($where)->delete();
		unset($where);
		//删除新闻评论
		unset($where);
		$rs = D("Cm");
		$where['cm_cid'] = $id;
		$where['cm_sid'] = 2;
		$rs->where($where)->delete();			
		//删除新闻TAG
		$rs = D("Tag");
		$where['tag_id'] = $id;
		$where['tag_sid'] = 2;
		$rs->where($where)->delete();
		unset($where);
		//删除静态文件与图片
		$rs = D("News");
		$where['news_id'] = $id;
		$array = $rs->field('news_id,news_cid,news_pic,news_name')->where($where)->find();
		@unlink(ff_url_img($arr['news_pic']));
		if(C('url_html')){
			@unlink(ff_url_news_read($array['list_id'],$array['list_dir'],$array['news_id'],$array['news_ename'],$array['news_jumpurl'],1));
		}
		unset($where);				
		//删除新闻ID
		$where['news_id'] = $id;
		$rs = D("News");
		$rs->where($where)->delete();
		unset($where);
  }
	// 批量转移文章
  public function pestcid(){
		if(empty($_POST['ids'])){
			$this->error('请选择需要转移的新闻！');
		}	
		$cid = intval($_POST['pestcid']);
		if (ff_list_isson($cid)) {
			$rs = D("News");
			$data['news_cid'] = $cid;
			$where['news_id'] = array('in',$_POST['ids']);
			$rs->where($where)->save($data);
			redirect($_SESSION['news_jumpurl']);
		}else{
			$this->error('请选择当前大类下面的子分类！');		
		}
  }	
	// 批量生成数据
  public function create(){
		if($_POST['ids']){
			redirect('?s=Admin-Create-news_detail_id-ids-'.implode(',',$_POST['ids']));
		}else{
			$this->assign("jumpUrl",$_SESSION['news_jumpurl']);
			$this->error('操作错误！');
		}
  }	
	// 展开关闭筛选条件
	public function select(){
		if($_GET['id'] == 'set'){
			setcookie('news_select', 1, 0);
			echo('1');
		}else if($_GET['id'] == 'null'){
			setcookie('news_select', NULL);
			echo('0');
		}else{
			if(isset($_COOKIE['news_select'])){
				echo('1');
			}else{
				echo('0');
			}
		}
	}	
	//批量处理拼音路径
	public function ename(){
		$minid = intval($_REQUEST['minid']);
		$maxlen = ff_default($_REQUEST['maxlen'],20);
		//参数
		$params = array();
		$params['field'] = 'news_id,news_name,news_ename';
		$params['limit'] = 50; 
		$params['id_min'] = $minid;
		$params['order'] = 'news_id';
		$params['sort'] = 'asc';
		$params['cache_name'] = 'default';
		$params['cache_time'] = 0;
		$data = ff_mysql_news($params);
		if(!$data){
			$this->assign("jumpUrl","?s=Admin-Tool-Batch");
			$this->success('操作完成！');
		}
		foreach($data as $key=>$value){
			$news_id = $value['news_id'];
			$news_ename = ff_pinyin($value['news_name']);
			if(strlen($news_ename) > $maxlen){
				$news_ename = ff_pinyin($value['news_name'],true);
			}
			//唯一值处理
			$where = array();
			$where['news_id'] = array(array('lt',$news_id), array('gt',$news_id), 'and');
			$where['news_ename'] = array('eq',"".$news_ename."");
			$find = M('Vod')->field('news_id')->where($where)->find();
			if($find){
				$news_ename = $news_ename.$news_id;
			}
			//更新链接别名
			$vod = array();
			$vod['news_id'] = $news_id;
			$vod['news_ename'] = $news_ename;
			M('News')->save($vod);
			echo('<p>'.$news_id.'('.$value['news_name'].')->'.$news_ename.'</p>');
			ob_flush();flush();
		}
		F('_feifeicms/enamenews',$news_id);
		$this->redirect('Vod/Ename', array('minid'=>$news_id,'maxlen'=>$maxlen), C('collect_time'),'<p>页面跳转中~</p>');
	}			
}
?>