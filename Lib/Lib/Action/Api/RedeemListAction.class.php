<?php
/**
 * 可兑换列表
 * Class RedeemListAction
 */
class RedeemListAction extends ApiAction
{
    public function _initialize()
    {
        parent::_initialize();

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
        $data = UserCoinListType;
        $temp  = [];
        foreach ($data as $k=>$v)
        {
            if($v['type']==0)
            {
                array_push($temp,$v);
            }
        }
        $this->data= $temp;
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
