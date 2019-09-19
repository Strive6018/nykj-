<?php
require APP_PATH.'./Common/Api/Consts.php';
vendor('Sms.Tencent.index');
class Sms
{
    private $SmsModel;
    private $SmsSingleSender;
    private $SmsConfiguration;
    private $IdentifyThePrefix = 'Sms_';
    public function __construct()
    {
        $this->SmsModel = D('SystemSetup');
    }

    /**
     * 获取Sms配置
     * @param $platform(Sms平台标识)
     * @return $this
     */
    public function SmsConfiguration($platform){
        $platformKeyword = $this->IdentifyThePrefix.$platform;
        $field = 'value as value';
        $where = ['keyword' => $platformKeyword];
        $data = $this->SmsModel->system_setup_get($field,$where);
        $this->SmsConfiguration = json_decode($data['value'],true);
        return $this;
    }

    /**
     * 腾讯Sms指定模板发送单条短信
     * @param $phoneNumbers(手机号码)
     * @param array $params(Sms短信模板参数)
     * @return bool
     */
    public function tencent_sms($phoneNumbers,$params=array()){
        $this->SmsSingleSender = new SmsSingleSender($this->SmsConfiguration['appid'],$this->SmsConfiguration['appkey']);
        $result = $this->SmsSingleSender->sendWithParam('86',$phoneNumbers,$this->SmsConfiguration['templateId'],$params,$this->SmsConfiguration['smsSign'],'','');
        $result = json_decode($result,true);
        if( $result['errmsg'] == 'OK' ) {
            return true;
        }
        return false;
    }

    /**
     * 阿里云Sms指定模板发送单条信息
     *  todo::待完善
     */
    public function aliyun_sms(){
        return false;
    }
}
