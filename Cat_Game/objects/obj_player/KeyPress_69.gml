// Evade
if(canEvade && !isAttacking && !isBlocking){
	isEvading = true;
	canEvade = false;
	canMove = false;
	canAttack = false;
	canBlock = false;
	
	evadeSteps = 8
	alarm[4] = 1;
	
	alarm[5] = room_speed * evadeCooldown;
	
}