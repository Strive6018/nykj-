<?php
/**
 * Api常用常量定义
 */
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
