<dl class="ff-playbtn m-0">
  <dt></dt>
  <dd class="m-0">
    <a id="ff-prev" href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$play_sid,$play_pid-1)}" class="btn btn-outline-secondary btn-sm <eq name="play_pid" value="1">disabled</eq>">上一集</a>
    <a id="ff-next" href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$play_sid,$play_pid+1)}" class="btn btn-outline-secondary btn-sm <eq name="play_pid" value="$play_count">disabled</eq>">下一集</a>
  </dd>
</dl>