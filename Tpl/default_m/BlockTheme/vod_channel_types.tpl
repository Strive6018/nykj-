<!--频道页筛选 -->
<dl class="types">
  <dt class="ff-text">按类型</dt>
  <dd>
    <ul class="list-unstyled row">
      <volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length="12">
      <li class="col-xs-4"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a></li>
      </volist>
    </ul>
  </dd>
  <dt class="ff-text">按年份</dt>
  <dd>
    <ul class="list-unstyled row">
      <volist name=":explode(',',$list_extend['year'])" id="feifei" offset="0" length="11">
      <li class="col-xs-4"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$feifei,'star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a></li>
      </volist>
      <li class="col-xs-4"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'19902006','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更早</a></li>
    </ul>
  </dd>
  <dt class="ff-text">按地区</dt>
  <dd>
    <ul class="list-unstyled row">
      <volist name=":explode(',',$list_extend['area'])" id="feifei" offset="0" length="12">
      <li class="col-xs-4"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($feifei),'year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a></li>
      </volist>
    </ul>
  </dd>
</dl>