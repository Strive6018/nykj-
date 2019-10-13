<?php

/**
 * 视频解析
 * Class BannerAction
 */
class ParsePlayAction extends ApiAction
{

    public function _initialize()
    {
        parent::_initialize();

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
        $key = "123456";
        $sign = md5($key+"|"+$this->request['timestamp'] + "|" +$this->request['deviceid']);
        if($this->request['sign']!=$sign){
            $this->api_error('系统错误!');
        }
       $data['item'] = [
           'mediaName'=>"高清",
           'mediaUrl'=>"http://74t.top/?url=".$this->request['url'],
           'mediaDuration'=>4,
           'mediaDuration'=>null,
           'mediaResolution'=>"HD",
           'headers'=>[
             'Referer'=>'http://74t.top/?url=',
             'User-Agent'=>'杨烽',
           ]
       ];
        $this->data = $data;
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
