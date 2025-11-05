if(canJump == true && inAir == false){
	velocityY = jumpPower;
	
	canJump = false;
	onGround = false;
	isJumping = true;
	inAir = true;
}
audio_play_sound(snd_jump,1,false);