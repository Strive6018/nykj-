<?php

/**
 * App首页接口类
 * Class HomeAction
 */
class HomeAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model['List'] = D('List');
        $this->model['banner'] = D('Slide');
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
        $params =  implode(',',[
            'list_id as list_id',
            'list_title as list_title',
            'vod_id as videoId',
            'vod_name as name',
            'vod_pic as imgUrl',
            'vod_year as year',
            'vod_area as area',
            'vod_type as category',
            'vod_cid as type',
            'vod_content as introduction',
            'vod_director as director',
            'vod_actor as actor',
            'vod_continu as updateTest',
            'vod_status as del'
        ]);
        $where = 'ff_list.list_pid = 0 and ff_list.list_status=1';
        $list = $this->model['List']->field('list_id as albumId')->select();
        $this->data = $this->model['List']
            ->field($params)
            ->where($where)
            ->join(['ff_vod ON ff_list.list_id = ff_vod.vod_cid'])
            ->select();
        foreach ($list as $k=>&$v)
        {
            foreach ($this->data as $kk=>$vv)
            {
                $v['albumTitle'] = $vv['list_title'];
                $v['videoCount']=0;
                if($v['albumId'] == $vv['type'])
                {
                    unset($vv['list_id']);
                    unset($vv['list_title']);
                    if(!isset($v['videoList'][$kk]))$v['videoList'][$kk] = [];
                    switch ($vv['del']){
                        case VodStutasNormalCode:
                            $vv['del'] = true;
                            break;
                        case VodStutasProhibitCode:
                            $vv['del'] = false;
                            break;
                        default:
                            $vv['del'] = false;
                    }
                    $v['videoList'][$kk] += $vv;
                    $v['videoList'] = array_values($v['videoList']);

                }
            }
            $v['videoCount'] = count($v['videoList']);
        }
        $list[0]['banner'] = $this->banner();
        $this->data = $list;
    }


    private function response(){
        $this->success($this->data);
    }

    /**
     * 获取首页banner
     */
    private function banner(){
        $params = [
            'page_is'=>false,
            'field'=>'slide_id as videoId,slide_url as url,slide_pic as img,slide_name as title,slide_cid as type'
        ];
        $where = 'slide_status=1';
        //获取banner
        return $this->model['banner']->ff_select_page($params,$where);

    }
    public function index(){
        $this->validate();
        $this->handle();
        $this->response();
    }
}
