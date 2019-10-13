<?php
class  IsCheckApiToken extends ApiAction
{
    public function __construct()
    {
        S(ApiRouteCacheName,NULL);
        if(!S(ApiRouteCacheName)){
            S(ApiRouteCacheName,include(APP_PATH.'./Common/Api/route.php'),ApiRouteCacheTime);
        }
    }

    /**
     * 验证路由
     */
    private function IsCheckRoute(){
        //路由强制https
        if(strtolower($_SERVER['REQUEST_SCHEME']) != 'https'){
            $this->api_error(ApiCodeOptions[ApiCodeAccessDenied],ApiCodeAccessDenied);
        }
        //检查提交方式是否正确
        if(!isset(S(ApiRouteCacheName)[__ACTION__]) ||
            strtolower(S(ApiRouteCacheName)[__ACTION__]['method']) != strtolower($_SERVER["REQUEST_METHOD"])){
            return ApiCodeAccessDenied;

        }
        if(S(ApiRouteCacheName)[__ACTION__]['is'] === true){
            $api_token = $this->getHeader();
            if(!isset($api_token['API-TOKEN'])){
                return ApiCodeAccessUserLogin;
            }
            return D('User')->inspection_apitoken($api_token['API-TOKEN']);
        }
        return true;

    }
    private function getHeader() {
        $headers = array();
        foreach ($_SERVER as $key => $value) {
            if ('HTTP_' == substr($key, 0, 5)) {
                $headers[str_replace('_', '-', substr($key, 5))] = $value;
            }
            if (isset($_SERVER['PHP_AUTH_DIGEST'])) {
                $header['AUTHORIZATION'] = $_SERVER['PHP_AUTH_DIGEST'];
            } elseif (isset($_SERVER['PHP_AUTH_USER']) && isset($_SERVER['PHP_AUTH_PW'])) {
                $header['AUTHORIZATION'] = base64_encode($_SERVER['PHP_AUTH_USER'] . ':' . $_SERVER['PHP_AUTH_PW']);
            }
            if (isset($_SERVER['CONTENT_LENGTH'])) {
                $header['CONTENT-LENGTH'] = $_SERVER['CONTENT_LENGTH'];
            }
            if (isset($_SERVER['CONTENT_TYPE'])) {
                $header['CONTENT-TYPE'] = $_SERVER['CONTENT_TYPE'];
            }
        }
        return $headers;
    }
    /**
     * 执行
     */
    public function execute(){
         return $this->IsCheckRoute();
    }
}
