<?php

/**
 * 视频分类列表接口
 * Class VideoTypeListAction
 */
class VideoTypeListAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model['list'] = D('List');
        $this->model['vod'] = D('Vod');
    }
    /**
     * 验证层
     */
    private function validate(){
        //检查类型是否正确
        if(!isset($this->request['type']) || !is_numeric($this->request['type']) || empty(($this->model['list']->field('list_id')->find($this->request['type'])))){
            $this->api_error();
        }
        //验证区域是否正确
        if(isset($this->request['area'])){
            if(!in_array($this->request['area'],explode(',',C('play_area')))) $this->api_error();
        }
        //验证年份
        if(isset($this->request['year'])){
            //验证区域是否正确
            if(!in_array($this->request['year'],explode(',',C('play_year')))) $this->api_error();
        }

    }

    /**
     * 逻辑层
     */
    private function  handle(){
        $this->data['area'] = explode(',',C('play_area'));
        $this->data['year'] = explode(',',C('play_year'));
        if(!isset($this->request['page']) || empty($this->request['page'])){
            $this->request['page'] = 1;
        }
        $params['page_id'] = $this->request['page'];
        $params['page_is'] = true;
        $params['page_p'] = $this->request['page'];
        $params['limit'] = $this->request['size'];
        $params['field'] = implode(',',[
            'vod_id id',
            'vod_id videoID',
            'vod_name title',
            'vod_cid type',
            'vod_area area',
            'vod_year year',
            'vod_type category',
            'vod_content introduction',
            'vod_director director',
            'vod_actor actor',
            'vod_pic imgUrl',
            'vod_continu updateText',
            'vod_status isEnd',
            'vod_hits priority',
            'vod_addtime createTime',


        ]);
        $params['order'] = 'vod_hits';
        $params['sort'] = 'desc';
        $where['vod_cid'] = $this->request['type'];
        //满足条件增加区域条件
        if($this->request['area'])$where['vod_area'] = $this->request['area'];
        //满足条件增加年份条件
        if($this->request['year'])$where['vod_year'] = $this->request['year'];
        $this->data['totalCount'] = $this->model['vod']->ff_select_count($where);
        $this->data['totalPages'] = ceil($this->data['totalCount'] /$params['limit']);
        $this->data['page'] = $this->request['page'];
        if($this->data['page'] > $this->data['totalPages']){
            $this->data['items'] = [];
        }else{
            $this->data['items'] = $this->model['vod']->ff_select_page($params,$where);
        }

        if($this->request['page']==1){
            $this->data['isFirst'] = true;
        }else{
            $this->data['isFirst'] = false;
        }
        if($this->data['totalPages'] == $this->request['page']){
            $this->data['isLast'] = true;
        }else{
            $this->data['isLast'] = false;
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
