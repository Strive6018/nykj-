<?php
class ApiExceptionAction extends Exception{
    public function __construct($message,$code=0,$extra=false)
    {
        parent::__construct($message,$code);
    }
}
