<?php

/**
 * 播放记录接口类
 * Class RecordAction
 */
class RecordAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model=D("Record");
        $this->viewModel = D("RecordView");
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
        $where = 'record_uid = 2';
        $params = [
            'page_is'=>true,
            'field'=>'record_id as id,vod_id as videoId,
            vod_name as title,vod_type as type,vod_area as area,
            vod_year as year,vod_type as category,vod_content as vod_content,
            vod_director as director,vod_actor as actor,vod_pic as imgUrl,
            vod_title as updateText,vod_isend as isEnd,vod_addtime as createTime,
            vod_hits_lasttime as playTime'
        ];

        $this->data =  $this->viewModel->ff_select_page($params,$where);
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
