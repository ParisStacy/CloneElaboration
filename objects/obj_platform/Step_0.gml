//PLAY SPRITE ONLY ONCE//
if (!destroyed) {
	if (image_index > 2) {
		image_index = 2;
	}
}

//RANDOMLY MORPH//

phaseTimer--;
if (phaseTimer <= 0 && platformPhase < 3 && !destroyed) {
	phaseTimer = random_range(5,25) * 60;
	platformPhase++;
	sprite_index = platformPhase;
	image_index  = 0;
}

if (image_index = image_number - 1) {
	instance_destroy();
}