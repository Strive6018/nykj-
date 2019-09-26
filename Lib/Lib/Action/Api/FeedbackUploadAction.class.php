<?php

/**
 * App填写邀请码接口类
 * Class InputAction
 */
class FeedbackUploadAction extends ApiAction
{
    protected $user_id = 1;
    public function _initialize()
    {
        parent::_initialize();
    }
    /**
     * 验证层
     */
    private function validate(){
        //不为空的参数判断
        if (empty($this->request['question']) || empty($this->request['qq'])
            || empty($this->request['text']) || empty($this->request['platform'])
            || empty($this->request['deviceid']) || empty($this->request['contact'])
            || empty($this->request['version']))
            $this->api_error();
        $mode = '/^((?!\/).)*\d{3}-\d{8}((?!\/).)*$|^((?!\/).)*\d{4}-\d{7}((?!\/).)*$|^((?!\/).)*\d{11}((?!\/).)*$/';
        if(!preg_match($mode,$this->request['contact'])){
            $this->api_error("手机号格式不正确!");
        }
        $modes = '/^[1-9][0-9]{4,9}$/';
        if(!preg_match($modes,$this->request['qq'])){
            $this->api_error("qq格式不正确!");
        }
    }

    /**
     * 逻辑层
     */
    private function  handle(){
        /**
         * 用户ID未填写为匿名用户 0
         */
        if (empty($this->request['userid']))
             $this->request['userid'] = 0;
        $data = [
            'question'=>$this->request['question'],
            'qq'=>$this->request['qq'],
            'text'=>$this->request['text'],
            'platform'=>$this->request['platform'],
            'deviceid'=>$this->request['deviceid'],
            'contact'=>$this->request['contact'],
            'version'=>$this->request['version'],
            'user_id'=>$this->request['userid']
        ];
        if(!$this->data= D("FeedbackUpload")->add($data)){
            $this->api_error("提交失败,请稍后重试");
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
