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
        $user_id = 2;
        if(empty($user_id)){
            $this->api_error('请先登录!');
        }
    }

    /**
     * 逻辑层
     */
    private function  handle(){
        $user_id = 2;
        $this->data = $this->model->checkin($user_id);
        if($this->data==1){
            $this->api_error("您今日已签到");
        }elseif($this->data==2){
            $this->api_error("签到失败");
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
