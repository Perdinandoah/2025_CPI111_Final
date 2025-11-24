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
//state 0
if(state == 0){//patrolling
	//check if cat is outside territory
	if(enemyDirection == 1 && x >= rightTerritoryBound){
		enemyDirection = -1;
	}
	
	if(enemyDirection == -1 && x <= leftTerritoryBound){
		enemyDirection = 1;
	}
	
	//move cat forward if no obstacle
	var predictedX = x + enemyDirection * (velocityX + midWidth/5);
	if(!place_meeting(predictedX, y, obj_collidable)){
		x += (enemyDirection * velocityX);
		image_xscale = enemyDirection;
		isJumping = false;
	}
	//if obstacle
	else{
		//if obstacle is jumpable
		if(!place_meeting(predictedX, y - 100, obj_collidable)){
			if(canJump){
				canJump = false;
				isJumping = true;
				strayCatJump();
				alarm[2] = jumpCooldown * room_speed;
			}
			else{
				x += 0;//pause so cat can jump
			}
		}
		//if obstacle can not be jumped
		else{
			enemyDirection *= -1;
			isJumping = false;
		}
	}
}