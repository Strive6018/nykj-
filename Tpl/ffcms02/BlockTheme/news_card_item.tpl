<div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
	<div class="card card-remark mt-3 box-shadow border-light">
		<a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}">
			<img class="card-img-top rounded-0 ff-img p-1" data-original="{:ff_url_img($feifei['news_pic'],$feifei['news_content'])}" alt="{$feifei.news_name}">
		</a>
		<div class="card-body px-2 pt-0 pb-2">
			<div class="card-title mt-2 py-0 mb-0 text-center text-nowrap overflow-hidden text-overflow">
				<a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}" title="{$feifei.news_name}">{$feifei.news_name}</a>
			</div>
			<div class="card-text text-muted mt-2 ff-card-text">
				{$feifei.news_remark|nb|msubstr=0,66,true}
			</div>
		</div>
	</div>
</div>