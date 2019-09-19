<switch name="list_name">
<case value="电影">{$vod_version}</case>
<case value="电视剧">
<eq name="vod_isend" value="1">
<gt name="vod_total" value="0">已完结，全{$vod_total}集<else/>已完结，全{$vod_continu|default='全'}集</gt>
<else/><if condition="$vod_continu eq $vod_total"><gt name="vod_total" value="0">已完结，全{$vod_total}集
<else/>已完结，全{$vod_continu|default='全'}集</gt><elseif condition="$vod_continu lt $vod_total"/>
<gt name="vod_continu" value="0">更新至{$vod_continu}集<i class="BottomModel">|</i>共{$vod_total}集<else/>已完结，全{$vod_continu|default='全'}集</gt><elseif condition="$vod_continu gt $vod_total"/>已完结，全{$vod_continu|default=''}集
</if></eq></case>
<case value="动漫">
<eq name="vod_isend" value="1">
<gt name="vod_total" value="0">{$vod_total}集全<else/>{$vod_continu|default='全'}集全</gt><else/><if condition="$vod_continu eq $vod_total"><gt name="vod_total" value="0">{$vod_total}集全
<else/>{$vod_continu|default='全'}集全</gt><elseif condition="$vod_continu lt $vod_total"/><gt name="vod_continu" value="0">更新至{$vod_continu}集<i>|</i>共{$vod_total}集
<else/>{$vod_continu|default='全'}集全</gt><elseif condition="$vod_continu gt $vod_total"/>{$vod_continu|default=''}集全</if></eq>
</case>
<case value="综艺"><if condition="strlen($vod_continu) gt 6">{$vod_continu|strtotime|date='Y-m-d',###}<else/>{$vod_continu}期</if>
</case>
<default />
</switch>