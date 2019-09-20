<?php
/**
 * 获取验证码接口类
 * Class VerificationCode
 */

import('feifeicms.Action.Api.Repository.Sms');
class VerificationCodeAction extends ApiAction
{
    private $Sms;
    public function _initialize()
    {
        parent::_initialize();
        $this->model['SystemSetup'] = D('SystemSetup');
        $this->model['User'] = D('User');
        $this->Sms = new Sms();
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
        if(!empty($this->model['User']->field('user_phone')->where(['user_phone'=>$this->request['user_phone']])->find())){
            $this->api_error('该手机号码已被注册');
        }
        //检查验证码是否已发送
        if(!empty(S(md5(get_client_ip().$this->request['phone'].$this->request['deviceid'])))){
            $this->api_error('请勿重复发送');
        }
    }

    /**
     * 逻辑层
     */
    private function handle(){
        $field = 'value as value';
        $where = ['keyword'=>'Sms'];
        $Sms = $this->model['SystemSetup']->system_setup_get($field,$where);
        if(empty($Sms) || empty($Sms['value']))$this->api_error();
        if (!in_array($Sms['value'],Sms)) $this->api_error();
        //生成随机验证码
        $RandomVerificationCode = rand(1000,9999);
        //测试模板发送验证码
        $params = ['Strive',$RandomVerificationCode,1];
        if($this->Sms->SmsConfiguration($Sms['value'])->tencent_sms($this->request['phone'],$params)){
            S(md5(get_client_ip().$this->request['phone'].$this->request['deviceid']),['code'=>$RandomVerificationCode,'phone'=>$this->request['phone']],VerificationCodeCacheTime);
        }else{
            $this->api_error('验证码发送失败');
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
