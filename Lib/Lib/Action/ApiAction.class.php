<?php
import('feifeicms.Action.Api.Traits.IsCheckApiTokenAction');
require_once (APP_PATH.'./Common/Api/Consts.php');
class ApiAction extends Action
{
    protected $user_id;
    protected $request;
    protected $data = [];
    protected $model;
    private $IsCheckApiToken;
    public function _initialize()
    {
        $this->request = $_REQUEST;
        $this->IsApiTokenOrRoute();
    }

    /**
     * 重写ajaxReturn方法
     */
    protected function ajaxReturn($data,$message,$code=ApiCodeSucceed){
        // 保证AJAX返回后也能保存日志
        if(C('LOG_RECORD')) Log::save();
        $result  =  array();
        if($code == ApiCodeSucceed){
            $result['code'] = ApiCodeSucceed;
            $result['message'] =  ApiCodeOptions[ApiCodeSucceed];
        }else{
            $result['error_code'] = $code;
            $result['message'] =  $message;
        }
        $result['data'] = $data;
        // 返回JSON数据格式到客户端 包含状态信息
        header("Content-Type:text/html; charset=utf-8");
        exit(json_encode($result));
    }

    /**
     * 重写success方法
     */
    protected function success($data,$message = ApiCodeOptions[ApiCodeSucceed])
    {
        $this->ajaxReturn($data,$message);
    }

    /**
     * 返回错误信息
     */
    protected function api_error($message=ApiCodeOptions[ApiCodeParameterError],$code = ApiCodeParameterError){
        Header("HTTP/1.1 500 Access Denied");
        $this->ajaxReturn([],$message,$code);
    }

    private function IsApiTokenOrRoute(){
        $this->IsCheckApiToken = new IsCheckApiTokenAction();
        //检查提交方式是否正确
        if(!isset(S(ApiRouteCacheName)[__ACTION__])){
            $this->api_error(ApiCodeOptions[ApiCodeAccessDenied],ApiCodeAccessDenied);
        }
        $isMethod = 'is'.S(ApiRouteCacheName)[__ACTION__]['method'];
        if(!$this->$isMethod()){
            $this->api_error(ApiCodeOptions[ApiCodeAccessDenied],ApiCodeAccessDenied);
        }
        //检查路由是否正确
        if(!$this->IsCheckApiToken->IsCheckRoute()){
            $this->api_error(ApiCodeOptions[ApiCodeApiTokenError],ApiCodeApiTokenError);
        }
        //检查api_token是否正确
        $api_token = $this->IsCheckApiToken->IsCheckApiToken();
        if(!$api_token){
            $this->api_error(ApiCodeOptions[$api_token],$api_token);
        }else{
            $this->user_id = S($this->request[ApiTokenName])['user_id'];
        }

    }

}
