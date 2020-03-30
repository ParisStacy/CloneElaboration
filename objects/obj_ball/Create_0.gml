owner = noone;
ownedTimer = 9;
shineTimer = random_range(1,3) * 60;
aura = instance_create_layer(x,y,"cosmetic_layer", obj_ballaura);
score_indicator = instance_create_layer(x,y,"cosmetic_layer", obj_score_indicator);
floatEaseT = 0;
totalTimeHeld = 0;