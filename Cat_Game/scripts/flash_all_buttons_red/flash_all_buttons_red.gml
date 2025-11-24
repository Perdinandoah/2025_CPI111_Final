function flash_all_buttons_red() {
    for (var i = 0; i < array_length(buttons); i++) {
        buttons[i].flash_red = flash_time;
    }
}
