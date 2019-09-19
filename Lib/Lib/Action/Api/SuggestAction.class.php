<?php

/**
 * 推荐视频接口
 * Class SuggestAction
 */
class SuggestAction extends ApiAction
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
        vod_pic as imgUrl,
        vod_title as updateText';
        $cate_name = $this->model->where(array('vod_id' =>(int)$this->request['videoId']))->getField('vod_type');
        $this->data = $this->model->field($params['field'])->where(array('vod_type'=>$cate_name))->limit(6)->order('rand()')->select();
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
