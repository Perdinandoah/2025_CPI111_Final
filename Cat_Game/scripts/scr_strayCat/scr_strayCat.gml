function strayCatJump(){
velocityY = jumpPower;
}

function strayCatMove(){
	if(canMove){
		var predictedX = x + enemyDirection * (velocityX + midWidth/5);
		if(!place_meeting(predictedX, y, obj_collidable)){
			x += (enemyDirection * velocityX);
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
	
}

function strayCatActions(givenBoolean){
	canAttack = givenBoolean;
	canDash = givenBoolean;
	canBlock = givenBoolean;
	canEvade = givenBoolean;
	canMove = givenBoolean;
	
}

function strayCatCooldown(cooldown){
	alarm[3] = cooldown * room_speed;
}