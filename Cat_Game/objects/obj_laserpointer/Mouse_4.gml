if (instance_exists(controller)) {
    if (controller.timer > 0) { // only count clicks if time left
        controller.score += 100;
        effect_create_above(ef_ring, x, y, 1, c_red);
    }
}
