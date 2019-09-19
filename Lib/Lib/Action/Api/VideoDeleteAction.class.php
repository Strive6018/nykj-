<?php

/**
 * 删除播放记录接口类
 * Class VideoDeleteAction
 */
class VideoDeleteAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model=D("Record");
    }
    /**
     * 验证层
     */
    private function validate(){
        $Data = $this->request['videoId'];
        if(empty($this->request['videoId'])){
            $this->api_error('videoId必须填写');
        }
        for($i = 0; $i<count($Data);$i++){
            if(!preg_match("/^[1-9][0-9]*$/",$Data[$i])){
                $this->api_error('videoId必须为整型');
            }
        }

    }

    /**
     * 逻辑层
     */
    private function  handle(){
        if(is_array($this->request['videoId'])){
            $where['record_did'] = 'in('.implode(',',$this->request['videoId']).')';
        }else{
            $where['record_did'] = array('eq', intval($this->request['videoId']));
        }
        if(!$this->model->where(array('record_uid'=>2))->delete($where['record_did'])){
            $this->api_error('删除失败');
        }
    }

    private function response(){
        $this->success($this->data);
    }

    public function index(){
        $this->validate();
        $this->handle();
        $this->response();
    }
}
