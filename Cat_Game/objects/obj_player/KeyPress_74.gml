			/****** Attack *****/


if(canAttack && !isBlocking && !isEvading){
	canAttack = false;
	
	//sprite change
	sprCanChange = false;
	sprite_index = spr_playerSwipe;
	alarm[8] = 0.25 * room_speed;
	
	var hitBoxX = x + (playerDirection * midWidth);
	var hitBoxY = y;
	
	instance_create_layer(hitBoxX, hitBoxY, "AttackBoxes", obj_playerAttack1Box);
	
	//attack cooldown
	alarm[0] = attack1Cooldown * room_speed;
	
}
audio_play_sound(snd_attack,1,false);