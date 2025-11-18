// Reconnect to controller if needed
if (controller == noone && instance_exists(obj_lasercontroller)) {
    controller = instance_find(obj_lasercontroller, 0);
}

// Stop movement when timer ends
if (controller != noone && controller.timer <= 0) {
    speed = 0;
    exit;
}

// --- RANDOMLY CHANGE DIRECTION ---
change_timer -= 1;
if (change_timer <= 0) {
    direction += irandom_range(-70, 70);
    direction = (direction + 360) mod 360;
    change_timer = irandom_range(15, 40);
}

// --- MOVE ---
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// --- WALL BOUNCE LOGIC ---
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
direction = (direction + 360) mod 360;

// --- TRAIL HANDLING ---
// Calculate the center of the sprite
var cx = x - sprite_xoffset + sprite_width * 0.5;
var cy = y - sprite_yoffset + sprite_height * 0.5;

if (surface_exists(trail_surface)) {
    surface_set_target(trail_surface);

    draw_set_color(make_color_rgb(255, 0, 0));
    draw_circle(cx, cy, 3, false);

    surface_reset_target();
} else {
    trail_surface = surface_create(room_width, room_height);
    surface_set_target(trail_surface);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
