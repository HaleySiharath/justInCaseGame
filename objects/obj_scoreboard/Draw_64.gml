/// @description Draw HUD elements

// draw the pollution 100 being full pollutions
draw_healthbar(20, 20, 220, 45, global.pollution, c_black, c_lime, c_red, 0, true, true);

// indicate that it is about pollution
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_black);

// read out the current pollution state
pollutionStatement = "Pollution Levels: " + string(global.pollution);

draw_text_transformed(235, 30, pollutionStatement, 2, 2, 0);


// Print out current income
moneyStatement = "Money: $" + string(global.money);

draw_text_transformed(20, 80, moneyStatement, 2, 2, 0);


// Print out current day
dayStatement = "Day: " + string(global.day);

draw_text_transformed(20, 120, dayStatement, 2, 2, 0);