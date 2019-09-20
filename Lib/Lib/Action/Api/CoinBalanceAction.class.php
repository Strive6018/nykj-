<?php

/**
 * 用户金币余额接口
 * Class CoinBalanceAction
 */
class CoinBalanceAction extends ApiAction
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model['User'] = D('User');
        $this->model['InvitedList'] = D('InvitedList');
        $this->model['UserSign'] = D('UserSign');
    }
    /**
     * 验证层
     */
    private function validate(){

    }

    /**
     * 逻辑层
     */
    private function  handle(){
        //查询该用户的信息
        $user_data = $this->model['User']->where(['user_id'=>$this->user_id])->find();
        //用户金币数
        $data['coin'] = $user_data['user_score'];
        //是否VIP
        $data['vip'] = $user_data['is_vip'];
        //vip开始时间
        $data['vip_start'] = $user_data['start_vip'];
        //vip结束时间
        $data['vip_end'] = $user_data['end_vip'];
        //邀请的人数
        $data['inviteCount'] = $this->model['InvitedList']->where(['be_invited_id'=>$this->user_id])->count();
        //连续签到天数
        $obj = $this->model['UserSign']->where(['user_id'=>$this->user_id])->order('created_at desc')->find();
        $data['checkInDaysCont']= $obj['continuous_days'];
        $this->data = $data;
    }
    private function response(){
        $this->success($this->data);
    }

    public function index(){
        $this->validate();
        $this->handle();
        $this->response();
    }

}
