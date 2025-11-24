velocityY += obj_controller.gameGravity;

//update direction
image_xscale = enemyDirection;


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
//state 0
if(state == 0){//patrolling
	//check if cat is outside territory
	if(enemyDirection == 1 && x >= rightTerritoryBound){
		enemyDirection = -1;
	}
	
	if(enemyDirection == -1 && x <= leftTerritoryBound){
		enemyDirection = 1;
	}
	strayCatMove()
	
	//check if player is near and in territory
	if((abs(obj_player.x - self.x) < playerDistanceThreshold) &&
	(obj_player.x > leftTerritoryBound && obj_player.x < rightTerritoryBound)){
		state = 1;
		seesPlayer = true
	}
}

if(state == 1){//approach player
	//change direction towards player
	enemyFacePlayer()
	
	//move towards player untill in range
	if(abs(obj_player.x - self.x) > attackRange){
		strayCatMove()
	}
	else{
		state = 2;
	}
	//reset to state0 if player leaves territory ONLY
	if(!(obj_player.x > leftTerritoryBound && obj_player.x < rightTerritoryBound)){
		state = 0;
	}
}

if(state == 2){
	
}
	
	