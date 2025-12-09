			/****** Damaged By Mouse *****/

if(canBeDamaged = true){
canBeDamaged = false;

//Change damage recieved based on blocking
if(isBlocking == false){
health -= obj_enemyMouse.attackPower;
}
else{
health -= (0.5 * obj_enemyMouse.attackPower);
}

playerKnockBack();

//Invincibilty frames
alarm[1] = iFrames;

audio_play_sound(snd_crunch, 1, false);
}