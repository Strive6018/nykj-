<?php
import('feifeicms.Action.Api.Repository.ApiModelAction');

/**
 * todo::新增表模型 邀请人表
 * Class InvitedListModel
 */
class InvitedListModel extends ApiModelAction {
    // 查询多个数据
    public function ff_select_page($id){
        $data = $this->field('invited_id')->where(array('be_invited_id'=>$id))->select();
        return $data;
    }

}
?>
