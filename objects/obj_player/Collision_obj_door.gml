/// @description Go to other room

// if in main game go to town hall inside
if(room == room_main_screen)
{
	
	room_goto(room_townhall);
}

// if in townhall go outside
if(room == room_townhall)
{
	room_goto(room_main_screen);
}

