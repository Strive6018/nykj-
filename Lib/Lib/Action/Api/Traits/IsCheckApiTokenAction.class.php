<?php
class  IsCheckApiTokenAction
{
    public function __construct()
    {
        //检查缓存中是否存在
        if(!S(ApiRouteCacheName)){
            S(ApiRouteCacheName,include(APP_PATH.'./Common/Api/route.php'),ApiRouteCacheTime);
        }
    }

    /**
     * 验证路由
     */
    public function IsCheckRoute(){
//        $routeArray = S(ApiRouteCacheName);
        $routeArray = include(APP_PATH.'./Common/Api/route.php');
        var_dump($routeArray);die;
        if($routeArray[__ACTION__]['is'] === true){
            if(!isset($_REQUEST[ApiTokenName])){
                return false;
            }
        }
        return true;
    }
    /**
     * 验证Apitoken是否正确
     */
    public function IsCheckApiToken(){
        return D('User')->inspection_apitoken($_REQUEST[ApiTokenName]);
    }
}
