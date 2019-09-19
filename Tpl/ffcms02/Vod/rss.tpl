<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">
<channel>
<title>{$vod_name}</title> 
<link>{$site_url}{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}</link> 
<description><![CDATA["{$vod_content|msubstr=0,200}"]]></description> 
<language>zh-cn</language> 
<generator>{$site_url}</generator> 
<webmaster>{$site_eamil}</webmaster> 
<volist name="vod_play_list" id="feifei">
<volist name="feifei.son" id="feifeison" key="pid">
<item>
<title>{$vod_name|htmlspecialchars}{$vod_title|htmlspecialchars}{$feifeison.playname}</title> 
<link>{$site_url}{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}</link>
<description><![CDATA["{$vod_name|htmlspecialchars}{$feifeison.title}在线观看地址{$site_url}{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}"]]></description>
<pubDate>{$vod_addtime|date='Y-m-d H:i:s',###}</pubDate>
<category>{$vod_name}</category> 
<author>{$vod_actor|htmlspecialchars}</author>
<comments>{$site_name}</comments>
</item>
</volist>
</volist>
</channel>
</rss>