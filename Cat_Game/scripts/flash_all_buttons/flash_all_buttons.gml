function flash_all_buttons(times) {
    for (var i = 0; i < array_length(buttons); i++) {
        buttons[i].flash = flash_time * times;
    }
}
