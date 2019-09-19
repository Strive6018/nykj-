<php>
$playurl_line = array();
$playurl_down = array();
$playurl_yugao = array();
foreach($vod_play_list as $key=>$value){
	if($value['player_name_en'] == "yugao"){
  	array_push($playurl_yugao, $value);
 	}else if($value['player_name_en'] == "down"){
  	array_push($playurl_down, $value);
 	}else{
  	array_push($playurl_line, $value);
 	}
}
$playurl_line = ff_play_one($playurl_line,'max');
$playurl_down = ff_play_one($playurl_down,'max');
$playurl_yugao = ff_play_one($playurl_yugao,'max');
</php>