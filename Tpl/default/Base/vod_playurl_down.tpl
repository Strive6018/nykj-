<notempty name="playurl_down">

<div class="module-title"><h2>下载列表</h2></div>
<volist name="playurl_down" id="feifei" key="sid">
<div class="panel panel-quality-4 ff-playurl-down">

            <div class="dl-cp-pannel ffcms-3">
                <div class="ffcms-6">

						<em>友情提示：未安装工具时，会自动提示安装，安装完毕后即可高速下载。</em>
                    
                </div>

                <div class="ffcms-2">
                    <span class="btn btn-sm btn-success get-xunlei"><span class="glyphicon glyphicon-cloud-download"></span> <a class="thunder_down_all" href="javascript:;">安装迅雷</a></span>
					<span class="btn btn-sm btn-warning get-xunlei"><span class="glyphicon glyphicon-cloud-download"></span> <a class="xf_down_all" href="javascript:void(0);">安装旋风</a></span>
					<span class="btn btn-sm btn-info get-xunlei"><span class="glyphicon glyphicon-level-up"></span> <a class="xf_down_all" href="javascript:void(0);">安装说明书</a></span>
                </div>
            </div>
            

<volist name="feifei.son" id="feifeison" key="pid">
            <table class="table table-striped table-hover table-dl">
                <tbody>
						<tr>
							<td>
                                 <div class="ffcms-1">
                                    <span class="dl-checkbox-label">
                                    <input class="down_url" name="down_url_list_0" type="checkbox" value="{$feifeison.url|ff_ThunderEncode}" file_name="{$feifeison.title}">&nbsp;{$vod_name} {$feifeison.title}
									 </span>
									 </div>
								<div class="ffcms-4"><input class="form-control" type="text" value="{$feifeison.url|ff_ThunderEncode}" placeholder="{$feifeison.url|ff_ThunderEncode}"></div>
                                <div class="ffcms-2">
								<button type="button" class="btn btn-success btn-sm thunder_down"><span class="glyphicon glyphicon-save"></span> 迅雷下载</button>
								<button type="button" class="btn btn-warning btn-sm qqdl"><span class="glyphicon glyphicon-save"></span> 旋风下载</button>
								<button class="btn btn-sm btn-info copy-original-url-button" data-clipboard-text="{$feifeison.url}"><span class="glyphicon glyphicon-duplicate"></span> 复制原地址</button>
                                </div>
				                        </td>
                    </tr>

                  </tbody>
				  </table>
            </volist>

		</div>
		
		  </volist>
</notempty>		
	