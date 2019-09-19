<div class="to-top">
<div class="scroll-to-top"><i class="aui-iconfont aui-icon-top"></i></div>
<div class="scroll-to-comment"><a href="{:ff_url('forum/guestbook',array('p'=>1),true)}" target="_blank"><i class="aui-iconfont aui-icon-edit"></i></a></div>
</div>
<footer class="footer">
	<div class="footer-copyright">Copyright ©2006-2018 {$site_title|msubstr=0,2}CMS All Rights Reserved</div>
</footer>
<div class="aui-bar aui-bar-tab" id="footer">
<volist name=":ff_mysql_nav('field:*;limit:5;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" key="k">
<div class="aui-bar-tab-item" id="ft{$feifei.nav_tips}" tapmode="">
	<a href="{$feifei.nav_link}" title="{$feifei.nav_title}">
	<in name="k" value="1,3,4,5" ><else/><div class="aui-dot"></div></in>
        <i class="aui-icon-{$feifei.nav_tips}"></i>
        <div class="aui-bar-tab-label">{$feifei.nav_title}</div>
		</a>
    </div>
	</volist>
</div>
<script>$("#ft{$list_dir}").addClass("aui-active");</script>

