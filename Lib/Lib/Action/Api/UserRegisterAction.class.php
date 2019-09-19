<?php
import('feifeicms.Action.Api.Traits.Sms');

/**
 * 用户注册接口类
 * Class UserRegisterAction
 */
class UserRegisterAction extends ApiAction
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
        //检查手机号码是否已经注册
        if(!empty($this->model->field('user_phone')->where(['user_phone'=>$this->request['user_phone']])->find())){
            $this->api_error('该手机号码已被注册');
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
        $res['user_phone'] = $this->request['phone'];
        $res['user_pwd'] = $this->model->auto_user_pwd($this->request['password']);
        if(!$this->model->ff_update($res,'app')){
            $this->api_error('注册失败');
        }
    }

    private function response(){
        $this->success($this->data,'注册成功');
    }

    public function index(){
        $this->validate();
        $this->handle();
        $this->response();
    }
}
