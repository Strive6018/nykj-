    <div class="yk-pannel clearfix"> 
     <div class="yk-pannel-box"> 
      <div class="yk-pannel_hd"> 
       <div class="yk-pannel_head clearfix"> 
	   <volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="6" length="1">
        <a class="more text-muted pull-right" href="{$feifei.nav_link}">更多</a> 
        <h3 class="title"><a href="{$feifei.nav_link}">资讯·预告</a></h3> 
		</volist>
       </div> 
      </div> 
      <div class="yk-pannel_bd clearfix"> 
       <div class="yk-vodlist clearfix"> 
        <volist name=":ff_mysql_news('limit:24;order:news_addtime desc')" id="feifei" key="k" offset="0" length="12">
		<li class="yk-pack">
		<div class="p-thumb">
		<a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}" target="_blank"></a>
		<img class="quic ff-img" data-original="{$feifei.news_pic|ff_url_img=$feifei['news_content']}" alt="{$feifei.news_name}">
		</div>
		<ul class="info-list">
		<li class="title"><a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}" target="_blank" title="{$feifei.news_name}">{$feifei.news_name}</a></li>
		</ul>
		</li>
        </volist> 
       </div > 
      </div>
     </div> 
    </div>