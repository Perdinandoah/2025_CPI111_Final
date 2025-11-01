if(canAttack == true){
	canAttack = false;
	var hitBoxX = x + (playerDirection * midWidth);
	var hitBoxY = y;
	
	instance_create_layer(hitBoxX, hitBoxY, "instances", obj_playerAttack1Box);
	
	alarm[0] = attack1Cooldown * room_speed;
	
}