draw_set_font(-1);
draw_set_color(c_white);
draw_text(20, 20, "Score: " + string(score));
draw_text(20, 50, "Time: " + string_format(timer / room_speed, 0, 1) + "s");

if (timer <= 0) {
    draw_set_color(c_red);
    draw_text(room_width/2 - 40, room_height/2, "Time's Up!");
}
