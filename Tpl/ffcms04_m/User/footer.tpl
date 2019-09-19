<!--用户信息-->
<section class="mod aui-margin-t-0">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
	         <a class="aui-list-item" href="{:ff_url('user/logout')}">
	            <div class="aui-list-item-inner">
	                <div class="aui-list-item-title aui-list-item-exit">退出登录</div>
	            </div>
	        </a>
	    </div>
	</div>
</section>
<script src="/Public/ffcms_m/js/jQuery-image-upload.min.js"></script>
<script>
	$(".face").imageUpload({
		formAction: "{:ff_url('user/face')}",
		inputFileName:'file',
		browseButtonValue: '　　　　',
		browseButtonClass:'btn-xs',
		automaticUpload: true,
		hideDeleteButton: true,
		hover:true
	})
	$(".face").on("imageUpload.uploadFailed", function (ev, err) {
		alert(err);
	});
</script>
<footer class="footer">
	<div class="footer-copyright"> ©2006-2018 {$site_name}</div>
</footer>