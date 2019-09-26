<?php

/**
 * 金币明细接口类
 * Class CoinListAction
 */
class CoinListAction extends ApiAction
{
    public function _initialize()
    {
        parent::_initialize();
        $this->model = D('CionDetail');
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
        $params['page_id'] = $this->request['page'];
        $params['page_is'] = true;
        $params['limit'] = $this->request['size'];
        $params['page_p'] = $this->request['page'];
        $params['page'] = $this->request['page'];
        $where = array('user_id '=>$this->user_id);
        $this->data = $this->page($where,$this->model,$params);
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
