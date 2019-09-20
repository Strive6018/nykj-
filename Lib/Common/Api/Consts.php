<?php
/**
 * Api常用常量定义
 */
//-----------api返回状态-----------------
const ApiCodeOptions = [
    10000=>'成功',
    10001=>'参数错误',
    10002=>'api_token错误',
    10003=>'api_token已过期',
    10004=>'系统错误',
    10005=>'目标不存在或已被删除',
    10006=>'没有权限',
    10007=>'失败',
    10008=>'拒绝访问'
];
//成功
const ApiCodeSucceed = 10000;
//参数错误
const ApiCodeParameterError = 10001;
//api_token错误
const ApiCodeApiTokenError = 10002;
//api_token已过期
const ApiCodeOutOfDate = 10003;
//系统错误
const ApiCodeSystemError = 10004;
//目标不存在或已被删除
const ApiCodeInexistence = 10005;
//没有权限
const ApiCodeForbidden = 10006;
//失败
const ApiCodeFailure = 10007;
//拒绝访问
const ApiCodeAccessDenied = 10008;

//-----------系统设置-------------------
const SystemSetup = [
    'Sms'=>'Sms'
];

//-----------Sms平台设置----------------

//腾讯云SMS标识
const SmsTencent = 'Tencent';
//Sms集合
const Sms = [
    SmsTencent,
];

//-----------数据库缓存设置--------------

//数据库缓存时间
const Cachetime = 86400;
//-----------视频状态-------------------
const VodStutas = [
    1=>'正常',
    0=>'禁用',
];
//视频 正常状态码
const VodStutasNormalCode = 1;
//视频 禁用状态码
const VodStutasProhibitCode = 0;

//-----------Api路由设置----------------
//Api路由缓存名称
const ApiRouteCacheName = 'ApiRouteCache';
//Api路由缓存时间
const ApiRouteCacheTime = 86400;
//接口api_token请求参数名称
const ApiTokenName = 'api_token';
//用户api_token缓存时间
const ApiTokenCacheTime = 86400;
//用户api_token过期时间(单位：天)
const ApiTokenOvertime = 30;

//-----------验证码模块---------------
//短信验证码缓存时间
const VerificationCodeCacheTime = 180;
