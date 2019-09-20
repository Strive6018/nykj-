<?php

/**
 * App填写邀请码接口类
 * Class InputAction
 */
class InputAction extends ApiAction
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model['User'] = D('User');
        $this->model['InvitedList'] = D('InvitedList');
    }
    /**
     * 验证层
     */
    private function validate(){
        if(empty($this->request['code'])){
            $this->api_error('code必须填写');
        }
        if(!preg_match("/^[A-Z]{2}[0-9]{5}$/",$this->request['code'])){
            $this->api_error('code必须前2个为大写字母后面5个为数字');
        }
        if(!D('User')->where(array('code'=>$this->request['code']))->find()){
            $this->api_error('邀请码无效');
        }
        $user = $this->model['User']->where("user_id=$this->user_id")->find();
        if($user['is_ask']==1)
        {
            $this->api_error('该用户已经填写邀请码了');
        }
    }

    /**
     * 逻辑层
     */
    private function  handle(){
        try{
            //开启事务
            $this->model['User']->startTrans();
            //我的邀请人
            $this->model['User']->setInc('user_score',['code'=>$this->request['code']],UserCoinListType[UserCoinInviteCode]['coin']);
            $id = $this->model['User']->where(array('code'=>$this->request['code']))->find();
            $infs = [
                'invited_id'=>$this->user_id,
                'be_invited_id'=>$id['user_id'],
                'create_time'=>time()
            ];
            $this->model['InvitedList']->add($infs);
            //填写邀请码插入用戶明细表
            $data = [
                    'user_id'=>$this->user_id,
                    'description'=>UserCoinListType[UserCoinInviteCode]['taskName'],
                    'coin'=>UserCoinListType[UserCoinInviteCode]['coin'],
                    'action'=>UserCoinInviteCode,
                    'type'=>UserCoinListType[UserCoinInviteCode]['type'],
                    'createtime'=>time()
            ];

            //被邀请人插入用戶明细表
            $datas= [
                'user_id'=>$id['user_id'],
                'description'=>UserCoinListType[UserCoinInvited]['taskName'],
                'coin'=>UserCoinListType[UserCoinInvited]['coin'],
                'action'=>UserCoinInvited,
                'type'=>UserCoinListType[UserCoinInvited]['type'],
                'createtime'=>time()
            ];
            D("CionDetail")->add_invite($data);
            D("CionDetail")->add_invite($datas);
            //用户
            $this->model['User']->setInc('user_score','user_id='.$this->user_id,UserCoinListType[UserCoinInvited]['coin']);
            //提交事务
            $this->model['User']->commit();
        }catch (Exception $e){
            //事务回滚
            $this->model['User']->rollback();
            $this->api_error($e->getMessage());
        }


        if(!$this->model['User']->where(array('user_id'=>$this->user_id))->save(array('is_ask'=>1))){
            $this->api_error("填写失败");
        }
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
