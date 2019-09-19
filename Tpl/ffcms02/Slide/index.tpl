<php>$item_slide = ff_mysql_slide('limit:'.C('ui_slide_max').';cache_name:default;cache_time:default;order:slide_oid;sort:asc');</php>
<div class="carousel slide ff-slide mt-3" id="ff-slide" data-ride="carousel" data-interval="{$Think.config.ui_slide_index}">
  <!-- 指示符 -->
  <ul class="carousel-indicators">
		<volist name="item_slide" id="feifei">
    <eq name="key" value="0">
    <li data-target="#ff-slide" data-slide-to="{$key}" class="active"></li>
    <else/>
    <li data-target="#ff-slide" data-slide-to="{$key}"></li>
    </eq>
    </volist>
  </ul>
  <!-- 轮播图片 -->
  <div class="carousel-inner">
		<volist name="item_slide" id="feifei">
		<eq name="key" value="0">
			<div class="carousel-item active">
				<a href="{$feifei.slide_url}">
				<img src="{$feifei.slide_pic|ff_url_img}" alt="{$feifei.slide_name}">
				<div class="carousel-caption d-none d-md-block">
					<h5>{$feifei.slide_name}</h5>
					<p class="d-none d-md-block">{$feifei.slide_content}</p>
				</div>
				</a>
			</div>
		<else/>
			<div class="carousel-item">
				<a href="{$feifei.slide_url}">
				<img src="{$feifei.slide_pic|ff_url_img}" alt="{$feifei.slide_name}">
				<div class="carousel-caption">
					<h5>{$feifei.slide_name}</h5>
					<p class="d-none d-md-block">{$feifei.slide_content}</p>
				</div>
				</a>
			</div>
		</eq>
		</volist>
  </div>
  <!-- 左右切换按钮 -->
  <a class="carousel-control-prev" href="#ff-slide" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#ff-slide" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>