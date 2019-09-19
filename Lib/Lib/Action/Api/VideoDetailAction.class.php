<?php

/**
 * 获取视频详情数据
 * Class VideoDetailAction
 */
class VideoDetailAction extends ApiAction
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
        if(empty($this->request['videoId'])){
            $this->api_error('videoId必须填写');
        }
        if(!preg_match("/^[1-9][0-9]*$/",$this->request['videoId'])){
            $this->api_error('videoId必须为整型');
        }
    }

    /**
     * 逻辑层
     */
    private function  handle(){
        $field='
        vod_id as videoId,
        vod_name as title,
        vod_reurl as source,
        vod_type as type,
        vod_area as area,
        vod_year as year,
        vod_type as category,
        vod_content as introduction,
        vod_director as director,
        vod_actor as actor,
        vod_pic as imgUrl,
        vod_url as playUrl';
        $where='vod_id='.(int)$this->request['videoId'].'';
        $this->data = $this->model->ff_find($field,$where,false,false,false);
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
