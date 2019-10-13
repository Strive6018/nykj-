<?php

/**
 * 收藏视频列表接口类
 * Class FavoritesListAction
 */
class FavoritesListAction extends ApiAction
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
        $params['field'] =  implode(',',[
            'vod_id as videoId',
            'vod_name as title',
            'vod_cid as type',
            'vod_area as area',
            'vod_year as year',
            'vod_type as category',
            'vod_content as introduction',
            'vod_director as vod_director',
            'vod_actor as actor',
            'vod_pic as vod_pic',
            'vod_title as updateText',
            'vod_isend as isEnd',
            'vod_hits as priority',
            'vod_addtime as createTime'
        ]);
        $params['page_id'] = $this->request['page'];
        $params['page_is'] = true;
        $params['limit'] = $this->request['size'];
        $params['page_p'] = $this->request['page'];
        $params['page'] = $this->request['page'];
        $where = array('uid'=>$this->user_id);
        $model_viwe = D("Vod");
        $this->data = $this->page($where,$this->model,$params,$model_viwe);
    }

    private function response(){
        $this->success($this->data);
    }

    public function index(){
        $this->validate();
        $this->handle();
        $this->response();
    }

    /**
     * 通用分页
     */
    private function page($where,$model,$params,$model_viwe)
    {
        $data = [];
        $data['totalCount'] = $model->ff_select_counts($where);
        $data['totalPages'] = ceil($data['totalCount'] /$params['limit']);
        $data['page'] = $params['page_id'];
        if($data['page'] > $data['totalPages']){
            $data['items'] = [];
        }else{
            $data['items'] = $model->ff_select_pages($params,$where,$model_viwe);
        }
        if($params['page']==1){
            $data['isFirst'] = true;
        }else{
            $data['isFirst'] = false;
        }
        if($data['totalPages'] == $params['page']){
            $data['isLast'] = true;
        }else{
            $data['isLast'] = false;
        }
        return $data;
    }
}
