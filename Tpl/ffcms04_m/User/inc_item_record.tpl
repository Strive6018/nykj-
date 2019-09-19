				<volist name="item_vod" id="feifei">
				<article class="news-card card-type-news">
					<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">
						<div class="news-pic">
							<img class="ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}">
							
						<i class="mask"></i>
						<div class="icon-br"><span class="label"><include file="Home:vod_continuu" /></span></div>
						</div>

						<div class="news-info">
							<h3 class="title">{$feifei.vod_name}</h3>
							<div class="detail">
								<span>{$feifei.vod_actor|msubstr=0,18}</span>

							</div>
							<div class="detail">
								<span>{$feifei.vod_year}</span>
								<span>{$feifei.vod_hits}播放</span>
								<span><switch name="feifei.vod_cid" ><case value="1">电影</case><case value="2">电视剧</case><case value="3">综艺</case><case value="4">动漫</case><default  /></switch></span>
							</div>
							<div class="detail">
								<span>{$feifei.vod_content|msubstr=0,20}</span>
							</div>
						</div>
					</a>
				</article>
			</volist>
			
			
			
			