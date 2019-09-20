<?php

/**
 * 金币明细接口类
 * Class CoinListAction
 */
class CoinListAction extends ApiAction
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model = D('CionDetail');
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
        $params =  implode(',',[
            'user_id as id',
            'createtime',
            'type',
            'coin',
            'action',
            'description'
        ]);
        $this->data=$this->model->field($params)->where(array('user_id'=>$this->user_id))->select();
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
