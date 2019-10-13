<?php

/**
 * 文件上传
 * Class UserNameAction
 */
class FilesUploadAction extends ApiAction
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
        import('feifeicms.Action.api.Repository.Upload');
        $Upload = new Upload();
        $this->data = $Upload->up();
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
