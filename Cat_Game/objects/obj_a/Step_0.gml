/// Button Step Event – fixed

if (flash > 0) {
    flash--;              // player click
    image_blend = c_white;
}
else if (flash_end > 0) {
    flash_end--;          // end-of-round
    image_blend = c_white;
}
else if (flash_green > 0) {
    flash_green--;        // computer playback
    image_blend = c_lime;
}
else if (flash_red > 0) {
    flash_red--;          // wrong press
    image_blend = c_red;
}
else {
    image_blend = c_white; // normal
}
