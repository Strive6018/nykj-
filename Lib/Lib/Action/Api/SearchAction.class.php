<?php

/**
 * 获取搜索数据
 * Class SearchAction
 */
class SearchAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model=D("Vod");
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
        $params['field'] = '
        vod_id as videoId,
        vod_name as title,
        vod_reurl as source,
        vod_status as type,
        vod_area as area,
        vod_year as year,
        vod_type as category,
        vod_content as introduction,
        vod_director as vod_director,
        vod_actor as actor,
        vod_pic as imgUrl';
        $params['limit'] = '';
        $params['cache_name'] ='';
        $params['cache_time']= '';
        $params['page_id'] = '';
        $params['page_is'] = true;
        $params['page_p'] = '';
        $where['vod_name'] = array('like','%'.$this->request['keyword'].'%');
        $this->data = $this->model->ff_select_page($params,$where);
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
