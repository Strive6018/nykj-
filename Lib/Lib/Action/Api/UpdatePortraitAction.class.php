<?php

/**
 * 修改用户昵称
 * Class UserNameAction
 */
class UpdatePortraitAction extends ApiAction
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
        import('feifeicms.Action.api.Repository.Upload');
        $Upload = new Upload();
        $data = $Upload->up();
        if($data['message']=="上传成功"){
            $in = $data['data'][0]['savepath'];
            $ins = $data['data'][0]['savename'];
            $infs  =$in.""."thumb_"."".$ins;
            if(!D("User")->where(array('user_id'=>$this->user_id))->save(array('user_face'=>$infs))){
                $this->api_error('操作失败!');
            }
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
