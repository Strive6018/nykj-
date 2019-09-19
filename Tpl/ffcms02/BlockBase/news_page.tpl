<gt name="news_page_count" value="1">
<gt name="news_page" value="1">
<a class="badge badge-secondary ml-1" id="ff-prev" href="{:ff_url_news_read($list_id,$list_dir,$news_id,$news_ename,$news_jumpurl,$news_page-1)}">上一页</a>
</gt>
<lt name="news_page" value="$news_page_count">
<a class="badge badge-secondary ml-1" id="ff-next" href="{:ff_url_news_read($list_id,$list_dir,$news_id,$news_ename,$news_jumpurl,$news_page+1)}">下一页</a>
</lt>
</gt>