<?php 
class SpecialModel extends RelationModel {
	protected $_validate=array(
		array('special_name','require','专题名称必须填写！',1),
		array('special_ename','','别名标识重复，请重新填写',2,'unique',3),
	);
	protected $_auto=array(
		array('special_ename','special_ename',3,'callback'),
		array('special_addtime','m_addtime',3,'callback'),
		array('special_content','special_content',3,'callback'),
	);
	//关联定义
	protected $_link = array(
		'Tag'=>array(
			'mapping_type' => HAS_MANY,
			'class_name'=> 'Tag',
			'mapping_name'=>'Tag',//数据对像映射名称
			'foreign_key' => 'tag_id',
			'parent_key' => 'special_id',
			'mapping_fields' => 'tag_id,tag_cid,tag_name,tag_ename,tag_list',
			'condition' => "tag_cid in(5,6)",
			'mapping_order' => 'tag_cid asc',
			//'mapping_limit' => 5,
		)
	);
	//别名处理
	public function special_ename(){
		if (!$_POST['special_ename']) {
			return ff_pinyin(trim($_POST["special_name"]));
		}else{
			return trim($_POST["special_ename"]);
		}
	}
	public function m_addtime(){
		if ($_POST['checktime']) {
			return time();
		}else{
			return strtotime($_POST['special_addtime']);
		}
	}
	public function special_content($content){
		return ff_content_img($content,'special');
	}
	
	// 通过ID查询详情数据
	public function ff_find($field = '*', $where, $cache_name=false, $relation=true, $order=false){
		//md5处理KEY
		if($cache_name){
			$cache_name = md5($cache_name);
		}
		//优先缓存读取数据
		if( C('cache_page_special') && $cache_name){
			$cache_info = S($cache_name);
			if($cache_info){
				return $cache_info;
			}
		}
		//数据库获取数据
		$info = $this->field($field)->where($where)->relation($relation)->order($order)->find();
		//dump($this->getLastSql());
		if($info){
			if( C('cache_page_special') && $cache_name ){
				S($cache_name, $info, intval(C('cache_page_special')));
			}
    	return $info;
    }
		$this->error = '数据不存在！';
		return false;
	}
	
	// 查询多个数据
	public function ff_select_page($params, $where){
		//优先从缓存调用数据及分页变量
		if($params['cache_name'] && $params['cache_time']){
			$infos = S($params['cache_name']);
			if($infos){
				if($params['page_id'] && $params['page_is']){
					$_GET['ff_page_'.$params['page_id']] = S($params['cache_name'].'_page');
				}
				return $infos;
			}
		}
		// 分页变量动态定义
		if($params['page_id'] && $params['page_is']){
			$page = array();
			$page['records'] = $this->ff_select_count($where);
			$page['totalpages'] = ceil($page['records']/$params['limit']);
			$page['currentpage'] = ff_page_max($params['page_p'], $page['totalpages']);
			// 使用GET全局变量传递分页参数 gx_page_default
			$_GET['ff_page_'.$params['page_id']] = $page;
		}else{
			$page['currentpage'] = false;
		}	
		$infos = $this->field($params['field'])->where($where)->limit($params['limit'])->page($page['currentpage'])->order(trim($params['order'].' '.$params['sort']))->select();
		// 是否写入数据缓存
		if($params['cache_name'] && $params['cache_time']){
			S($params['cache_name'], $infos, intval($params['cache_time']) );
			if($params['page_id'] && $params['page_is']){
				S($params['cache_name'].'_page', $page, intval($params['cache_time'])+1 );
			}
		}
		//dump($this->getLastSql());
		return $infos;
	}
	// 符合条件的统计
	public function ff_select_count($where){
		return $this->where($where)->count('special_id');
	}
	
	// 新增或更新
	public function update($data){
		// 创建安全数据对象TP
		$data = $this->create($data);
		if(false === $data){
			$this->error = $this->getError();
			return false;
		}
		/* 添加或新增行为 */
		if(empty($data['special_id'])){
			$data['special_id'] = $this->add();
			if(!$data['special_id']){
				$this->error = $this->getError();
				return false;
			}
		} else {
			$status = $this->save();
			if(false === $status){
				$this->error = $this->getError();
				return false;
			}
		}
		//分类处理
		if($data['special_type']){
			D('Tag')->tag_update($data['special_id'],$data["special_type"],'special_type');
		}	
		return $data;
	}	
}
?>