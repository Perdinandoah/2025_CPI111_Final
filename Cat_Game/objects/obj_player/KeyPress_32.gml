if(canJump == true && inAir == false){
	velocityY = jumpPower;
	
	canJump = false;
	onGround = false;
	isJumping = true;
	inAir = true;
}