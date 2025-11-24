draw_set_color(c_white);

// Show score (using global score)
draw_text(20, 20, "Score: " + string(global.score));

// Show time left (never below 0)
var time_secs = max(timer, 0) / room_speed;
draw_text(20, 50, "Time: " + string_format(time_secs, 0, 1) + "s");

// Message during exit countdown
if (timer == 0 && exit_timer >= 0) {
    draw_set_color(c_yellow);
    draw_text(room_width * 0.5 - 80, room_height * 0.5, "Minigame Complete!");
    draw_text(room_width * 0.5 - 110, room_height * 0.5 + 24, "Returning to main game...");
}
