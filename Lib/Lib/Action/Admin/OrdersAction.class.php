<?php
class OrdersAction extends BaseAction{	
  public function show(){
		$params = array();
		$params['field'] = '*';
		$params['limit'] = 20;
		$params['status'] = $_REQUEST['status'];
		$params['ispay'] = $_REQUEST['ispay'];if($params['ispay']==99){$params['ispay'] = NULL;}
		$params['shipping'] = $_REQUEST['shipping'];
		$params['uid'] = $_GET['uid'];
		$params['gid'] = $_GET['gid'];
		$params['wd'] = urldecode(trim($_REQUEST['wd']));
		$params['order'] = !empty($_GET['order'])?$_GET['order']:'order_'.C('admin_order_type');
		$params['sort'] = !empty($_GET['sort'])?$_GET['sort']:'desc';
		// 分页参数
		$params['page_is'] = true;
		$params['page_id'] = 'order';
		$params['page_p'] = !empty($_GET['p'])?intval($_GET['p']):1;
		// 缓存参数
		$params['cache_name'] = false;
		$params['cache_time'] = false;
		// 根据查询条件查询数据库
		$array_data = ff_mysql_orders($params);
		// 拼装翻页参数
		$page = $_GET['ff_page_order'];//records totalpages currentpage
		$page['link'] = '?'.http_build_query( array('g'=>'admin','m'=>'orders','a'=>'show','p'=>'FFLINK','order'=>$params['order'],'sort'=>$params['sort'],'status'=>$params['status'],'ispay'=>$params['ispay'],'shipping'=>$params['shipping'],'uid'=>$params['uid'],'gid'=>$params['gid'],'wd'=>$params['wd']) );
		$page['pages'] = '共'.$page['records'].'个订单&nbsp;当前:'.$page['currentpage'].'/'.$page['totalpages'].'页&nbsp;'.getpage($page['currentpage'],$page['totalpages'], 8, $page['link'], 'pagego(\''.$page['link'].'\','.$page['totalpages'].')');
		// 模板定义
		$this->assign($params);
		$this->assign($page);
		$this->assign('list',$array_data);
    $this->display('./Public/system/orders_show.html');
  }
	// 人工补单（付款成功但通知失败）
  public function pay(){
		D("Orders")->ff_update_order($_GET['sign'],$_GET['money']);
		$this->success('操作完成！');
  }
	// 删除订单
	public function del(){
		D('Orders')->ff_delete($_REQUEST['ids']);
		$this->success('删除订单成功！');
	}
}
?>