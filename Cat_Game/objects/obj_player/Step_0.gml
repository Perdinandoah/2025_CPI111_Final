			/****** Step Event *****/


//Jump height increase--------------------------------------
if (isJumping && jumpHeight < maxJumpHeight) {
    if (!place_meeting(x, (y + velocityY), obj_collidable)) {
        // Keep adding small upward force while key is held
        velocityY += jumpPower; 
        jumpHeight += 1;
		}
	else {
        // Stop adding upward force when key released or height cap reached
        isJumping = false;
		velocityY = 0;
    }
}


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