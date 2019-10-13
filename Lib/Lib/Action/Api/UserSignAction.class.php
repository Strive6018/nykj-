<?php

/**
 * 用户登录
 * Class BannerAction
 */
class UserSignAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model = D('User');

    }
    /**
     * 验证层
     */
    private function validate(){
        if(empty($this->request['phone'])){
            $this->api_error('请先填写手机号码');
        }
        $check = '/^(1(([35789][0-9])|(47)))\d{8}$/';
        //检查手机号码是否正确
        if (!preg_match($check, $this->request['phone'])) {
            $this->api_error('手机号码格式不正确');
        }
        //检查账号是否正确
        $data = $this->model->where(array('user_phone'=>$this->request['phone']))->find();
        if(!$data['user_phone']){
            $this->api_error('该账号未注册!');
        }
        //检查密码是否正确
        if(md5($this->request['password'])!=$data['user_pwd']){
            $this->api_error('密码错误!');
        }
        //检查密码长度是否正确
        if(strlen($this->request['password'])>12 || strlen($this->request['password'])<6)
        {
            $this->api_error('密码必须为6-12位数字或字母');
        }
        //检查密码格式是否正确
        if(!preg_match("/^[a-z\d]*$/i",$this->request['password']))
        {
            $this->api_error('密码只能包含数字和字母');
        }

    }

    /**
     * 逻辑层
     */
    private function  handle(){
        $this->data = $this->model->where(array('user_phone'=>$this->request['phone'],'user_pwd'=>md5($this->request['password'])))
                     ->save(['user_api_token'=>md5('wolong'.$this->request['phone'].time())]);

    }

    private function response(){
        $this->success($this->data,'登录成功');
    }

    public function index(){
        $this->validate();
        $this->handle();
        $this->response();
    }
}
