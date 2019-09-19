<?php

/**
 * 兑换VIP接口
 * Class DuyvipAction
 */
class DuyvipAction extends ApiAction
{
    protected $user_id = 2;
    public function _initialize()
    {
        parent::_initialize();
        $this->model=D('User');
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
        $data =UserCoinListType[$this->request['serviceId']];
        if(!$data){
            $this->api_error();
        }
        $user_coin = $this->model->where(['user_id'=>$this->user_id])->find();
        if($user_coin['user_score']<$data['coin']){
            $this->api_error("金币不足,快去做任务吧!");
        }
        //金币剩余数量
        $sv_cion = $user_coin['user_score'] - $data['coin'];
        //当前时间戳
        $current_time = time();
        //兑换月份
        $moths =  $data['time'];
        //是否为已经开通了会员
        if($user_coin['end_vip']>$current_time){
            //已经开通过就不用更改开始时间,加上结束时间的时间戳
            //兑换月份后的时间戳
            $end_time = strtotime("+".$moths." month",strtotime(date("Y-m-d  H:i:s",$user_coin['end_vip'])));
            $data = [
                'user_score' => $sv_cion,
                'is_vip' => 1,
                'end_vip'=>$user_coin['end_time']+$end_time
            ];
        }else{
            //没有开通过
            //兑换月份后的时间戳
            $end_time = strtotime('+'.$moths.' months');
            $data = [
                'user_score' => $sv_cion,
                'is_vip' => 1,
                'start_vip'=>$current_time,
                'end_vip'=>$end_time
            ];
        }
        if(!$this->model->where(['user_id'=>$this->user_id])->save($data)){
           $this->api_error('兑换失败');
        }

        //拼装返回数据
        $return_data  = [
            'vipEnd'=>$end_time,
            'vipStart' => $current_time,
            'vpi'=>1,
            'coin'=>$sv_cion
        ];
        $this->data = $return_data;

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
