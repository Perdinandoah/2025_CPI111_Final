function start_round() {
    sequence = generate_sequence(round_lengths[current_round-1]);
    player_index = 0;
    playing_sequence = true;
    flash_index = 0;
    flash_timer = flash_time;
    player_turn = false;
}
