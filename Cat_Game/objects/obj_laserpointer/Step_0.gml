// --- FIND CONTROLLER IF NEEDED ---
if (controller == noone && instance_exists(obj_lasercontroller)) {
    controller = instance_find(obj_lasercontroller, 0);
}

// If we have a controller and the timer is done, stop moving
if (controller != noone && controller.timer <= 0) {
    speed = 0;
    exit; // stop processing movement/trail
}

// --- RANDOMLY CHANGE DIRECTION (SCRIBBLY) ---
change_timer -= 1;
if (change_timer <= 0) {
    direction += irandom_range(-70, 70);
    direction = (direction + 360) mod 360;
    change_timer = irandom_range(25, 50);
}

// --- MOVE ---
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// --- BOUNCE OFF ROOM EDGES ---
if (x <= 0) {
    x = 0;
    direction = 180 - direction;
}
if (x >= room_width) {
    x = room_width;
    direction = 180 - direction;
}
if (y <= 0) {
    y = 0;
    direction = 360 - direction;
}
if (y >= room_height) {
    y = room_height;
    direction = 360 - direction;
}

// Keep direction in 0–359 range
direction = (direction + 360) mod 360;

// --- TRAIL FROM SPRITE CENTER ---
var cx = x - sprite_xoffset + sprite_width * 0.5;
var cy = y - sprite_yoffset + sprite_height * 0.5;

if (surface_exists(trail_surface)) {
    surface_set_target(trail_surface);
    draw_set_color(make_color_rgb(255, 0, 0)); // trail color
    draw_circle(cx, cy, 3, false);
    surface_reset_target();
} else {
    // Create surface if missing
    trail_surface = surface_create(room_width, room_height);
    surface_set_target(trail_surface);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}

