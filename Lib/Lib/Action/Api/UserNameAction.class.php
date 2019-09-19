<?php

/**
 * 修改用户昵称
 * Class UserNameAction
 */
class UserNameAction extends ApiAction
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
        if(!$this->model->where(array('user_id' => 2))->save(array('user_name'=>$this->request['name']))){
            $this->api_error('修改失敗');
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
