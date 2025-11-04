velocityY += obj_controller.gameGravity;

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

//room collision
if(bbox_bottom >= room_height){
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


