<notempty name="playurl_down">
<div class="page-header ff-playurl-down">
  <h2>
  	<span class="glyphicon glyphicon-cloud-download ff-text"></span>
    下载观看 <small>友情提示：未安装工具时，会自动提示安装，安装完毕后即可高速下载。</small></h2>
</div>
</notempty>
<volist name="playurl_down" id="feifei" key="sid">
<div class="table-responsive ff-playurl-down">
  <table class="table table-bordered">
  <thead>
  <tr>
    <th>{$feifei.player_name_zh} {$sid}</th>
    <th><a class="thunder_down_all" href="javascript:;">迅雷下载</a></th>
    <th><a class="xf_down_all" href="javascript:void(0);">旋风下载</a></th></tr>
  </thead>
  <tbody>
  <volist name="feifei.son" id="feifeison" key="pid">
  <tr>
    <td><div class="input-group">
    <span class="input-group-addon">
    <input class="down_url" name="down_url_list_0" type="checkbox" value="{$feifeison.url|ff_ThunderEncode}" file_name="{$feifeison.title}" checked="checked">
    </span>
    <input class="form-control" type="text" value="{$feifeison.title} {$feifeison.url|ff_ThunderEncode}">
    </div></td>
    <td><button type="button" class="btn btn-success btn-sm thunder_down">迅雷下载</button></td>
    <td><button type="button" class="btn btn-warning btn-sm qqdl">旋风下载</button></td></tr>
  <tr>
  </volist>
  </tbody>
  </table>
</div>
<div class="clearfix"></div>
</volist>