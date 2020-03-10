var _freezeFrames = argument0;
var _x = argument1;
var _y = argument2;
var _t = current_time + _freezeFrames;

var deathExplosion = instance_create_layer(_x,_y,"cosmetic_layer",obj_impact);
deathExplosion.depth = 10;
deathExplosion.image_xscale = 1.5;
deathExplosion.image_yscale = 1.5;

while (current_time < _t) {
}