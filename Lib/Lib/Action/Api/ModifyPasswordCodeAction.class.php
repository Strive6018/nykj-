<?php
/**
 * 用户修改密码获取验证码接口类
 * Class VerificationCode
 */

import('feifeicms.Action.api.Repository.Sms');
class ModifyPasswordCodeAction extends ApiAction
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

    }

    /**
     * 逻辑层
     */
    private function handle(){
        $data = $this->model['User']->where(array('user_id'=>$this->user_id))->find();
        $field = 'value as value';
        $where = ['keyword'=>'Sms'];
        $Sms = $this->model['SystemSetup']->system_setup_get($field,$where);
        if(empty($Sms) || empty($Sms['value']))$this->api_error();
        if (!in_array($Sms['value'],Sms)) $this->api_error();
        //生成随机验证码
        $RandomVerificationCode = rand(1000,9999);
        //测试模板发送验证码
        $params = [$data['user_name'],"$RandomVerificationCode",1];
        if($this->Sms->SmsConfiguration($Sms['value'])->tencent_sms($data['user_phone'],$params)){
            S(md5(get_client_ip().$this->request['phone'].$this->request['deviceid']),['code'=>$RandomVerificationCode,'phone'=>$data['user_phone']],VerificationCodeCacheTime);
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
