function enemyChangeDirection(){
	if(obj_player.x < self.x){
        enemyDirection = -1;
    }
    
    else{
        enemyDirection = 1;
    }
}