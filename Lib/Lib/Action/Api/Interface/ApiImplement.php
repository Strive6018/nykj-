<?php

interface ApiInterface{
    /**
     * 验证输入数据的合法性等
     */
    public function validate();

    /**
     * 处理业务逻辑
     */
    public function handle();

    /**
     * 数据处理、数据返回
     * @return array
     */
    public function response();

    /**
     * 执行
     * @return mixed
     */
    public function index();

}
