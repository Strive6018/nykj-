<?php

/**
 * 取消收藏接口
 * Class FavoritesDeleteAction
 */
class FavoritesDeleteAction extends ApiAction
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
        $this->data = $this->model->Collect_delete($this->user_id,$this->request['VideoId']);
        if($this->data==false){
            $this->api_error("取消失败");
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
