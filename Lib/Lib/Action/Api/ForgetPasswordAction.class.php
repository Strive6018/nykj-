<?php
/**
 * 用户找回密码
 * Class ForgetPassword
 */
import('feifeicms.Action.api.Repository.Sms');
class   ForgetPasswordAction extends ApiAction
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
        if(empty($this->request['phone'])){
            $this->api_error('请先填写手机号码');
        }
        $check = '/^(1(([35789][0-9])|(47)))\d{8}$/';
        //检查手机号码是否正确
        if (!preg_match($check, $this->request['phone'])) {
            $this->api_error('手机号码格式不正确');
        }
        //检查手机号码用户是否存在
        if(empty($this->model->where(['user_phone'=>$this->request['phone']])->find())){
            $this->api_error('用户不存在');
        }
        //检查验证码是否存在
        if(!isset($this->request['code']) || empty($this->request['code'])){
            $this->api_error('请填写手机验证码');
        }
        //检查验证码是否正确
        if(S(md5(get_client_ip().$this->request['phone'].$this->request['deviceid']))['code'] != $this->request['code']){
            $this->api_error('验证码不正确');
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
        $ins = $this->model->where(['user_phone'=>$this->request['phone']])->find();
        if(!$this->data = $this->model->ff_update(array('user_pwd'=>trim($this->request['password']),'user_id'=>$ins['user_id']))){
            $this->api_error('找回密码失败');
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
