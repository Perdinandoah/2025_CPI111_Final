			/****** Move Left *****/


if(canMove){
playerDirection = -1;

image_xscale = playerDirection;

//Check if x collision will occur
var predictedX = x - midWidth/5 - velocityX;
if(!place_meeting(predictedX, y, obj_collidable)){
	x -= velocityX;
}
else{
	x += 0
}

}