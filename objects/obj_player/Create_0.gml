xDir = 0
yDir = -10;
gravityValue = -10 / 60;

if (playerNum != 0) {
sprite_index = spr_player1;
}

alive = true;

respawnTime = 2 * 60;
timer = 0;

playerScore = 0;
deathEvents = false;
audio_play_sound(jump,1,false);
depth = -10;