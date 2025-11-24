			/****** Jump *****/


if (canJump && !inAir) {
    isJumping = true;
    canJump = false;
    inAir = true;
    onGround = false;
	//Initial push
    velocityY = jumpStartPower;
    jumpHeight = 0;
}

//Keeps state flags from inflicting
if(isFalling){
	isJumping = false;
}

//animations
if (isJumping = true){
	sprite_index = spr_playerJump;
}
else {
	sprite_index = spr_playerRunning;
}


if (onGround = true){
	sprite_index = spr_playerRunning;
}