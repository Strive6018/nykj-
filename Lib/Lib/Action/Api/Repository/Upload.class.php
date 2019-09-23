<?php

class Upload{
    /**
     * 文件上传的方法
     */
    public function up(){
        import("ORG.Net.UploadFile");
        $upload = new UploadFile();
        $upload->maxSize = 3145728 ;
        $upload->allowExts = array('jpg', 'gif', 'png', 'jpeg');
        $upload->thumb = true;
        $upload->thumbMaxWidth = 200;
        $upload->thumbMaxHeight = 200;
        $upload->thumbPath = './Uploads/api/user_portrait/';
        $upload->thumbFile = md5(time());
        $upload->thumbRemoveOrigin =true;
        $upload->savePath = './Uploads/api/user_portrait/';
        $upload->saveRule = md5(time());
        if(!$upload->upload()) { // 上传错诣 提示错诣信息
            return ['status'=>true,'message'=>$upload->getErrorMsg()];
        }else{ // 上传成功 获叏上传文件信息
            $info = $upload->getUploadFileInfo();
            return ['status'=>true,'message'=>'上传成功','data'=>$info];
        }
    }
}
