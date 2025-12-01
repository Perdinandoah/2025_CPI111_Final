/****** Jump *****/

if (canJump && coyoteTimer > 0) {
    isJumping = true;
    canJump = false;
    inAir = true;
    onGround = false;

    // Initial push
    velocityY = jumpStartPower;
    jumpHeight = 0;

    // Play jump sound
    audio_play_sound(snd_jump, 1, false);
}

// Keeps state flags from inflicting
if (isFalling) {
    isJumping = false;
}
