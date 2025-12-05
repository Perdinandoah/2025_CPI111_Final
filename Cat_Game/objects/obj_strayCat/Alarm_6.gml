//Move player back in segments
if(evadeSteps > 1){
	var stepBack = evadeDistance / defaultDashSteps;
	
	//check for collision then move
	var predictedX = x - (stepBack * enemyDirection);
	if (!place_meeting(predictedX, y, obj_collidable)) {
		x = predictedX;
	}
	evadeSteps -= 1;
	
	//repeat on delay
	alarm[6] = 1;
	
}

//if evade steps run out, finish evade
else{
	strayCatCooldown(longCoolDown);
}