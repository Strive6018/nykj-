<?php

/**
 * todo::新增表模型
 * 收藏视频表
 * Class CollectModel
 */
class CollectModel extends Model {
    /*
     * 收藏视频
     */
	 public function Collect($user_id,$videoId){
	     $data = $this->where(array('uid'=>$user_id,'vod_id'=>$videoId))->find();
	     if($data){
            return false;
         }
	     $date = array(
             'uid'      => $user_id,
             'vod_id'  => $videoId,
             'add_time' => time(),
         );
	     $infs = $this->add($date);
	     if($infs){
            return $infs;
         }
     }

    /*
     * 收藏视频列表
     */
    public function  Collect_list($params,$user_id){
        $data = $this->field('vod_id')->where(array('uid'=>$user_id))->select();
        $id_arr = [];
        for( $i=0;$i<count($data);$i++)
        {
            array_push($id_arr,$data[$i]['vod_id']);
        }
        $where_s['ff_vod.vod_id'] = ['in',$id_arr];
        $infs = D("Vod")->field($params)->where($where_s)->select();
        return $infs;

    }

     /*
      * 取消收藏视频
      */
     public function  Collect_delete($user_id,$videoId){
         $data = $this->where(array('uid'=>$user_id,'vod_id'=>$videoId))->delete();
        if($data){
            return $data;
        }
        return false;
     }
    /*
     * 视频收藏状态
     */
    public function Collect_status($user_id,$videoId){
        if($this->where(array('uid'=>$user_id,'vod_id'=>$videoId))->find()){
            $data = array('videoId' =>$videoId,'favorite'=>1);
        }else{
            $data = array('videoId' =>$videoId,'favorite'=>0);
        }
        return $data;
    }
}
?>
