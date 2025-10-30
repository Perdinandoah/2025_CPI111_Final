//change direction
image_xscale = -1;
//Check if x collision will occur
var predictedX = x - midWidth/5 - velocityX;
if(!place_meeting(predictedX, y, obj_collidable)){
	x -= velocityX;
}
else{
	x += 0
}