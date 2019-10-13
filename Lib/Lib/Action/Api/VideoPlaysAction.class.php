<?php

/**
 * 剧集列表接口
 * Class BannerAction
 */
class VideoPlaysAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->model = D('Vod');

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
        $data = $this->model->where(array('vod_id'=>$this->request['videoId']))->find();
        $_data = explode("$$$",($data['vod_url']));

        $pattern = '/第[\w]+集\$/';
        $_arrs = preg_split($pattern, $_data[0]);
        unset($_arrs[0]);

        $temp = [];
        $temps = [];
        foreach ($_arrs as $k=>$v)
        {
                $temp['videoId']+=1;
                $temp['episode'] = 0;
                $temp['playUrl'] =$v;
                array_push($temps,$temp);
        }
        $this->data['plays'] = $temps;
        $this->data['videoId'] = $this->request['videoId'];
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
