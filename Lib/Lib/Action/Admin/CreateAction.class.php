<?php
class CreateAction extends BaseAction{
	// 一键生成全站 视频内容页、播放页>视频分类页>文章内容页>文章分类页>首页
	//构造函数
  public function _initialize(){
	  parent::_initialize();
		C('TMPL_TEMPLATE_SUFFIX','.tpl');
		$this->assign($this->Lable_Style());
		$this->assign("waitSecond",C('url_time'));
  }
	//显示生成
  public function show(){
		$array = array();
		$array['url_html'] = 'disabled';
		$array['url_vod_list'] = 'disabled';
		$array['url_vod_detail'] = 'disabled';
		$array['url_vod_play'] = 'disabled';
		$array['url_news_list'] = 'disabled';
		$array['url_news_detail'] = 'disabled';
		if(C('url_html')){
			$array['url_html'] = '';
			if(C('url_vod_list')){
				$array['url_vod_list'] = '';
			}
			if(C('url_vod_detail')){
				$array['url_vod_detail'] = '';
			}
			if(C('url_vod_play')){
				$array['url_vod_play'] = '';
			}
			if(C('url_news_list')){
				$array['url_news_list'] = '';
			}
			if(C('url_news_detail')){
				$array['url_news_detail'] = '';
			}
		}
		//
		$params = array();
		$params['field'] = 'list_id,list_sid,list_name';
		$params['limit'] = false;
		$params['order'] = 'list_id asc,list_oid';
		$params['sort'] = 'asc';
		$infos = D("List")->ff_select_page($params,'list_status=1');
		foreach($infos as $key=>$value){
			$list[$value['list_sid']]['ids'][] = $value['list_id'];
		}
		$array['list_vod_all'] = implode(',',$list[1]['ids']);
		$array['list_news_all'] = implode(',',$list[2]['ids']);
		$this->assign($array);
		$this->assign('list', $infos);
		$this->assign('jumpurl',F('_create/next'));
    $this->display('./Public/system/html_show.html');
  }
	//判断生成条件
  public function check($html_status, $html_err, $jumpurl='?s=Admin-Create-Show'){	
		if(!C('url_html')){
			$this->assign("jumpUrl",'?s=Admin-Create-Show');
			$this->error('动态模式运行，不需要生成任何数据！');
		}
	  if (!$html_status) {
		  $this->assign("jumpUrl", $jumpurl);
		  $this->error('"'.$html_err.'"模块动态运行，不需要生成静态网页！');
		}
	}
	// 跳转
	public function jump($jumpurl,$html){
		redirect($jumpurl, C('url_time'), '<h4>'.$html.'</h4>');
	}
	// 生成入口
	public function html(){
		$ation = $_GET['action'];
		$jump = intval($_GET['jump']);
		if($ation == 'index'){
			redirect('?s=Admin-Create-index');
		}else if($ation == 'all'){
			F('_create/post', $_POST);
			redirect('?s=Admin-Create-vod_detail_cids-jump-'.$jump);
		}else if($ation == 'vod_detail_cids'){
			redirect('?s=Admin-Create-vod_detail_cids-jump-'.$jump.'-ids-'.$_POST['vod_cids']);
		}else if($ation == 'vod_detail_day'){
			redirect('?s=Admin-Create-vod_detail_day-jump-'.$jump.'-vod_day-'.$_POST['vod_day']);
		}else if($ation == 'vod_list_page'){
			redirect('?s=Admin-Create-vod_list_page-jump-'.$jump.'-ids-'.$_POST['vod_list']);
		}else if($ation == 'news_detail_cids'){
			redirect('?s=Admin-Create-news_detail_cids-jump-'.$jump.'-ids-'.$_POST['news_cids']);
		}else if($ation == 'news_detail_day'){
			redirect('?s=Admin-Create-news_detail_day-jump-'.$jump.'-news_day-'.$_POST['news_day']);
		}else if($ation == 'news_list_page'){
			redirect('?s=Admin-Create-news_list_page-jump-'.$jump.'-ids-'.$_POST['news_list']);
		}else{
			$this->assign("jumpUrl",'?s=Admin-Create-Show');
			$this->error('操作错误。');	
		}
	}
	// 生成网站首页
  public function index(){
		F('_create/post', NULL);
		F('_create/next', NULL);
	  $this->assign($this->Lable_Index());
		$this->assign("jumpUrl",'?s=Admin-Create-Show');
		$this->buildHtml("index",'./','Home:index');
		$this->success('首页生成完毕。');
  }
	//视频内容页按分类列表
	public function vod_detail_cids(){
		$jump = intval($_GET['jump']);
		$page = !empty($_GET['page']) ? intval($_GET['page']) : 1;
		$pagekey = intval($_GET['pagekey']);
		//当前需要生成的分类ID下的详情页
		$ids = $_GET['ids'];
		if(empty($ids)){
			$post = F('_create/post');
			$ids = $post['vod_cids'];
		}		
		//检测是否需要生成
		$this->check(C('url_vod_detail'),'视频内容页','?s=Admin-Create-vod_list_page-jump-'.$jump);
		//断点生成(写入缓存)
		F('_create/next','?s=Admin-Create-vod_detail_cids-jump-'.$jump.'-ids-'.$ids.'-page-'.$page);
		//参数
		$params = array();
		$params['field'] = 'vod_id';
		$params['order'] = 'vod_cid asc,vod_id';
		$params['sort'] = 'desc';
		$params['page_is'] = true;
		$params['page_id'] = 'vod_detail_cids';
		$params['page_p'] = $page;
		if(C('url_vod_play')){
			$params['limit'] = 1;
		}else{
			$params['limit'] = C('url_number');
		}		
		$where = array();
		$where['vod_status'] = array('eq',1);
		$where['vod_cid'] = array('in',$ids);
		//
		$infos = D('VodView')->ff_select_page($params, $where);
		$pages = $_GET['ff_page_'.$params['page_id']];
		echo'<h4>总共需要生成<font color=blue>'.$pages['records'].'</font>个视频内容页，需要分<font color=blue>'.$pages['totalpages'].'</font>次来执行，正在执行第<font color=red>'.$pages['currentpage'].'</font>次</h4>';
		echo'<ul style="font-size:13px;margin:0px;padding:0 0 0 20px;">';
		// 生成内容页与播放页
		foreach($infos as $key=>$value){
			$this->vod_create($value['vod_id'], $pagekey, '?s=Admin-Create-vod_detail_cids-jump-'.$jump.'-page-'.$page.'-ids-'.$ids);
		}
		echo'</ul>';
		//组合回跳URL路径与执行跳转
		if($pages['currentpage'] < $pages['totalpages']){
			$this->jump('?s=Admin-Create-vod_detail_cids-jump-'.$jump.'-ids-'.$ids.'-page-'.($page+1), '稍等一会，准备生成下一批视频内容页...');
		}else{
			if($jump){
				$this->jump('?s=Admin-Create-vod_list_page-jump-'.$jump, '稍等一会，准备生成视频分类页...');
			}else{
				$this->jump('?s=Admin-Create-vod_list_page-jump-'.$jump, '恭喜您，视频内容页全部生成完毕。');
			}
		}		
	}
	//视频分类页(防止超时需将总页数/100来分页生成)
	public function vod_list_page(){
		$jump = intval($_GET['jump']);
		$key = intval($_GET['key']);
		$page = !empty($_GET['p']) ? intval($_GET['p']) : 1;
		//检测是否需要生成
		$this->check(C('url_vod_list'), '视频分类页', '?s=Admin-Create-index');
		//断点生成(写入缓存)
		F('_create/next','?s=Admin-Create-vod_list_page-jump-'.$jump.'-key-'.$key.'-ids-'.$ids.'-p-'.$page);
		//当前需要生成的分类ID
		$ids = $_GET['ids'];
		if(empty($ids)){
			$post = F('_create/post');
			$ids = $post['vod_cids'];
		}
		$ids_array = explode(',',$ids);
		//参数
		$params = array();
		$params['id'] = intval($ids_array[$key]);
		$params['page'] = $page;
		//条件
		$where = array();
		$where['list_status'] = array('eq', 1);
		$where['list_id'] = array('eq', $params['id']);
		$info = D('List')->ff_find('*', $where, 'cache_page_list_'.$params['id']);
		if($info){
			echo'<h4>视频模块分类页需静态化任务的ID（'.$ids.'） 正在第'.$page.'次执行分类ID：<font color="blue">'.$params['id'].'</font>的静态化任务</h4>';
			echo'<ul style="font-size:13px;margin:0px;padding:0 0 0 20px;">';
			for($i=1; $i<51; $i++){
				$pagetpl = ($page-1)*50+$i;
				$path = ff_url_build('vod/show', array('list_dir'=>$info['list_dir'], 'id'=>$info['list_id'], 'p'=>$pagetpl) );
				$params['page'] = $pagetpl;
				$channel = $this->Lable_Vod_List($params, $info);
				$this->assign($channel);
				$this->buildHtml($path, './', $channel['list_skin']);
				echo '<li><a href="'.$path.C('html_file_suffix').'" target="_blank">'.$path.C('html_file_suffix').'</a> OK</li>';
				//获取总记录数与总页数及每页数 并检查是否需要跳出循环
				if($i == 1){
					$get = end($_GET);
				}
				if($pagetpl >= $get['totalpages']){
					echo '<li style="color:#ff0000">视频模块分类ID为（'.$params['id'].'）的栏目分页静态化任务完成</li>';
					break;
				}
				ob_flush();flush();
			}
			echo'</ul>';
			//计算总页码需要分多少次生成
			$total = ceil($get['totalpages']/50);
			if($page < $total){
				$this->jump('?s=Admin-Create-vod_list_page-jump-'.$jump.'-key-'.$key.'-ids-'.$ids.'-p-'.($page+1), '稍等一会，当前分类需要继续分页执行...');
			}
		}
		//是否生成下一个分类
		if(($key+1) < count($ids_array)){
			$this->jump('?s=Admin-Create-vod_list_page-jump-'.$jump.'-key-'.($key+1).'-ids-'.$ids, '稍等一会，准备生成下一个分类...');
		}else{
			if($jump){
				$this->jump('?s=Admin-Create-news_detail_cids-jump-'.$jump, '稍等一会，准备生成文章内容页...');
			}else{
				F('_create/next',NULL);
				$this->jump('?s=Admin-Create-show', '恭喜您，分类页全部生成完毕。');
			}
		}
	}	
	//视频内容页按时间列表
	public function vod_detail_day(){
		$day = intval($_REQUEST['vod_day']);
		$page = !empty($_GET['page']) ? intval($_GET['page']) : 1;
		$pagekey = intval($_GET['pagekey']);
		$this->check(C('url_vod_detail'),'视频内容页','?s=Admin-Create-Show');
		F('_create/next','?s=Admin-Create-vod_detail_day-vod_day-'.$day.'-page-'.$page);
		//查询数据开始
		$params = array();
		$params['field'] = 'vod_id';
		$params['order'] = 'vod_addtime';
		$params['sort'] = 'desc';
		$params['page_is'] = true;
		$params['page_id'] = 'vod_detail_day';
		$params['page_p'] = $page;
		if(C('url_vod_play')){
			$params['limit'] = 1;
		}else{
			$params['limit'] = C('url_number');
		}				
		$where = array();
		$where['vod_status'] = array('eq',1);
		$where['vod_addtime'] = array('gt',ff_linux_time($day));
		//
		$infos = D('VodView')->ff_select_page($params, $where);
		$pages = $_GET['ff_page_'.$params['page_id']];
		echo'<h4>总共需要生成<font color=blue>'.$pages['records'].'</font>个视频内容页，需要分<font color=blue>'.$pages['totalpages'].'</font>次来执行，正在执行第<font color=red>'.$pages['currentpage'].'</font>次</h4>';
		echo'<ul style="font-size:13px;margin:0px;padding:0 0 0 20px;">';
		// 生成内容页与播放页
		foreach($infos as $key=>$value){
			$this->vod_create($value['vod_id'], $pagekey, '?s=Admin-Create-vod_detail_day-page-'.$page.'-vod_day-'.$day);
		}
		echo'</ul>';
		if($pages['currentpage'] < $pages['totalpages']){
			$this->jump('?s=Admin-Create-vod_detail_day-vod_day-'.$day.'-page-'.($page+1), '稍等一会，准备生成下一批视频内容页...');
		}else{
			F('_create/next',NULL);
			$this->jump('?s=Admin-Create-Show', '恭喜您，视频内容页全部生成完毕。');
		}
	}
	//视频内容页按ID列表
	public function vod_detail_id(){
		$ids = trim($_REQUEST["ids"]);
		$page = !empty($_GET['page']) ? intval($_GET['page']) : 1;
		$pagekey = intval($_GET['pagekey']);//播放页面太多按分页生成
		//查询数据开始
		$params = array();
		$params['field'] = 'vod_id';
		$params['limit'] = 1;
		$params['order'] = 'vod_id';
		$params['sort'] = 'desc';
		$params['page_is'] = true;
		$params['page_id'] = 'vod_detail_id';
		$params['page_p'] = $page;
		$where = array();
		$where['vod_status'] = array('eq',1);
		$where['vod_id'] = array('in',$ids);
		$infos = D('VodView')->ff_select_page($params, $where);
		$pages = $_GET['ff_page_'.$params['page_id']];
		//生成内容页与播放页
		foreach($infos as $key=>$value){
			$this->vod_create($value['vod_id'], $pagekey, '?s=Admin-Create-vod_detail_id-page-'.$page.'-ids-'.$ids);
		}
		//检查整个任务是否完成
		if($pages['currentpage'] < $pages['totalpages']){
			$this->jump('?s=Admin-Create-vod_detail_id-ids-'.$ids.'-page-'.($page+1), '稍等一会，准备生成下一个视频...');
		}else{
			echo '<li style="color:#ff0000">所有视频内容页静态化完成。</li>';
			echo "<script type='text/javascript'>window.setTimeout(function(){parent.ff_dialog_close();},2000);</script>";
		}
	}
	//生成视频内容页与播放页
  public function vod_create($id, $pagekey, $jump){
		//参数
		$params = array();
		$params['id'] = intval($id);
		//条件
		$where = array();
		$where['vod_status'] = array('eq', 1);
		$where['vod_id'] = array('eq', $params['id']);
		//查库
		$data = D('Vod')->ff_find('*', $where, 'cache_page_vod_'.$params['id'], true);
		if($data){
			$info = $this->Lable_Vod_Read($data);
			if($pagekey == 0){
				$path = ff_url_build('vod/read', array('list_id'=>$info['list_id'],'list_dir'=>$info['list_dir'],'pinyin'=>$info['vod_ename'],'id'=>$info['vod_id']));
				$this->assign($info);
				$this->buildHtml($path, './', $info['vod_skin_detail']);
				echo '<li>'.$info['vod_id'].' 内容页 <a href="'.$path.C('html_file_suffix').'" target="_blank">'.$path.C('html_file_suffix').'</a></li>';
				ob_flush();flush();
			}
			//是否生成播放页
			if(C('url_vod_play')){
				$this->play_create_page($info, $pagekey, $jump);
			}
			return $info;
		}
  }
	//生成播放页
	public function play_create($data, $array_play){
		$info = $this->Lable_Vod_Play($data, $array_play);
		$path = ff_url_build('vod/play', array('list_id'=>$info['list_id'],'list_dir'=>$info['list_dir'],'pinyin'=>$info['vod_ename'],'id'=>$info['vod_id'],'sid'=>$array_play['sid'],'pid'=>$array_play['pid']));
		$this->assign($info);
		$this->buildHtml($path, './', $info['vod_skin_play']);
		echo '<li style="color:#666">'.$info['vod_id'].' 播放页 <a href="'.$path.C('html_file_suffix').'" target="_blank" style="color:#666">'.$path.C('html_file_suffix').'</a></li>';
		ob_flush();flush();
	}
	//播放页集数太多易超时，故一页生成一个影片且播放页按页生成
	public function play_create_page($infotpl, $pagekey, $jump){
		$urls = array();
		foreach($infotpl["vod_play_list"] as $key=>$value){
			foreach($value['son'] as $pid=>$value2){
				array_push($urls, array('id'=>$infotpl['vod_id'], 'sid'=>$value['player_sid'], 'pid'=>$pid+1));
			}
		}
		//循环生成播放页
		$urls_count = count($urls);
		for($i=0; $i<50; $i++){
			$this->play_create($infotpl, $urls[$pagekey]);
			$pagekey++;
			if($pagekey >= $urls_count){
				break;//dump('这个影片的多组播放地址生成完了，准备生成下一个');
			}
			if($i == 49){
				$jumpurl = $jump.'-pagekey-'.$pagekey;
			}
		}
		//跳转
		if($jumpurl){
			$this->jump($jumpurl, '稍等一会，准备生成下一批播放页...');
		}
	}	
	//文章内容页分类列表
	public function news_detail_cids(){
		$jump = intval($_GET['jump']);
		$page = !empty($_GET['page']) ? intval($_GET['page']) : 1;
		//当前需要生成的分类ID下的详情页
		$ids = $_GET['ids'];
		if(empty($ids)){
			$post = F('_create/post');
			$ids = $post['news_cids'];
		}
		//检测是否需要生成
		$this->check(C('url_news_detail'),'文章内容页','?s=Admin-Create-news_list_page-jump-'.$jump);
		//断点生成(写入缓存)
		F('_create/next','?s=Admin-Create-news_detail_cids-jump-'.$jump.'-ids-'.$ids.'-page-'.$page);
		//查询数据开始
		$params = array();
		$params['field'] = 'news_id';
		$params['limit'] = C('url_number');
		$params['order'] = 'news_cid asc,news_id';
		$params['sort'] = 'desc';
		$params['page_is'] = true;
		$params['page_id'] = 'news_detail_cids';
		$params['page_p'] = $page;
		$where = array();
		$where['news_status'] = array('eq',1);
		$where['news_cid'] = array('in',$ids);
		//
		$infos = D('NewsView')->ff_select_page($params, $where);
		$pages = $_GET['ff_page_'.$params['page_id']];
		echo'<h4>总共需要生成<font color=blue>'.$pages['records'].'</font>个文章内容页，需要分<font color=blue>'.$pages['totalpages'].'</font>次来执行，正在执行第<font color=red>'.$pages['currentpage'].'</font>次</h4>';
		echo'<ul style="font-size:14px;margin:0px;padding:0px;">';
		foreach($infos as $key=>$value){
			$this->news_create($value['news_id']);
			ob_flush();flush();
		}
		echo'</ul>';
		//组合回跳URL路径与执行跳转
		if($pages['currentpage'] < $pages['totalpages']){
			$this->jump('?s=Admin-Create-news_detail_cids-jump-'.$jump.'-page-'.($page+1), '稍等一会，准备生成下一批文章内容页...');
		}else{
			if($jump){
				$this->jump('?s=Admin-Create-news_list_page-jump-'.$jump, '稍等一会，准备生成文章分类页...');
			}else{
				F('_create/next',NULL);
				$this->jump('?s=Admin-Create-Show', '恭喜您，文章内容页全部生成完毕。');
			}
		}		
	}
	//文章分类页
	public function news_list_page(){
		$jump = intval($_GET['jump']);
		$key = intval($_GET['key']);
		$page = !empty($_GET['p']) ? intval($_GET['p']) : 1;
		//检测是否需要生成
		$this->check(C('url_news_list'), '文章分类页', '?s=Admin-Create-index');
		//断点生成(写入缓存)
		F('_create/next','?s=Admin-Create-news_list_page-jump-'.$jump.'-key-'.$key.'-ids-'.$ids.'-p-'.$page);
		//当前需要生成的分类ID
		$ids = $_GET['ids'];
		if(empty($ids)){
			$post = F('_create/post');
			$ids = $post['news_cids'];
		}
		$ids_array = explode(',',$ids);
		//参数
		$params = array();
		$params['id'] = intval($ids_array[$key]);
		$params['page'] = $page;
		//条件
		$where = array();
		$where['list_status'] = array('eq', 1);
		$where['list_id'] = array('eq', $params['id']);
		$info = D('List')->ff_find('*', $where, 'cache_page_list_'.$params['id']);
		if($info){
			echo'<h4>文章模块分类页需静态化任务的ID（'.$ids.'） 正在第'.$page.'次执行分类ID：<font color="blue">'.$params['id'].'</font>的静态化任务</h4>';
			echo'<ul style="font-size:13px;margin:0px;padding:0 0 0 20px;">';
			for($i=1; $i<51; $i++){
				$pagetpl = ($page-1)*50+$i;
				$path = ff_url_build('news/show', array('list_dir'=>$info['list_dir'], 'id'=>$info['list_id'], 'p'=>$pagetpl) );
				$params['page'] = $pagetpl;
				$channel = $this->Lable_Vod_List($params, $info);
				$this->assign($channel);
				$this->buildHtml($path, './', $channel['list_skin']);
				echo '<li><a href="'.$path.C('html_file_suffix').'" target="_blank">'.$path.C('html_file_suffix').'</a> OK</li>';
				//获取总记录数与总页数及每页数 并检查是否需要跳出循环
				if($i == 1){
					$get = end($_GET);
				}
				if($pagetpl >= $get['totalpages']){
					echo '<li style="color:#ff0000">文章模块分类ID为（'.$params['id'].'）的栏目分页静态化任务完成</li>';
					break;
				}
				ob_flush();flush();
			}
			echo'</ul>';
			//计算总页码需要分多少次生成
			$total = ceil($get['totalpages']/50);
			if($page < $total){
				$this->jump('?s=Admin-Create-news_list_page-jump-'.$jump.'-key-'.$key.'-ids-'.$ids.'-p-'.($page+1), '稍等一会，当前分类需要继续分页执行...');
			}
		}
		//是否生成下一个分类
		if(($key+1) < count($ids_array)){
			$this->jump('?s=Admin-Create-news_list_page-jump-'.$jump.'-key-'.($key+1).'-ids-'.$ids, '稍等一会，准备生成下一个分类...');
		}else{
			if($jump){
				$this->jump('?s=Admin-Create-index', '稍等一会，准备生成网站首页...');
			}else{
				F('_create/next',NULL);
				$this->jump('?s=Admin-Create-show', '恭喜您，分类页全部生成完毕。');
			}
		}
	}	
	//文章内容页按时间
	public function news_detail_day(){
		$day = intval($_REQUEST['news_day']);
		$page = !empty($_GET['page']) ? intval($_GET['page']) : 1;
		$this->check(C('url_news_detail'),'文章内容页','?s=Admin-Create-Show');
		F('_create/next','?s=Admin-Create-news_detail_day-news_day-'.$day.'-page-'.$page);
		//查询数据开始
		$params = array();
		$params['field'] = 'news_id';
		$params['limit'] = C('url_number');
		$params['order'] = 'news_addtime';
		$params['sort'] = 'desc';
		$params['page_is'] = true;
		$params['page_id'] = 'news_detail_day';
		$params['page_p'] = $page;
		$where = array();
		$where['news_status'] = array('eq',1);
		$where['news_addtime'] = array('gt',ff_linux_time($day));
		//
		$infos = D('NewsView')->ff_select_page($params, $where);
		$pages = $_GET['ff_page_'.$params['page_id']];
		echo'<h4>总共需要生成<font color=blue>'.$pages['records'].'</font>个文章内容页，需要分<font color=blue>'.$pages['totalpages'].'</font>次来执行，正在执行第<font color=red>'.$pages['currentpage'].'</font>次</h4>';
		echo'<ul style="font-size:14px;margin:0px;padding:0px;">';
		foreach($infos as $key=>$value){
			$this->news_create($value['news_id']);
		}
		echo'</ul>';
		if($pages['currentpage'] < $pages['totalpages']){
			$this->jump('?s=Admin-Create-news_detail_day-news_day-'.$day.'-page-'.($page+1), '稍等一会，准备生成下一批文章内容页...');
		}else{
			F('_create/next',NULL);
			$this->jump('?s=Admin-Create-Show', '恭喜您，文章内容页全部生成完毕。');
		}
	}
	//文章内容页按ID列表
	public function news_detail_id(){
		$ids = trim($_REQUEST["ids"]);
		//查询数据开始
		$params = array();
		$params['field'] = 'news_id';
		$params['limit'] = false;
		$params['order'] = 'news_id';
		$params['sort'] = 'desc';
		$where = array();
		$where['news_status'] = array('eq',1);
		$where['news_id'] = array('in',$ids);
		$infos = D('NewsView')->ff_select_page($params, $where);
		foreach($infos as $key=>$value){
			$this->news_create($value['news_id']);
		}
	}
	//生成文章内容页
  public function news_create($id){
		//参数
		$params = array();
		$params['id'] = intval($id);
		$params['page'] = !empty($_GET['p']) ? intval($_GET['p']) : 1;
		//条件
		$where = array();
		$where['news_status'] = array('eq', 1);
		$where['news_id'] = array('eq', $params['id']);
		//查库
		$data = D('News')->ff_find('*', $where, 'cache_page_news_'.$params['id'], true);
		if($data){
			$info = $this->Lable_News_Read($params, $data);
			$array = array();
			//判断是否有多页并加载标签解析
			for($i=1; $i<=$info['news_page_count']; $i++){
				$array[$i]['path'] = ff_url_build('news/read', array('list_id'=>$info['list_id'],'list_dir'=>$info['list_dir'],'pinyin'=>$info['news_ename'],'id'=>$info['news_id'],'p'=>$i));
				if($i > 1){
					$array[$i]['info'] = $this->Lable_News_Read(array('page'=>$i), $data);
				}else{
					$array[$i]['info'] = $info;
				}
			}
			//每一页生成开始
			foreach($array as $key=>$value){
				$this->assign($value['info']);
				$this->buildHtml($value['path'], './', $value['info']['news_skin_detail']);
				echo '<li>'.$value['info']['news_id'].' <a href="'.$value['path'].C('html_file_suffix').'" target="_blank">'.$value['path'].C('html_file_suffix').'</a> 生成完毕</li>';
				ob_flush();flush();
			}
		}
  }	
}
?>