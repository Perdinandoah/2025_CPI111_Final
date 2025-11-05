//Dash continues
if(dashSteps > 0){
	///move
	var predictedX = x + (playerDirection * dashStepDistance);
	if(!place_meeting(predictedX, y, obj_collidable)){
		x = predictedX;
	}
	
	dashSteps--;
	
	alarm[6] = 1;
}


//Dash is over
else{
	//set flags
	isDashing = false;
	canMove = true;
	canAttack = true;
	canBlock = true;
	canEvade = true;
	
	//reset variables
	dashCharge = 1;
	dashSteps = 10;
	alarm[7] = room_speed * dashCooldown;
}