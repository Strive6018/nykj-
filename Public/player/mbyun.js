function $Showhtml(){
	player ='<iframe width="100%" height="'+Player.Height+'" src="'+Player.Url+'" frameborder="0" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>';	
	return player;
}
Player.Show();
if(Player.Second){
	$$('buffer').style.height = Player.Height-45;
	$$("buffer").style.display = "block";
	setTimeout("Player.BufferHide();",Player.Second*1000);
}