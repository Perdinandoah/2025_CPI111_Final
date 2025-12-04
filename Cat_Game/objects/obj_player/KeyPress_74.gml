			/****** Attack *****/


if(canAttack && !isBlocking && !isEvading){
	canAttack = false;
	var hitBoxX = x + (playerDirection * midWidth);
	var hitBoxY = y;
	
	instance_create_layer(hitBoxX, hitBoxY, "AttackBoxes", obj_playerAttack1Box);
	
	//attack cooldown
	alarm[0] = attack1Cooldown * room_speed;
	
}
audio_play_sound(snd_attack,1,false);