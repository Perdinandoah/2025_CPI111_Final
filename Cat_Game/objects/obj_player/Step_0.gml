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
	coyoteTimer =max(0, coyoteTimer -1); //start coyote timer when falling
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
	coyoteTimer = coyoteTimerDefault; //reset coyote timer when on ground
	jumpPower = defaultJumpPower //reset jump power when on ground
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
	save_player_data("playerData.ini", 330, 1740, room_get_name(Tutorial))
	game_end();
}


//Dash Charging and Attacking---------------------------
if(isCharging){
	dashCharge = clamp(dashCharge + 0.05, 1, maxCharge);
}

if(isDashing){
	instance_create_layer(x, y, "AttackBoxes", obj_playerDashBox)
}

//Jump-------------------------------------------------------
//start jump
if(keyJump && canJump && coyoteTimer > 0){
	//state flags
	isJumping = true;
    canJump = false;
    inAir = true;
    onGround = false;

    //start jump
    velocityY = jumpPower;

    // Play jump sound
    audio_play_sound(snd_jump, 1, false);
}

// Keeps state flags from inflicting
if (isFalling) {
    isJumping = false;
}

//change jumpPower during jump
if(keyJumpHeld && (isJumping || coyoteTimer > 0) && !(jumpPower <= maxJumpPower)){
	jumpPower = clamp(jumpPower - 1, maxJumpPower, defaultJumpPower);
	velocityY = jumpPower;
}

//when jumnp key lets go, stop jump with some float
if(velocityY < 0 && !keyJumpHeld){
	isJumping = false;
	velocityY = max(velocityY, jumpPower/1.5);
}
	
	
//Sprite Animation management------------------------
if(isJumping && sprCanChange){
	sprite_index = spr_playerJump1;
}

else if(isFalling && sprCanChange){
	sprite_index = spr_playerFalling;
}

else if(x != xprevious && sprCanChange){
	sprite_index = spr_PlayerPlaceHolder;
}

else if (sprCanChange){
	sprite_index = spr_playerIdle1;
}