<?php

/**
 * 用户分享完成调用接口
 * Class CoinListAction
 */
class CoinReportAction extends ApiAction
{
    public function _initialize()
    {
        parent::_initialize();
    }
    /**
     * 验证层
     */
    private function validate(){
        if(empty($this->request['taskType'])){
            $this->api_error();
        }
    }

    /**
     * 逻辑层
     */
    private function  handle(){
        $data =UserCoinListType[$this->request['taskType']];
        if(!empty($this->user_id)){
            D("User")->setInc('user_score','user_id='.$this->user_id,$data['coin']);
            $infs = [
                'createtime'=>time(),
                'type'=>$data['type'],
                'coin'=>$data['coin'],
                'action'=>$this->request['taskType'],
                'description'=>$data['taskName'],
                'user_id'=>$this->user_id
            ];
            $this->data = D("CionDetail")->add($infs);
        }else{
            $this->success($this->data,'成功');
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

    /**
     * 通用分页
     */
    private function page($where,$model,$params,$model_viwe)
    {
        $data = [];
        $data['totalCount'] = $model->ff_select_counts($where);
        $data['totalPages'] = ceil($data['totalCount'] /$params['limit']);
        $data['page'] = $params['page_id'];
        if($data['page'] > $data['totalPages']){
            $data['items'] = [];
        }else{
            $data['items'] = $model->ff_select_pages($params,$where,$model_viwe);
        }
        if($params['page']==1){
            $data['isFirst'] = true;
        }else{
            $data['isFirst'] = false;
        }
        if($data['totalPages'] == $params['page']){
            $data['isLast'] = true;
        }else{
            $data['isLast'] = false;
        }
        return $data;
    }

}
