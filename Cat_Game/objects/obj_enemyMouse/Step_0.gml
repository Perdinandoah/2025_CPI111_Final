velocityY += obj_controller.gameGravity;


//check if y collision will occur
var predictedY = y + velocityY;
if(!place_meeting(x, predictedY, obj_collidable)){
	y += velocityY;
}
else{ //ease the enemy against the wall
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


//if enemy is on ground
if(bbox_bottom >= room_height){
	y = room_height - midHeight;
	velocityY = 0;
	onGround = true;
	inAir = false;
	isJumping = false;
	isFalling = false;
	canJump = true;	
}


if(velocityY >= 0 && inAir = true){
	isFalling = true;
}


//if enemey is out of room
if(bbox_right >= room_width || bbox_left <=0){
	instance_destroy(self);
}

//BEHAVIOUR--------------------------------------------------------------------
//Roam and check for player
if(state == 0){
	//Check if x collision will occur
	var predictedX = x + enemyDirection * (velocityX + midWidth/5);
	if(!place_meeting(predictedX, y, obj_collidable)){
		x += (enemyDirection * velocityX);
		image_xscale = enemyDirection;
	}
	else{
		enemyDirection *= -1;
		}
	
	
	if(distance_to_object(obj_player) < playerDistanceThreshold){
		state = 1;
		seesPlayer = true;
	}
}
//Hold ground and defend self
else if(state == 1){
	if(obj_player.x < x){
		enemyDirection = -1;
		image_xscale = enemyDirection;
	}
	else{
		enemyDirection = 1;
		image_xscale = enemyDirection;
	}
	if(distance_to_object(obj_player) > playerDistanceThreshold){
		state = 0;
		seesPlayer = false;
	}
	
}