<?php

/**
 * 任务中心接口类
 * Class TaskListAction
 */
class TaskListAction extends ApiAction
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
        if($v['type']==1 && $v['taskName']!='填写邀请码')
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
