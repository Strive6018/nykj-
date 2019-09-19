<?php
require APP_PATH.'./Common/Api/Consts.php';

class ApiModelAction extends RelationModel
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
}
