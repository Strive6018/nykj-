				<li class="m-item">
					<a class="thumb" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">
						<img class="ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}">
						<i class="mask"></i>
						<div class="icon-br"><span class="label"><include file="Home:vod_continu" /></span></div>
					</a>
					<div class="text">
						<h3 class="stitle ellipsis-2"><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">{$feifei.vod_name}</a></h3>
					</div>
				</li>