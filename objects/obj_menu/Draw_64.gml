/// @description Write the text for user


draw_set_color(c_black);
draw_text_ext(1550, 100, currentStatement, 20, 250);

// if option 1 is not bought then print the statement
if(currentBuilding.option1 == false)
{
	draw_text_ext(1550, 275, currentBuilding.option1Description, 20, 250);
}
else
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(1685, 200, "Equiped", 2, 2, 0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(1550, 275, currentBuilding.option1Description, 20, 250);
}

if(currentBuilding.option2 == false)
{
	draw_text_ext(1550, 550, currentBuilding.option2Description, 20, 250);
}
else
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(1685, 480, "Equiped", 2, 2, 0);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(1550, 550, currentBuilding.option2Description, 20, 250);
}

