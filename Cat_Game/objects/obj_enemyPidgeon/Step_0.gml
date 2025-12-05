
//Rising and Diving state control
if(velocityY > 0 && inAir = true){
	isDiving = true;
	isRising = false;
}

if(velocityY < 0 && inAir = true){
	isDiving = false;
	isRising = true;
}

if(velocityY = 0 && inAir = true){
	isDiving = false;
	isRising = false;
}

//BEHAVIOUR--------------------------------------------------------------------
//state 0, stationary
if(state == 0){
	seesPlayer = 0;
	
	if((abs(x - obj_player.x)) < playerDistanceThreshold){
		state = 1;
	}
}

//state 1, approach player
else if(state == 1){
	seesPlayer = 1;
	
	//change direction
	if(obj_player.x < x){
		enemyDirection = -1;
		image_xscale = enemyDirection;
	}
	else{
		enemyDirection = 1;
		image_xscale = enemyDirection;
	
	}
	x += (velocityX * enemyDirection);
	
	if((abs(x - obj_player.x)) < 300){
		state = 2;
		defaultY = y;
		targetY = obj_player.y;
	}
}
//Swoop down at player
else if(state == 2){
	if(y < targetY){
		y += velocityY;
		x += (velocityX * enemyDirection);
		instance_create_layer(x ,y, "AttackBoxes", obj_pidgeonAttackBox);
	}
	
	else if(y >= targetY){
		state = 3;
	}
}

//Rise up and fly away
else if(state == 3){
	if(y > defaultY){
		y -= velocityY
		x += (velocityX * enemyDirection);
	}
	else if(y <= defaultY){
		state = 0;
	}
}

//On death
if(state == 4){
	y += (velocityY * 1.5);
	
}
	