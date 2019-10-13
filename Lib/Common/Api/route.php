<?php
return [
    //--获取banner图数据--//
    '/index.php?s=/api-banner-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //发现页专辑
    '/index.php?s=/api-albumlist-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //用户签到接口
    '/index.php?s=/api-checkin-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //用户金币余额
    '/index.php?s=/api-coinbalance-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //金币明细
    '/index.php?s=/api-coinlist-index'=>[
        'method'=>'Get',
        'is'=>true,
    ],
    //兑换VIP
    '/index.php?s=/api-duyvip-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--收藏视频
    '/index.php?s=/api-favorites-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--取消收藏视频
    '/index.php?s=/api-favoritesdelete-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--获取收藏列表
    '/index.php?s=/api-favoriteslist-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--视频收藏状态
    '/index.php?s=/api-favoritesstatus-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--首页数据
    '/index.php?s=/api-home-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--填写邀请码
    '/index.php?s=/api-input-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--我邀请的用户列表--//
    '/index.php?s=/api-invitedlist-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--修改用户密码
    '/index.php?s=/api-modifypassword-index'=>[
        'method'=>'Post',
        'is'=>true
    ],
    //--用户忘记密码
    '/index.php?s=/api-forgetpassword-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--获取播放记录
    '/index.php?s=/api-record-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--插入播放记录--//
    '/index.php?s=/api-postrecord-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--可兑换列表
    '/index.php?s=/api-redeemlist-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--获取搜索数据
    '/index.php?s=/api-search-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--获取视频推荐数据
    '/index.php?s=/api-suggest-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--任务中心
    '/index.php?s=/api-tasklist-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--获取分类列表数据
    '/index.php?s=/api-typelist-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--获取分类列表数据
    '/index.php?s=/api-User-typelist-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--用户中心
    '/index.php?s=/api-User-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--修改用户名称
    '/index.php?s=/api-username-index'=>[
        'method'=>'Post',
        'is'=>true
    ],
    //--发现页专辑详情
    '/index.php?s=/api-videoalbum-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--删除播放记录
    '/index.php?s=/api-videodelete-index'=>[
        'method'=>'Post',
        'is'=>true
    ],
    //--发现页分类列表
    '/index.php?s=/api-videotypelist-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--意见反馈
    '/index.php?s=/api-feedbackupload-index'=>[
        'method'=>'Post',
        'is'=>true
    ],
    //--用戶消息--//
    '/index.php?s=/api-usermessage-index'=>[
        'method'=>'Get',
        'is'=>true
    ],

    //------------------------------------------------------------------------------------------

    //--获取banner
    '/index.php?s=/api-banner-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--获取视频详情数据
    '/index.php?s=/api-videodetail-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--用户注册
    '/index.php?s=/api-userregister-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--注册验证码发送
    '/index.php?s=/api-verificationcode-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--用户修改密码验证码发送
    '/index.php?s=/api-modifypasswordcode-index'=>[
        'method'=>'Get',
        'is'=>true
    ],
    //--用户忘记密码验证码发送
    '/index.php?s=/api-forgetpasswordcode-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--发现页数据--//
    '/index.php?s=/api-videoviscovery-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--用户分享完成调用接口--//
    '/index.php?s=/api-coinreport-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
    //--用户修改头像--//
    '/index.php?s=/api-updateportrait-index'=>[
        'method'=>'Post',
        'is'=>true
    ],
    //--用户退出登录--//
    '/index.php?s=/api-Logout-index'=>[
        'method'=>'Post',
        'is'=>true
    ],
    //--文件上传--//
    '/index.php?s=/api-filesupload-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--视频解析--//
    '/index.php?s=/api-parseplay-index'=>[
        'method'=>'Post',
        'is'=>false
    ],

    //--用户登录--//
    '/index.php?s=/api-usersign-index'=>[
        'method'=>'Post',
        'is'=>false
    ],
    //--剧集列表接口--//
    '/index.php?s=/api-videoplays-index'=>[
        'method'=>'Get',
        'is'=>false
    ],
];
