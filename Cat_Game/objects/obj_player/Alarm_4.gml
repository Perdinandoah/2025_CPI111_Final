			/****** Evade Movement *****/


//Move player back in segments
if(evadeSteps > 1){
	var stepBack = evadeDistance / 8;
	
	//check for collision then move
	var predictedX = x - (stepBack * playerDirection);
	if (!place_meeting(predictedX, y, obj_collidable)) {
		x = predictedX;
	}
	evadeSteps -= 1;
	
	//repeat on delay
	alarm[4] = 1;
	
}

//if evade steps run out, finish evade
else{
	isEvading = false;
	canMove = true;
	canAttack = true;
	canBlock = true;
}