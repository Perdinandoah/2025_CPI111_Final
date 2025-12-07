
//if enemey is out of room
if(bbox_right >= room_width || bbox_left <=0){
	instance_destroy(self);
}

//change sprite direction
image_xscale = enemyDirection;

//spawn attack box
if(canAttack == 1){
	instance_create_layer(x, y, "Instances", obj_batAttackBox);
}

//BEHAVIOUR--------------------------------------------------------------------
//only update x velocity if player is nearby
if((abs(x - obj_player.x)) < playerDistanceThreshold){
		x += enemyDirection * velocityX;
	}

//med height -> max height
if(state == 0){
	if(y >= maxHeight){
		y -= slowVel;
	}
	else{
		state = 1;
	}
}
//max height -> med height
if(state == 1){
	if(y <= medHeight){
		y += fastVel;
	}
	else{
		state = 2;
	}
}
//med height -> min height
if(state == 2){
	if(y <= minHeight){
		y += slowVel;
	}
	else{
		state = 3;
	}
}


//min height -> med height
if(state == 3){
	if(y >= medHeight){
		y -= fastVel;
	}
	else{
		state = 0;
	}
}

//death
if(state == 4){
	canAttack = 0;
	canBeDamaged = 0;
	velocityX = 0;
	y += fastVel * 5;
}

