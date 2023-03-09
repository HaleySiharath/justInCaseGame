/// @description Increase money and pollution at the end of alarm

global.money += currentRevenue;

// makes sure that pollution doesn't go over 100
if(global.pollution < 100)
{
	global.pollution += currentPollution;
}

alarm[0] = currentTimer;
