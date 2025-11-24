// Laser movement setup
speed = 2;
direction = irandom(359);
change_timer = irandom_range(15, 40);
trail_surface = -1;
trail_alpha = 0.8;

// Find controller safely
if (instance_exists(obj_lasercontroller)) {
    controller = instance_find(obj_lasercontroller, 0);
} else {
    controller = noone;
}
