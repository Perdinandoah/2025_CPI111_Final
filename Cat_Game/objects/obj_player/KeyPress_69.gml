			/****** Evade *****/
if(canEvade && !isAttacking && !isBlocking){
	isEvading = true;
	canEvade = false;
	canMove = false;
	canAttack = false;
	canBlock = false;
	
	//start evade movement
	evadeSteps = 8
	alarm[4] = 1;
	
	//evade cooldown
	alarm[5] = room_speed * evadeCooldown;
	
}