<switch name="feifei.vod_cid">
<case value="1"><span class="score">{$feifei.vod_gold}</span></case>
<case value="2">
<eq name="feifei.vod_isend" value="1">
<gt name="feifei.vod_total" value="0">{$feifei.vod_total}集全<else/>{$feifei.vod_continu|default='全'}集
</gt><else/><if condition="$feifei['vod_continu'] eq $feifei['vod_total']"><gt name="feifei.vod_total" value="0">{$feifei.vod_total}集全<else/>{$feifei.vod_continu|default='全'}集
</gt><elseif condition="$feifei['vod_continu'] lt $feifei['vod_total']"/><gt name="feifei.vod_continu" value="0">更新至{$feifei.vod_continu}集<else/>{$feifei.vod_total}集全
</gt><elseif condition="$feifei['vod_continu'] gt $feifei['vod_total']"/>全{$feifei.vod_continu|default=''}集
</if>
</eq>
</case>
<case value="3">
<eq name="feifei.vod_isend" value="1">
<gt name="feifei.vod_total" value="0">
{$feifei.vod_total}集全<else/>{$feifei.vod_continu|default='全'}集
</gt><else/><if condition="$feifei['vod_continu'] eq $feifei['vod_total']"><gt name="feifei.vod_total" value="0">{$feifei.vod_total}集全<else/>{$feifei.vod_continu|default='全'}集
</gt><elseif condition="$feifei['vod_continu'] lt $feifei['vod_total']"/><gt name="feifei.vod_continu" value="0">更新至{$feifei.vod_continu}集<else/>{$feifei.vod_total}集全
</gt><elseif condition="$feifei['vod_continu'] gt $feifei['vod_total']"/>{$feifei.vod_continu|default=''}集全
</if>
</eq>
</case>
<case value="4">
<if condition="strlen($feifei['vod_continu']) gt 6">
{$feifei.vod_continu|strtotime|date='Y-m-d',###}<else/>{$feifei.vod_continu}期
</if>
</case>
<case value="5">{:date('i:s',$feifei['vod_length'])}</case>
<default />
</switch>