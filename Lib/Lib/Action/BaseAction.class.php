<?php
/*****************后台公用类库 继承全站公用类库*******************************/
class BaseAction extends AllAction{
	//构造
  public function _initialize(){
	  parent::_initialize();
		//检查登录
		if (!$_SESSION[C('USER_AUTH_KEY')]) {
			$this->assign('jumpUrl',C('cms_admin').'?s=Admin-Login');
			$this->error('对不起，您还没有登录，请先登录！');
		}
		//检查权限 不需要验证操作的除外
		if (!in_array(strtolower(ACTION_NAME),explode(',',C('NOT_AUTH_ACTION')))) {
			// 检索当前模块是否需要认证
			$model_id = array_search(MODULE_NAME,explode(',',C('REQUIRE_AUTH_MODULE')));
			if (is_int($model_id)) {
				$usertype = explode(',',$_SESSION['admin_ok']);
				if (!$usertype[$model_id]) {
					$this->error('对不起，您没有管理该模块的权限，请联系超级管理员授权！');
				}
			}
		}
  }
}
?>