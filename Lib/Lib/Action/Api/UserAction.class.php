<?php
/**
 * 用户中心接口类
 * Class UserAction
 */
class UserAction extends ApiAction
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
        $field ='user_name as userName,user_face as userPortrait';
        $this->data = $this->model->ff_find($field, array('user_id'=>array('eq',$this->user_id)), false, false, false);
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
