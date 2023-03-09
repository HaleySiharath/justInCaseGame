/// @description write the labels on the buttons

draw_set_halign(fa_center);
draw_set_valign(fa_middle);


if(optionId == 1)
{
	draw_text_transformed(1685, 200, "Option 1", 2, 2, 0);
}

else if (optionId == 2)
{
	draw_text_transformed(1685, 480, "Option 2", 2, 2, 0);
}
