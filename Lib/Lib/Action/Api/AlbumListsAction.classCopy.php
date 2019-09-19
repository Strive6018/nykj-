<?php
/**
 * 发现页专辑接口
 * Class AlbumListAction
 */
class AlbumListsAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model = D('Album');
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
        $this->data = $this->model->field('imgurl,albumId as id,title')->select();
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
