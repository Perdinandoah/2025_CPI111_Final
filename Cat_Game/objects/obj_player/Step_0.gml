			/****** Step Event *****/
//Jump inputs
keyJump = keyboard_check_pressed(vk_space);
keyJumpHeld = keyboard_check(vk_space);


//Gravity-------------------------------------------
if(isDashing){
	velocityY = 0;
}
else{
	velocityY += obj_controller.gameGravity;
}


//check if y collision will occur----------------------------------------------------------
var predictedY = y + velocityY;
if(!place_meeting(x, predictedY, obj_collidable)){
	inAir = true;
	y += velocityY;
}
else{ //ease the player against the wall
	predictedY = y;
	while(!place_meeting(x, predictedY, obj_collidable)){
		predictedY += sign(velocityY);
	}
	//last addition caused a collision, move player back 1 pixel before that point
	y = predictedY - sign(velocityY);
	
	//flags
	velocityY = 0;
	onGround = true;
	inAir = false;
	isJumping = false;
	isFalling = false;
	canJump = true;
}


if(velocityY > 0 && inAir == true){
	isFalling = true;
}


//room collision----------------------------------------------
if(y + sprite_height/2 >= room_height){
	y = room_height - midHeight;
	velocityY = 0;
	onGround = true;
	inAir = false;
	isJumping = false;
	isFalling = false;
	canJump = true;	
}


//On death -------------------------------------------------------------------------------
if(health <= 0){
	game_end();
}


//Dash Charging and Attacking---------------------------
if(isCharging){
	dashCharge = clamp(dashCharge + 0.05, 1, maxCharge);
}

if(isDashing){
	instance_create_layer(x, y, "Instances", obj_playerDashBox)
}

//Jump-------------------------------------------------------
//start jump
if(keyJump && canJump && !inAir){
	//state flags
	isJumping = true;
    canJump = false;
    inAir = true;
    onGround = false;

    //Jump
    velocityY = jumpPower;

    // Play jump sound
    audio_play_sound(snd_jump, 1, false);
}

// Keeps state flags from inflicting
if (isFalling) {
    isJumping = false;
}

//when jumnp key lets go, stop jump with some float
if(velocityY < 0 && !keyJumpHeld){
	isJumping = false;
	velocityY = max(velocityY, jumpPower/4);
}
	
	