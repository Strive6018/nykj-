<?php
import('feifeicms.Action.Api.Repository.ApiModel');

class AlbumModel extends ApiModel {
    // 查询多个数据
    public function ff_select_page($id){
        $data = $this->field('invited_id')->where(array('be_invited_id'=>$id))->select();
        return $data;
    }
}
?>
