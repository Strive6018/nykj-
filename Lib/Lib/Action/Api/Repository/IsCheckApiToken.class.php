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
        //检查提交方式是否正确
        if(!isset(S(ApiRouteCacheName)[__ACTION__]) ||
            strtolower(S(ApiRouteCacheName)[__ACTION__]['method']) != strtolower($_SERVER["REQUEST_METHOD"])){
            return ApiCodeAccessDenied;

        }
        if(S(ApiRouteCacheName)[__ACTION__]['is'] === true){
            if(empty($_REQUEST[ApiTokenName])){
                return ApiCodeAccessUserLogin;
            }
            return D('User')->inspection_apitoken($_REQUEST[ApiTokenName]);
        }
        return true;

    }

    /**
     * 执行
     */
    public function execute(){
         return $this->IsCheckRoute();
    }
}
