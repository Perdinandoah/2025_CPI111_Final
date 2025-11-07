// Count down timer
if (timer > 0) {
    timer -= 1;
} else {
    timer = 0;
    // You can add "end game" logic here (e.g., stop laser, show message)
	room_goto(Tutorial)
}
