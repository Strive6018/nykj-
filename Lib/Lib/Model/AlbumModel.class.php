<?php
import('feifeicms.Action.Api.Traits.ApiModelAction');

class AlbumModel extends ApiModelAction {
    // 查询多个数据
    public function ff_select_page($id){
        $data = $this->field('invited_id')->where(array('be_invited_id'=>$id))->select();
        return $data;
    }
}
?>
