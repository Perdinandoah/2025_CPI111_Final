draw_set_color(c_white);
draw_text(20, 20, "Score: " + string(global.score));
draw_text(20, 50, "Time: " + string_format(max(timer,0) / room_speed,0,1) + "s");

if (timer == -1) {
    draw_set_color(c_red);
    draw_text(room_width/2-60, room_height/2, "Minigame Complete!");
}
