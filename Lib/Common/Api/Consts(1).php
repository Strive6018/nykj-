<?php
/**
 * Api常用常量定义
 */
//-----------api返回状态----------------//
const ApiCodeOptions = [
    10000=>'成功',
    10001=>'参数错误',
    10002=>'api_token错误',
    10003=>'api_token已过期',
    10004=>'系统错误',
    10005=>'目标不存在或已被删除',
    10006=>'没有权限',
    10007=>'失败',
];
const ApiCodeSucceed = 10000;
const ApiCodeParameterError = 10001;
const ApiCodeApiTokenError = 10002;
const ApiCodeOutOfDate = 10003;
const ApiCodeSystemError = 10004;
const ApiCodeInexistence = 10005;
const ApiCodeForbidden = 10006;
const ApiCodeFailure = 10007;

//-----------视频状态----------------//
const VodStutas = [
    1=>'正常',
    0=>'禁用',
];
const VodStutasNormalCode = 1;
const VodStutasProhibitCode = 0;

//-----------用户金币收支类型----------------//
const UserCoinListType = [
    0=>[
        'coin'=>100,
        'taskName'=>'邀请好友',
        'taskDesc'=>'美邀请一个用户注册,并输入您的邀请码,可以获得100个卧龙币',
        'type'=>1
    ],
    1=>[
        'coin'=>20,
        'taskName'=>'填写邀请码',
        'type'=>1
    ],
    2=>[
        'coin'=>5,
        'taskName'=>'签到',
        'taskDesc'=>'每天签到可以获得5个卧龙币',
        'type'=>1
    ],
    3=>[
        'coin'=>2,
        'taskName'=>'分享App',
        'taskDesc'=>'分享App可以获取10个卧龙币',
        'type'=>1
    ],
    4=>[
        'coin'=>2,
        'taskName'=>'分享视频',
        'taskDesc'=>'每日分享视频获得5个卧龙币',
        'type'=>1
    ],
    101=>[
        'coin'=>200,
        'taskName'=>'兑换1个月VIP',
        'type'=>0,
        'serviceId'=>101,
        'time'=>1

    ],
    102=>[
        'coin'=>500,
        'taskName'=>'兑换3个月VIP',
        'type'=>0,
        'serviceId'=>102,
        'time'=>3
    ],
    103=>[
        'coin'=>1000,
        'taskName'=>'兑换6个月VIP',
        'type'=>0,
        'serviceId'=>103,
        'time'=>6
    ],
    104=>[
        'coin'=>1500,
        'taskName'=>'兑换1年VIP',
        'type'=>0,
        'serviceId'=>104,
        'time'=>12
    ]
];

const UserCoinInviteCode = 0;
const UserCoinInvited = 1;
const UserCoinCheckin = 2;
const UserCoinShareApp = 3;
const UserCoinShareVideo = 4;
const UserCoinRedeemVipMonth = 101;
const UserCoinRedeemVip3Month = 102;
const UserCoinRedeemVip6Month = 103;
const UserCoinRedeemVip12Month = 104;

//-----------需要api_token验证的路由----------------//

const ApiTokenRoute = [
    //--获取banner图数据--//
    '/index.php?s=/api-banner-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--获取分类列表数据--//
    '/index.php?s=/api-typelist-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--获取视频详情数据--//
    '/index.php?s=/api-videodetail-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--获取搜索数据--//
    '/index.php?s=/api-search-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--获取视频推荐数据--//
    '/index.php?s=/api-suggest-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--获取发现页专辑接口数据--//
    '/index.php?s=/api-album-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--用户中心--//
    '/index.php?s=/api-user-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--用户签到接口--//
    '/index.php?s=/api-checkin-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--修改用户名称--//
    '/index.php?s=/api-username-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--修改用户密码--//
    '/index.php?s=/api-modifypassword-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--获取播放记录--//
    '/index.php?s=/api-record-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--删除播放记录--//
    '/index.php?s=/api-videodelete-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--收藏视频功能--//
    '/index.php?s=/api-favorites-index'=>[
    'method'=>'Get',
    'is'=>false
    ],
    //--获取收藏列表--//
    '/index.php?s=/api-favoriteslist-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--取消收藏视频功能--//
    '/index.php?s=/api-favoritesdelete-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--视频收藏状态功能--//
    '/index.php?s=/api-favoritesstatus-index'=>[
    'method'=>'Get',
    'is'=>false
    ],
    //--首页数据--//
    '/index.php?s=/api-home-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--填写邀请码--//
    '/index.php?s=/api-input-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--用户注册--//
    '/index.php?s=/api-userregister-index'=>[
        'method'=>'Get',
        'is'=>false
    ],

    //--我邀请的用户列表--//
    '/index.php?s=/api-invitedlist-index'=>[
        'method'=>'Get',
        'is'=>false
    ],


    //--发现页专辑接口--//
    '/index.php?s=/api-albumlist-index'=>[
        'method'=>'Get',
        'is'=>false
    ],

    //--发现页专辑详情--//
    '/index.php?s=/api-videoalbum-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--发现页分类列表--//
    '/index.php?s=/api-videotypelist-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--任务中心--//
    '/index.php?s=/api-tasklist-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--金币明细--//
    '/index.php?s=/api-coinlist-index'=>[
    'method'=>'Get',
    'is'=>false,
    ],
    //--可兑换列表--//
    '/index.php?s=/api-redeemlist-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--兑换VIP--//
    '/index.php?s=/api-duyvip-index'=>[
    'method'=>'Get',
    'is'=>false
    ],
];
