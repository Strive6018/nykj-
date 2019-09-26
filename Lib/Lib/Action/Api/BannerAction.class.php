<?php

/**
 * 首页banner
 * Class BannerAction
 */
class BannerAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model = D('Slide');

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
        $params = [
            'page_is'=>false,
            'field'=>'slide_id as id,slide_oid,slide_cid,slide_name,slide_logo,slide_pic,slide_url,slide_content,slide_status'
        ];
        $where = 'slide_status=1';
        //获取banner
        $this->data['banenr'] = $this->model->ff_select_page($params,$where);
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
