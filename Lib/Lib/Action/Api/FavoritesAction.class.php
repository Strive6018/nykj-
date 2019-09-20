<?php

/**
 * 收藏视频接口类
 * Class FavoritesAction
 */
class FavoritesAction extends ApiAction
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
        if(empty($this->request['VideoId'])){
            $this->api_error("参数错误");
        }
    }

    /**
     * 逻辑层
     */
    private function  handle(){
        $this->data = $this->model->Collect($this->user_id,$this->request['VideoId']);
        if($this->data==false){
            $this->api_error("你以收藏过了");
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
