<?php

/**
 * 用户退出登录
 * Class UserNameAction
 */
class LogoutAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();

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
        $this->data =$this->OutLogin();
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
