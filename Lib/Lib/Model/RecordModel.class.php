<?php
class RecordModel extends RelationModel {
	
	protected $_auto = array(
		array('record_time','time',3,'function'),
	);
	
	// 获取记录json格式
	public function ff_json($data){
		//已登录用户从数据库读取 未登录从COOKIE
		if($data['record_uid']){
			$cache_name = 'ff_record_json';
			$cache_time = C('cache_foreach');
			//优先从缓存获取
			if($cache_time && $cache_name){
				$cache_info = S($cache_name);
			}
			//未命中缓存数据库获取
			if(empty($cache_info)){
				$where = array();
				$where['record_uid'] = array('eq',$data['record_uid']);
				$where['record_sid'] = array('eq',$data['record_sid']);
				$where['record_type']	= array('eq',$data['record_type']);
				$cache_info = $this->where($where)->limit(50)->order('record_time desc')->select();
				//写入缓存
				if( $cache_info && $cache_time && $cache_name ){
					S($cache_name, $cache_info , $cache_time);
				}
			}
			//格式化
			foreach($cache_info as $key=>$value){
				$info[$value['record_sid']][$value['record_did']][]=array('type'=>$value['record_type'], 'sid'=>$value['record_did_sid'], 'pid'=>$value['record_did_pid']);
			}
		}else{
			$cookie_old = cookie('ff-record');
			if($cookie_old){
				$cookie_array = explode(',',cookie('ff-record'));
				foreach($cookie_array as $key=>$value){
					$info[1][$value][] = array('type'=>1);
				}
			}
		}
		//json数组格式
		$array['vod'] = $info[1];
		$array['news'] = $info[2];
		return json_encode($array);
	}
	
	// 写入记录
	public function ff_insert($data){
		//已登录用户写入数据库 未登录写入COOKIE
		if($data['record_uid']){
			$data = $this->create($data);
			if(false === $data){
				$this->error = $this->getError();
				return false;
			}
			$where = array();
			$where['record_uid'] = array('eq',$data['record_uid']);
			$where['record_sid'] = array('eq',$data['record_sid']);
			$where['record_type']	= array('eq',$data['record_type']);
			$where['record_did']	= array('eq',$data['record_did']);
			//更新记录
			$info = $this->where($where)->save($data);
			//无记录则新增
			if(!$info){
				$info = $this->add($data);
			}
			return $info;
		}else{//cookie 只记录vodid
			unset($data['record_uid']);
			$cookie_old = cookie('ff-record');
			if($cookie_old){
				$array = explode(',',cookie('ff-record'));
				array_push($array, $data["record_did"]);
				$ids = implode(',', array_unique($array));
			}else{
				$ids = $data["record_did"];
			}
			//写入COOKIE 去重后的数组 "1,2,3,4,5"
			cookie('ff-record', $ids, 2592000);
			return 'cookie';
		}
	}
	
	public function ff_delete($array_ids){
		if(is_array($array_ids)){
			$array_ids = implode(',', $array_ids);
		}
		$this->where(array('record_id'=>array('in',$array_ids)))->delete();
	}
	
	// 通过ID查询详情数据
	public function ff_find($field = '*', $where, $cache_name=false, $cache_time=0, $relation=true, $order=false){
		$cache_name = md5($cache_name);
		//优先缓存读取数据
		if( $cache_time && $cache_name){
			$cache_info = S($cache_name);
			if($cache_info){
				return $cache_info;
			}
		}
		//数据库获取数据
		$info = $this->field($field)->where($where)->order($order)->find();
		//dump($this->getLastSql());
		if($info){
			if( $cache_time && $cache_name ){
				S($cache_name, $info, $cache_time);
			}
    	return $info;
    }
		$this->error = '数据不存在！';
		return false;
	}
}
?>