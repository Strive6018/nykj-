<?php

class Upload{
    private $path="Uploads";   //文件上传目录
    private $max_size; //上传文件大小限制
    private $errno;  //错误信息号
    private $mime = array('image/jpeg','image/png','image/gif');//允许上传的文件类型

    /**
     * 构造函数,
     * @access public
     * @param $path string 上传的路径
     */
    public function __construct(){
        $this->max_size = 1000000;
    }

    /**
     * 文件上传的方法
     */
    public function up($file){
        import("ORG.Net.UploadFile");
        $upload = new UploadFile();
        $upload->maxSize = 3145728 ;
        $upload->allowExts = array('jpg', 'gif', 'png', 'jpeg');
        $upload->savePath = './Uploads/';
        if(!$upload->upload()) { // 上传错诣 提示错诣信息
            return ['status'=>true,'message'=>$upload->getErrorMsg()];
        }else{ // 上传成功 获叏上传文件信息
            $info = $upload->getUploadFileInfo();
            return ['status'=>true,'message'=>'上传成功','data'=>$info];
        }
    }
}
