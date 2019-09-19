<?php
/**
 * 获取分类列表接口类
 * Class TypeListAction
 */
class TypeListAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model=D("Nav");
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
        $params=[
            'page_is'=>false,
            'field'=>'nav_id as id,nav_pid,nav_oid,nav_title,nav_tips,nav_link,nav_status,nav_target'
        ];
        $where='nav_status=1';
        $this->data['typelist'] = $this->model->ff_select_page($params,$where);
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
