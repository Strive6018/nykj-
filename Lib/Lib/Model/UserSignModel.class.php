<?php
import('feifeicms.Action.Api.Repository.ApiModel');
/**
 * todo:: 新增表模型
 * 用户签到表
 */
class UserSignModel extends ApiModel {


	 public function checkin($user_id){
         $todayAt = strtotime(date('Y-m-d'));

         $where = array(
             'user_id' => $user_id,
             'sign_in_at' => array('EGT', $todayAt)
         );
         $exist = $this->where($where)->count();
         if ($exist > 0) {
             return 1;
         }
         $yesterdayAt = $todayAt - 86400;
         $where['sign_in_at'] = array('EGT', $yesterdayAt);
         $yesterdayRecord = $this->where($where)->order('sign_in_at desc')->find();
         $continuousDays = 1;
         if (!empty($yesterdayRecord)) {
             // 更新连续签到天数
             $continuousDays += $yesterdayRecord['continuous_days'];
         }
         $insertData = array(
             'user_id' => $user_id,
             'integral' => UserCoinListType[UserCoinCheckin]['coin'],
             'continuous_days' => $continuousDays,
             'sign_in_at' => time(),
         );
         $insertRet = $this->add($insertData);

         D("CionDetail")->index($user_id);
         if ($insertRet) {
             D("user")->setInc('user_score','user_id='.$user_id,UserCoinListType[UserCoinCheckin]['coin']);
             return $insertRet;
         }
          return 2;
     }
}
?>
