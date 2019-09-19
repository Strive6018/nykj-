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
        $user_id = 2;
        if(empty($user_id)){
            $this->api_error("请先登录");
        }
    }

    /**
     * 逻辑层
     */
    private function  handle(){
        $user_id = 2;
        $params =  implode(',',[
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
        if(!$this->data = $this->model->Collect_list($params,$user_id)){
            $this->api_error("暂无数据");
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
