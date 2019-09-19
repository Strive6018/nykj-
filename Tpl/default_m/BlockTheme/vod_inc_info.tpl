<div class="media vod-inc-info">
  <div class="media-left">
    <a class="vod-pic" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">
      <img class="media-object img-thumbnail ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}免费观看">
    </a>
  </div>
  <div class="media-body">
    <dl class="dl-horizontal">
      <dt>主演：</dt>
      <dd class="text-nowrap ff-text-right">
      	{$vod_actor|ff_url_search}
      </dd>
      <dt>导演：</dt>
      <dd class="text-nowrap ff-text-right">
      	{$vod_director|ff_url_search='director'}
      </dd>
      <dt>地区：</dt>
      <dd class="text-nowrap ff-text-right">
      	<include file="BlockBase:vod_area" />
      </dd>
      <dt>年份：</dt>
      <dd class="text-nowrap ff-text-right">
      	<a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2017'}</a>
      </dd>
      <dt>链接：</dt>
      <dd class="text-nowrap ff-text-right">
      <a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">免费观看</a>
      <a href="{:ff_url('forum/vod',array('cid'=>$vod_id),true)}">精彩影评</a>
      </dd>
    </dl>
  </div>
</div>
<div class="clearfix ff-clearfix"></div>