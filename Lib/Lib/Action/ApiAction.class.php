<?php
import('feifeicms.Action.Api.Repository.IsCheckApiToken');
require_once (APP_PATH.'./Common/Api/Consts.php');
class ApiAction extends Action
{
    protected $user_id;
    protected $request;
    protected $data = [];
    protected $model;
    public function _initialize()
    {
        $this->api_the_refresh();
        $this->IsApiTokenOrRoute();
        $this->request = $_REQUEST;
        $this->user_id = S($this->request[ApiTokenName])['user_id'];
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
        $IsCheckApiToken = new IsCheckApiToken();
        $IsCheckApiToken = $IsCheckApiToken->execute();
        if($IsCheckApiToken !== true){
            $this->api_error(ApiCodeOptions[$IsCheckApiToken],$IsCheckApiToken);
        }
    }

    /**
     * 接口防刷新
     */
    private function api_the_refresh(){
        session_start();
        if (isset($_SESSION[TheRefresh]))
        {
            if (time() - $_SESSION[TheRefresh]['time'] < AllowSep*60) {
                if($_SESSION[TheRefresh]['num'] >= TimeQuantum){
                    $this->api_error(ApiCodeOptions[ApiCodeTheRequestIsFrequent],ApiCodeTheRequestIsFrequent);
                }else{
                    $_SESSION[TheRefresh]['num']++;
                }
            }else {
                $_SESSION[TheRefresh] = [
                    'time'=>time(),
                    'num'=>1
                ];
            }
        }else {
            $_SESSION[TheRefresh] = [
                'time'=>time(),
                'num'=>1
            ];
        }
        Header(TheRefresh.":".$_SESSION[TheRefresh]['num']);
    }
}
