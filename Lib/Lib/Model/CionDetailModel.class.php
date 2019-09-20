<?php
import('feifeicms.Action.Api.Repository.ApiModelAction');

/**
 * todo::新增表模型
 * 金币明细表
 * Class CionDetailModel
 */
class CionDetailModel extends ApiModelAction {

        public function index($user_id){
            $data=[
                'user_id'=>$user_id,
                'description'=>UserCoinListType[UserCoinCheckin]['taskName'],
                'coin'=>UserCoinListType[UserCoinCheckin]['coin'],
                'action'=>UserCoinCheckin,
                'type'=>UserCoinListType[UserCoinCheckin]['type'],
                'createtime'=>time()
            ];
            $infs = $this->add($data);
            if(!$infs){
                return false;
            }
            return $infs;
        }
        public function add_invite($data){
            $infs = $this->add($data);
            if(!$infs){
                return false;
            }
            return $infs;
        }
}
?>
