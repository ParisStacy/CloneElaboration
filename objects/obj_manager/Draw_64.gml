draw_set_color(c_black);
draw_text_transformed(900+64,32,instance_find(obj_player,0).playerScore,2,2,0);
draw_set_color(c_white);
draw_text_transformed(900-64, 32,instance_find(obj_player,1).playerScore,2,2,0);