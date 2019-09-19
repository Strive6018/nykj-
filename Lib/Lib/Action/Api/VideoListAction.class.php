<?php

/**
 * 视频列表
 * Class UserRegisterAction
 */
class VideoListAction extends ApiAction
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
