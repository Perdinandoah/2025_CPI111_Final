			/****** Move Right *****/


if(canMove){
playerDirection = 1;

image_xscale = playerDirection;

//Check if x collision will occur
var predictedX = x + midWidth/5 + velocityX;
if(!place_meeting(predictedX, y, obj_collidable)){
	x += velocityX;
}
else{
	//checks if there are stairs to climb
	if(!place_meeting(predictedX, y - abs(midHeight/5 + velocityX) -2, obj_collidable)){
		while(place_meeting(predictedX, y, obj_collidable)){
			y -= 1	
		}
		x += velocityX;
	}
	else{
	
	x += 0
	}
}


}