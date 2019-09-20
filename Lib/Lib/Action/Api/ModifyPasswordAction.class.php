<?php

/**
 * 用户修改密码接口类
 * Class ModifyPasswordAction
 */
class ModifyPasswordAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model=D("User");
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
        $this->date= $this->model->ff_update(array('user_pwd'=>trim($this->request['Password']),'user_id'=>$this->user_id));
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
