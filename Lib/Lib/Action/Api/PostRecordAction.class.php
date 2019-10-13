<?php
/**
 * 插入播放记录类
 * Class PostRecordAction
 */
class PostRecordAction extends ApiAction
{
    protected $user_id = 1;
    public function _initialize()
    {
        parent::_initialize();
        $this->model = D('Record');
    }
    /**
     * 验证层
     */
    private function validate(){
        if(empty($this->request['videoId'])){
            $this->api_error('videoId必须填写');
        }
        if(!preg_match("/^[1-9][0-9]*$/",$this->request['videoId'])){
            $this->api_error('videoId必须为整型');
        }
    }

    /**
     * 逻辑层
     */
    private function  handle(){
        $record = array();
        $record['record_uid'] = $this->user_id;
        $record['record_sid'] = 1;
        $record['record_type']	= 1;
        $record['record_did']	= $this->request['videoId'];
        $record['record_did_sid']	= 2;//关联播放器组ID
        $record['record_did_pid']	= 1;//关联播放器分集ID
        $record['record_time']  = time();
        if(!$this->data = $this->model->ff_insert($record)){
            $this->api_error();
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
