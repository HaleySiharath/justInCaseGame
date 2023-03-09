// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function makeMenu(){
	
	// get where I want the menu to be 
	menuCoorX = staticItemX(global.menuX);
	menuCoorY = staticItemY(global.menuY);
	
	// get where I want the cancle button to be
	cancleCoorX = staticItemX(global.cancleButtonX);
	cancleCoorY = staticItemY(global.cancleButtonY);
	
	// get where I want the cancle button to be
	buttonCoorX = staticItemX(global.buttonX);
	buttonCoorY1 = staticItemY(global.buttonY1);
	
	buttonCoorY2 = staticItemY(global.buttonY2);
	
	//--------------------------------------------
	// create the buttons and place on GUI if not already bought
	if(self.option1 == false)
	{
		button1 = instance_create_layer(buttonCoorX, buttonCoorY1, "instances_static_items", obj_option_button);
		button1.depth = -1;
		button1.optionId = 1;
	}
	
	if(self.option2 == false)
	{
		button2 = instance_create_layer(buttonCoorX, buttonCoorY2, "instances_static_items", obj_option_button);
		button2.depth = -1;
		button2.optionId = 2;
	}
	
	
	//--------------------------------------------	
	// create the cancle button and place on GUI
	cancle_button = instance_create_layer(cancleCoorX, cancleCoorY, "instances_static_items", obj_cancle_button);
	cancle_button.depth = -1;
	
	//--------------------------------------------	
	// create the menu and place it on the GUI
	menu = instance_create_layer(menuCoorX, menuCoorY, "instances_static_items", obj_menu);
	menu.depth = 0;

	//-----------------------------------------------
	// Write dynamic text
	
	currentStatementBuilding = "This facility is curently producing $" + string(self.currentRevenue) + " and a polution level of " 
							+ string(self.currentPollution) + " every " + string(self.currentTimer) + "seconds";
	
	menu.currentStatement = currentStatementBuilding;
	
	// save the current building called into menu instance and set as global building
	menu.currentBuilding = self;
	global.currentBuilding = self;
}

// keep X and Y coordinates static with player
function staticItemX(xInput)
{
	// get current view port
	viewportX = camera_get_view_x(view_camera[0]);
	
	// find where the current x value should be.
	xCoordinate = viewportX + xInput;
	
	return xCoordinate;
}

function staticItemY(yInput)
{
	// get current view port
	viewportY = camera_get_view_y(view_camera[0]);
	
	// find where the current y value should be.
	yCoordinate = viewportY + yInput;
	
	return yCoordinate;
}

// destroy instances that corelate to menu
function deleteMenu()
{
	instance_destroy(obj_menu);
	instance_destroy(obj_option_button);
	instance_destroy(obj_cancle_button);
}

// Upgrade the current building
function upgrade()
{
	// get current building
	building = obj_menu.currentBuilding;
	
	// if player selected 1 and can afford upgrade then upgrade
	if(self.optionId == 1)
	{
		if(global.money > building.cost1)
		{
			// pay for upgrade
			global.money -= building.cost1;
			
			// change current pollution
			building.currentPollution = building.pollution1;
			
			// change current revenue
			building.currentRevenue = building.revenue1;
			
			// change timer
			building.currentTimer = building.timer1;

			// change the menu dynamic current
			newStatement = "This facility is curently producing $" + string(building.currentRevenue) + " and a polution level of " 
							+ string(building.currentPollution) + " every " + string(building.currentTimer) + "seconds";
			obj_menu.currentStatement = newStatement;
			
			// set this button value to true so it won't show up
			building.option1 = true;
			
			// destroy the current button so it can't be pressed
			instance_destroy(self);

		}
		else
		{
			show_debug_message("Not enough money");
		}
	}
	
	// if player selected 2 and can afford upgrade then upgrade
	if(self.optionId == 2)
	{
		if(global.money > building.cost2)
		{
			// pay for upgrade
			global.money -= building.cost2;
			
			// change current pollution
			building.currentPollution = building.pollution2;
			
			// change current revenue
			building.currentRevenue = building.revenue2;
			
			// change timer
			building.currentTimer = building.timer2;
			
			// change the menu dynamic current
			newStatement = "This facility is curently producing $" + string(building.currentRevenue) + " and a polution level of " 
							+ string(building.currentPollution) + " every " + string(building.currentTimer) + "seconds";
							
			obj_menu.currentStatement = newStatement;
			
			// set this button value to true so it won't show up
			building.option2 = true;
			
			// destroy the current button so it can't be pressed
			instance_destroy(self);

		}
		else
		{
			show_debug_message("Not enough money");
		}
	}
}