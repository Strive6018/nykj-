<?php

/**
 * 视频收藏状态接口类
 * Class FavoritesStatusAction
 */
class FavoritesStatusAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model=D("Collect");
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
        $this->data=$this->model->Collect_status(2,$this->request['VideoId']);
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
