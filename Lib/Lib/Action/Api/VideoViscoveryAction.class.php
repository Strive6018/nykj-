<?php

/**
 * 发现页数据接口
 * Class VideoViscoveryAction
 */
class VideoViscoveryAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model['findInfo'] = D('FindInfo');
        $this->model['vod'] = D('Vod');
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
            if(empty($this->request['page'])){
                $this->request['page'] =1;
            }
            if(empty($this->request['size'])){
                $this->request['size'] =20;
            }
            $data = $this->model['findInfo']->limit($this->request['size'])->page($this->request['page'])->select();
            $temp = [];
            $value = null;
            foreach ($data as $k=>$v)
            {
                $prams = implode(',',[
                    'vod_id as videoId',
                    'vod_name as title',
                    'vod_pic as imgUrl',
                    'vod_status as del'
                ]);
                $_data = $this->model['vod']->field($prams)->where(['vod_find_id'=>$v['id']])->select();
                if($_data!=null)
                {
                    $value['albumId'] = $v['id'];
                    $value['albumTitle'] = $v['name'];
                    $value['videoCount'] = $this->model['vod']->field($prams)->where(['vod_find_id'=>$v['id']])->count();
                    $value['videoList'][] = $_data;
                    array_push($temp,$value);
                }
            }
            $this->data['count'] = $this->model['findInfo']->count();
            $this->data['totalPages'] = ceil($this->data['count']/$this->request['size']);
            $this->data['page'] = $this->request['page'];
            if($this->request['page'] == 1)
                $this->data['first'] = true;
            else
                $this->data['first'] = false;

            if($this->request['page'] == $this->data['totalPages'])
                $this->data['last'] = true;
            else
                $this->data['last'] = false;

            $this->data['items'] = $temp;

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
