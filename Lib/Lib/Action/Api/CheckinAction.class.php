<?php

/**
 * 用户签到接口
 * Class CheckinAction
 */
class CheckinAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model=D("UserSign");
    }
    /**
     * 验证层
     */
    private function validate(){
    }

    /**
     * 逻辑层
     */
    private function  handle(){
        $res = $this->model->checkin($this->user_id);
        if($res == 1){
            $this->api_error("您今日已签到");
        }
        if($res == 2){
            $this->api_error("签到失败");
        }
    }

    private function response(){
        $this->success($this->data,'签到成功');
    }

    public function index(){
        $this->validate();
        $this->handle();
        $this->response();
    }
}
