function playerKnockBack(){
	var predictedX = x + (-playerDirection * knockbackDistance);
	if(!place_meeting(predictedX, y, obj_collidable)){
		x = predictedX;
	}
}