// Laser movement setup
speed = 3;
direction = irandom(359);
change_timer = irandom_range(15, 40);

// Trail setup
trail_surface = -1;
trail_alpha = 0.8;

// Try to find the controller safely
if (instance_exists(obj_lasercontroller)) {
    controller = instance_find(obj_lasercontroller, 0);
} else {
    controller = noone;
}

// Find the controller safely
controller = noone;
