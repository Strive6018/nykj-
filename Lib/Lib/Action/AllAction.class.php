<?php

/*项目入口根模块*/
class AllAction extends Action{
	  // 构造函数
	  public function _initialize(){
			header("Content-Type:text/html; charset=utf-8");
	  }
	// 标签话题
	public function Lable_Tags($params, $module = 'vod'){
		$params = ff_param_url();
		foreach($params as $key=>$value){
			if(in_array($key, array('name','id','type','tag','cid','ename','page','ajax')) ){
				$array['tag_'.$key] = $value;
			}
		}
		$array['tag_module'] = $module;
		$array['tag_skin'] = 'tags';
		if($params['ajax']){
			$array['tag_skin'] .= '_ajax';
		}
		$array['tag_skin'] = ucfirst($module).":".$array['tag_skin'];
		$array['site_sid'] = 4;
		return $array;
	}
	// 影视多分类筛选变量定义
	public function Lable_Vod_Type($params, $array){
		foreach($params as $key=>$value){
			if(in_array($key, array('id','type','area','year','star','state','ispay','order','limit','letter','language','page','ajax')) ){
				$array['type_'.$key] = $value;
			}
		}
		//模板名称定义
		if (empty($array['list_skin_type'])) {
			$array['list_skin_type'] = 'type';
		}
		if($params['ajax']){
			$array['list_skin_type'] .= '_ajax';
		}
		$array['list_skin_type'] = 'Vod:'.$array['list_skin_type'];
		$array['site_sid'] = 1;
		return $array;
  }
	// 影视搜索变量定义
	public function Lable_Vod_Search($params){
		$array = array();
		foreach($params as $key=>$value){
			if(in_array($key, array('wd','name','title','actor','director','play','inputer','order','limit','page','ajax')) ){
				$array['search_'.$key] = $value;
			}
		}
		$array['search_skin'] = 'search';
		if($params['ajax']){
			$array['search_skin'] .= '_ajax';
		}
		$array['search_skin'] = 'Vod:'.$array['search_skin'];
		$array['site_sid'] = 1;
		return $array;
  }
	// 影视栏目页变量定义
	public function Lable_Vod_List($params, $array){
		$array['list_page'] = $params['page'];
		$array['list_ajax'] = $params['ajax'];
		if (empty($array['list_skin'])) {
			$array['list_skin'] = 'list';
		}
		if($params['ajax']){
			$array['list_skin'] .= '_ajax';
		}
		$array['list_skin'] = 'Vod:'.$array['list_skin'];
		$array['site_sid'] = 1;
		return $array;
  }
	/*****************影视内容,播放页公用变量定义******************************
	* @$array/具体的内容信息
	* @$array_play 为解析播放页
	* @返回赋值后的arrays 多维数组*/
	public function Lable_Vod_Read($array){
		$array['vod_hits_insert'] = ff_get_hits('vod','insert',$array);
		$array['vod_hits_all'] = ff_get_hits('vod','vod_hits',$array);
		$array['vod_hits_month'] = ff_get_hits('vod','vod_hits_month',$array);
		$array['vod_hits_week'] = ff_get_hits('vod','vod_hits_week',$array);
		$array['vod_hits_day'] = ff_get_hits('vod','vod_hits_day',$array);
		if($array['vod_skin']){
			$array['vod_skin_detail'] = 'Vod:'.trim($array['vod_skin']);
			$array['vod_skin_play'] = 'Vod:'.trim($array['vod_skin']).'_play';
		}else{
			$array['vod_skin_detail'] = !empty($array['list_skin_detail']) ? 'Vod:'.$array['list_skin_detail'] : 'Vod:detail';
			$array['vod_skin_play'] = !empty($array['list_skin_play']) ? 'Vod:'.$array['list_skin_play'] : 'Vod:play';
		}
		//unset($array['vod_server'], $array['vod_play'], $array['vod_url']);
		$array['site_sid'] = 1;
		return $array;
	}
	/*****************影视播放页变量定义 适用于动态与合集为一个播放页******************************<br />
	* @$array 内容页解析好后的内容页变量 arrays['read']
	* @$array_play 为播放页URL参数 array('id'=>558,'sid'=>1,'pid'=>1)
	* @返回$array 内容页重新组装的数组*/
	public function Lable_Vod_Play($array, $array_play){
		// 点击数调用
		$array['vod_hits_month'] = ff_get_hits('vod','vod_hits_month',$array,C('url_html_play'));
		$array['vod_hits_week'] = ff_get_hits('vod','vod_hits_week',$array,C('url_html_play'));
		$array['vod_hits_day'] = ff_get_hits('vod','vod_hits_day',$array,C('url_html_play'));
		// 播放器相关默认配置
		$array['play_sid'] = $array_play['sid'];
		$array['play_pid'] = $array_play['pid'];
		$array['play_buffer'] = C('play_playad');
		$array['play_second'] = intval(C('play_second'));
		$array['play_jiexi'] = trim(C('play_jiexi'));
		// 通过sid定义到当前播放器组的相关变量
		$play = $array['vod_play_list'][$array_play['sid']];
		$array['play_name_en'] = $play['player_name_en'];
		$array['play_name_zh'] = $play['player_name_zh'];
		$array['play_copygiht'] = intval($play['player_copyright']);//播放器组定义的版权
		$array['play_info'] = $play['player_info'];
		$array['play_title'] = $play['son'][$array['play_pid']-1]["title"];
		$array['play_url'] = $play['son'][$array['play_pid']-1]["url"];
		$array['play_url_next'] = $play['son'][$array['play_pid']]["url"];
		$array['play_url_prev'] = $play['son'][$array['play_pid']-2]["url"];
		$array['play_count'] = count($play['son']);
		//指定播放器处理
		if($play['son'][$array['play_pid']-1]["player"]){
			$array['play_name_en'] = $play['son'][$array['play_pid']-1]["player"];
		}
		//解析服务器变量处理
		if($play['player_jiexi']){
			$array['play_jiexi'] = trim($play['player_jiexi']);
		}
		if($array['play_jiexi']){
			$array['play_jiexi'] = str_replace('{name}', $array['play_name_en'], $array['play_jiexi']);
		}
		//付费点播处理
		$array['play_ispay'] = 0;
		$array['play_price'] = 0;
		$array['play_trysee'] = 0;
		if($array['list_ispay']){
			$array['play_ispay'] = intval($array['list_ispay']);
		}
		if($array['list_price']){
			$array['play_price'] = intval($array['list_price']);
		}
		if($array['list_trysee']){
			$array['play_trysee'] = intval($array['list_trysee']);
		}
		if($array['vod_ispay']){
			$array['play_ispay'] = intval($array['vod_ispay']);
		}
		if($array['vod_price']){
			$array['play_price'] = intval($array['vod_price']);
		}
		if($array['vod_trysee']){
			$array['play_trysee'] = intval($array['vod_trysee']);
		}
		//播放器调用
		if($array['play_ispay'] || $array['vod_price']){//付费
			$array['vod_player'] = '<div id="cms-player-vip"><div class="cms-player-box">VIP影片，需验证观看权限，请稍等。</div><iframe class="embed-responsive-item cms-player-iframe" src="'.ff_url('vod/vip',array('action'=>'play','id'=>$array['vod_id'],'sid'=>$array['play_sid'],'pid'=>$array['play_pid'],true)).'" width="100%" height="100%" frameborder="0" scrolling="no" allowfullscreen="true" allowtransparency="true"></iframe></div>';
		}else{//免费
			//copyright 版权处理
			if($array['list_copyright'] > 0){
				$array['play_copygiht'] = intval($array['list_copyright']);
			}else if($array['list_copyright'] < 0){
				$array['play_copygiht'] = 0;
			}
			if($array['vod_copyright'] > 0){
				$array['play_copygiht'] = intval($array['vod_copyright']);
			}else if($array['vod_copyright'] < 0){
				$array['play_copygiht'] = 0;
			}
			$array['vod_player'] = ff_player($array);
		}
		$array['site_sid'] = 1;
		return $array;
	}
	//VIP框架播放
	public function Lable_Vod_Play_Vip($array, $array_play){
		$vip = array();
		// 播放器相关默认配置
		$vip['play_id'] = $array['vod_id'];
		$vip['play_sid'] = $array_play['sid'];
		$vip['play_pid'] = $array_play['pid'];
		$vip['play_status'] = 200;
		$vip['play_buffer'] = C('play_playad');
		$vip['play_second'] = intval(C('play_second'));
		$vip['play_jiexi'] = trim(C('play_jiexi'));
		$vip['play_copygiht'] = 0;
		$vip['play_ispay'] = 0;
		$vip['play_price'] = 0;
		$vip['play_trysee'] = 0;
		// 通过sid定义到当前播放器组的相关变量
		$play = $array['vod_play_list'][$array_play['sid']];
		$vip['play_url'] = $play['son'][$array_play['pid']-1]["url"];
		$vip['play_url_next'] = $play['son'][$array_play['pid']]["url"];
		//指定播放器处理
		$vip['play_name_en'] = $play['player_name_en'];
		if($play['son'][$array_play['pid']-1]["player"]){
			$vip['play_name_en'] = $play['son'][$array_play['pid']-1]["player"];
		}
		//解析服务器变量处理
		if($play['player_jiexi']){
			$vip['play_jiexi'] = trim($play['player_jiexi']);
		}
		if($vip['play_jiexi']){
			$vip['play_jiexi'] = str_replace('{name}', $vip['play_name_en'], $vip['play_jiexi']);
		}
		//vip包月
		if($array['list_ispay']){
			$vip['play_ispay'] = intval($array['list_ispay']);
		}
		if($array['vod_ispay']){
			$vip['play_ispay'] = intval($array['vod_ispay']);
		}
		//影币处理
		if($array['list_price']){
			$vip['play_price'] = intval($array['list_price']);
		}
		if($array['vod_price']){
			$vip['play_price'] = intval($array['vod_price']);
		}
		//试看处理
		if($array['list_trysee']){
			$vip['play_trysee'] = intval($array['list_trysee']);
		}
		if($array['vod_trysee']){
			$vip['play_trysee'] = intval($array['vod_trysee']);
		}
		//播放器调用
		$vip['vod_player'] = ff_player($vip);
		return $vip;
	}
	// 分集变量定义
	public function Lable_Vod_Scenario($array, $params){
		//$array = array();
		foreach($params as $key=>$value){
			if(in_array($key, array('id','pid')) ){
				$array['scenario_'.$key] = $value;
			}
		}
		$array['scenario_skin'] = str_replace('Vod:detail','Scenario:detail',$array['vod_skin_detail']);
		if($params['pid']){
			$array['scenario_skin'] .= '_pid';
		}
		if($params['ajax']){
			$array['scenario_skin'] .= '_ajax';
		}
		$array['site_sid'] = 7;
		return $array;
  }
	// 文章多分类筛选变量定义
	public function Lable_News_Type($params, $array){
		foreach($params as $key=>$value){
			if(in_array($key, array('id','type','limit','order','page','ajax')) ){
				$array['type_'.$key] = $value;
			}
		}
		//模板名称定义
		if (empty($array['list_skin_type'])) {
			$array['list_skin_type'] = 'type';
		}
		if($params['ajax']){
			$array['list_skin_type'] .= '_ajax';
		}
		$array['list_skin_type'] = 'News:'.$array['list_skin_type'];
		$array['site_sid'] = 2;
		return $array;
  }
	// 文章搜索变量定义
	public function Lable_News_Search($params){
		$array = array();
		foreach($params as $key=>$value){
			if(in_array($key, array('wd','name','title','remark','order','limit','page','ajax')) ){
				$array['search_'.$key] = $value;
			}
		}
		$array['search_skin'] = 'search';
		if($params['ajax']){
			$array['search_skin'] .= '_ajax';
		}
		$array['search_skin'] = 'News:'.$array['search_skin'];
		$array['site_sid'] = 2;
		return $array;
  }
	// 文章分类页变量定义
	public function Lable_News_List($params, $array){
		$array['list_page'] = $params['page'];
		$array['list_ajax'] = $params['ajax'];
		if (empty($array['list_skin'])) {
			$array['list_skin'] = 'list';
		}
		if($params['ajax']){
			$array['list_skin'] .= '_ajax';
		}
		$array['list_skin'] = 'News:'.$array['list_skin'];
		$array['site_sid'] = 2;
		return $array;
  }
	//资讯内容页变量定义
	public function Lable_News_Read($params, $array){
		$array['news_hits_insert'] = ff_get_hits('news','insert',$array);
		$array['news_hits_all'] = ff_get_hits('news','news_hits',$array);
		$array['news_hits_month'] = ff_get_hits('news','news_hits_month',$array);
		$array['news_hits_week'] = ff_get_hits('news','news_hits_week',$array);
		$array['news_hits_day'] = ff_get_hits('news','news_hits_day',$array);
		//正则分割是否有分页
		$array_content = preg_split("/<div style=\"page-break-after([\s\S]*?)\">([\s\S]*?)<\/div>/", $array['news_content']);
		$array['news_page'] = $params['page'];
		$array['news_page_count'] = count($array_content);
		$array['news_content'] = $array_content[$params['page']-1];
		//模板路径
		if(empty($array['news_skin'])){
			$array['news_skin_detail'] = !empty($array['list_skin_detail']) ? $array['list_skin_detail'] : 'detail';
		}
		if($params['ajax']){
			$array['news_skin_detail'] .= '_ajax';
		}
		$array['news_skin_detail'] = 'News:'.$array['news_skin_detail'];
		$array['site_sid'] = 2;
		return $array;
	}
	//专题列表页变量定义
	public function Lable_Special_List($params){
		$array = array();
		$array['special_type'] = $params['type'];
		$array['special_page'] = $params['page'];
		$array['special_skin'] = 'Special:list';
		if($params['ajax']){
			$array['special_skin'] .= '_ajax';
		}
		$array['site_sid'] = 3;
		return $array;
  }
	//专题内容页变量定义
	public function Lable_Special_Read($array,$array_play = false){
		$array_ids = array();$where = array();
		$array['special_skin'] = !empty($array['special_skin']) ? 'Special:'.$array['special_skin'] : 'Special:detail';
		$array['special_hits_insert'] = ff_get_hits('special','insert',$array);
		$array['special_hits_all'] = ff_get_hits('special','special_hits',$array);
		$array['special_hits_month'] = ff_get_hits('special','special_hits_month',$array);
		$array['special_hits_week'] = ff_get_hits('special','special_hits_week',$array);
		$array['special_hits_day'] = ff_get_hits('special','special_hits_day',$array);
		$array['site_sid'] = 3;
		return $array;
	}
	//讨论模块普通变量定义
	public function Lable_Forum($params){
		$array = array();
		foreach($params as $key=>$value){
			if(in_array($key, array('id','cid','sid','uid','pid','page')) ){
				$array['forum_'.$key] = $value;
			}
		}
		$array['forum_seo_title'] = C('forum_seo_title');
		$array['forum_seo_keywords'] = C('forum_seo_keywords');
		$array['forum_seo_description'] = C('forum_seo_description');
		$array['site_sid'] = 6;
		return $array;
  }
	//评论详情页解析
	public function Lable_Forum_Detail($params, $array){
		$array['forum_skin'] = 'Forum:detail_'.ff_sid2module($array['forum_sid']);
		$array['site_sid'] = 6;
		return $array;
  }
	//首页标签定义
	public function Lable_Index(){
		$array = array();
		if(!C('site_title')){
			$array['site_title'] = C('site_name').'_网站首页';
		}
		return $array;
	}
	//全局标签定义
	public function Lable_Style(){
		C('TOKEN_ON',false);//C('TOKEN_NAME','form_'.$array['model']);取消前端的表单令牌
		$array = array();
		$array['root'] = C('site_path');
		$array['model'] = strtolower(MODULE_NAME);
		$array['action'] = strtolower(ACTION_NAME);
		$array['public_path'] = $array['root'].'Public/';
		$array['tpl_path'] = $array['root'].str_replace('./','',TEMPLATE_PATH).'/';
		$array['site_name'] = C('site_name');
		$array['site_domain'] = C('site_domain');
		$array['site_domain_m'] = C('site_domain_m');
		$array['site_url'] = 'http://'.C('site_domain');
		$array['site_title'] = C('site_title');
		$array['site_keywords'] = C('site_keywords');
		$array['site_description'] = C('site_description');
		$array['site_email'] = C('site_email');
		$array['site_copyright'] = C('site_copyright');
		$array['site_tongji'] = C('site_tongji');
		$array['site_icp'] = C('site_icp');
		$array['site_hot'] = ff_site_hot();
		$array['site_sid'] = intval(ff_module2sid($array['model']));
		$user = ff_user_cookie();
		$array['site_user_id'] = $user['user_id'];
		$array['site_user_name'] = $user['user_name'];
		unset($user);
		return $array;
	}
}
?>
