<?php
import('feifeicms.Action.Api.Repository.ApiModelAction');

class SystemSetupModel extends ApiModelAction
{
    // 主键名称
    protected $pk  = 'keyword';

    public function system_setup_get($field = '*',$where = array()){
        //缓存key解密
        $cache_name = $this->cache_key_set($field,$where);
        //优先缓存读取数据
        $cache_info = S($cache_name);

        if($cache_info){
            return $cache_info;
        }else{
            $data = $this->field($field)->where($where)->find();
            if($data){
                S($cache_name,$data,Cachetime);
                return $data;
            }
        }

        return false;
    }
}
