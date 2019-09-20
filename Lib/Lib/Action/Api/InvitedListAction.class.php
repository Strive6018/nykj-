<?php

/**
 * 我邀请的用户列表
 * Class InvitedListAction
 */
class InvitedListAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model['invitedList'] = D('InvitedList');
        $this->model['invitedListView'] = D('InvitedListView');
        $this->model['user']= D('User');
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
        $where = "be_invited_id=$this->user_id";
        $_data = $this->model['invitedList']->where($where)->select();
        $id_arr = [];
        for( $i=0;$i<count($_data);$i++)
        {
            array_push($id_arr,$_data[$i]['invited_id']);
        }
        $params =  implode(',',[
            'user_name as name',
            'user_id as userId',
            'ff_invited_list.create_time as date'
        ]);
        $where_s['ff_user.user_id'] = ['in',$id_arr];
        $this->data = $this->model['user']->field($params)->where($where_s)->join(['ff_invited_list ON ff_invited_list.invited_id = ff_user.user_id'])->select();
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
