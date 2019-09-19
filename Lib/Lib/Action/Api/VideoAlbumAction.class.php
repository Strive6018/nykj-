<?php

/**
 * 发现页专辑详情
 * Class VideoAlbumAction
 */
class VideoAlbumAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model['album'] = D('Album');
        $this->model['vod'] = D('Vod');
    }
    /**
     * 验证层
     */
    private function validate(){
        if (empty($this->request['albumId']))
        {
            $this->api_error('albumId不存在');
        }
        if (preg_match("/^//d+$/",$this->request['albumId']))
        {
            $this->api_error('必须是正整数');
        }
    }

    /**
     * 逻辑层
     */
    private function  handle(){
         $data = $this->model['album']->where('ff_album.albumId='.$this->request['albumId'])
                           ->field('albumId,Title as albumTitle')
                           ->find();
         $temp['albumId'] = $data['albumId'];
         $temp['albumTitle'] = $data['albumTitle'];
         $temps = [];
         $field = implode(',',[
                'vod_id videoId',
                'vod_name title',
                'vod_reurl source',
                'vod_type category',
                'vod_area area',
                'vod_year year',
                'vod_content introduction',
                'vod_director director',
                'vod_pic imgUrl',
                'vod_stars priority',
                'vod_status del',
                'vod_cid type'
             ]);
         $data_list = $this->model['vod']
                   ->field($field)
                   ->where('vod_album_id='.$data['albumId'])->select();
         foreach ($data_list as $k => $v)
         {
             array_push($temps,$v);
         }
         $temp['videoList'] = $temps;
         $this->data = $temp;
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
