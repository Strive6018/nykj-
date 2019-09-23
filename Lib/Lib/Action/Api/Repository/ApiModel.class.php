<?php
require_once APP_PATH.'./Common/Api/Consts.php';
class ApiModel extends RelationModel
{
    protected function _initialize()
    {
        parent::_initialize();

    }

    /**
     * 缓存key加密
     */
    protected function cache_key_set($field,$where){
        if(is_array($where)) $where = array_shift($where);
        return'Strive_'.md5("$where (string)$field)");
    }
    /**
     * 通用分页
     */
//    public function page($where,$model,$params,$model_viwe)
//    {
//        $data = [];
//        $data['totalCount'] = $model->ff_select_counts($where);
//        $data['totalPages'] = ceil($data['totalCount'] /$params['limit']);
//        $data['page'] = $params['page_id'];
//        if($data['page'] > $data['totalPages']){
//            $data['items'] = [];
//        }else{
//            $data['items'] = $model->ff_select_pages($params,$where,$model_viwe);
//        }
//        if($params['page']==1){
//            $data['isFirst'] = true;
//        }else{
//            $data['isFirst'] = false;
//        }
//        if($data['totalPages'] == $params['page']){
//            $data['isLast'] = true;
//        }else{
//            $data['isLast'] = false;
//        }
//        return $data;
//    }
}
