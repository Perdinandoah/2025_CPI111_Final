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