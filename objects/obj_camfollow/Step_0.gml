yAverage = ((instance_find(obj_player,0).y + instance_find(obj_player,1).y) / 2) - 100;

if (!instance_find(obj_player,0).alive) {
yAverage = instance_find(obj_player,1).y - 100;
}
if (!instance_find(obj_player,1).alive) {
yAverage = instance_find(obj_player,0).y - 100;
}

yAverage += 20;

if (yAverage <= 0) yAverage = 0;
if (yAverage >= room_height - 200) yAverage = room_height - 200;

y = lerp(y,0,.3);

camera_set_view_pos(view_camera[0], 0, y);