//Dash continues
if(dashSteps > 0){
	///move
	instance_create_layer(x, y, "AttackBoxes", obj_strayCatDashAttackBox)
	var predictedX = x + (enemyDirection * dashStepDistance);
	if(!place_meeting(predictedX, y, obj_collidable)){
		x = predictedX;
	}
	
	dashSteps--;
	
	alarm[4] = 1;
}


//Dash is over
else{
	//set flags
	strayCatCooldown(longCoolDown);
	dashCharge = defaultDashCharge;
	dashSteps = defaultDashSteps;
}