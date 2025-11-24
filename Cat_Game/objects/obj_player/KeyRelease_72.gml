			/****** Dash *****/


if(isCharging){
	
	isCharging = false;
	
	if(dashCharge > 1){
	//set flags
	isDashing = true;
	canMove = false;
	canAttack = false;
	canBlock = false;
	
	//compute distance
	totalDashDistance = dashDistance * dashCharge;
	dashStepDistance = totalDashDistance / dashSteps;
	
	//start dash movement
	alarm[6] = 1
	}
}