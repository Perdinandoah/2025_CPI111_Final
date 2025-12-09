			/****** Damaged By Pidgeon *****/

if(canBeDamaged = true){
canBeDamaged = false;

//Change damage recieved based on blocking
if(isBlocking == false){
health -= obj_enemyBat.attackPower;
}
else{
health -= (0.5 * obj_enemyBat.attackPower);
}

playerKnockBack();

//Invincibilty frames
alarm[1] = iFrames;

audio_play_sound(snd_crunch, 1, false);

}