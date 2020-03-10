platformPhase = 0;
phaseTimer = random_range(1,5) * 60;

if (collision_rectangle(x + 32, y + 16, x - 32, y - 16, obj_platform, false, true)) {
obj_manager.spawnTimer = 0;
instance_destroy();
}

destroyed = false;
