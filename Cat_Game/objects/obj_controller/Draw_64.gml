draw_text(10,10,("Postition: " + string(obj_player.x) + "," + string(obj_player.y) +"\n" + "Veloctiy: " + string(obj_player.velocityX) + "," + string(obj_player.velocityY) +
"\n" + "CJ: " + string(obj_player.canJump)
+ " IF: " + string(obj_player.isFalling)
+ " IJ: " + string(obj_player.isJumping)
+ " IA: " + string(obj_player.inAir)
+ " OG: " + string(obj_player.onGround)
+ " CA: " + string(obj_player.canAttack)
+ " PD: " + string(obj_player.playerDirection)));

draw_healthbar(400, 10, 415, 100, health, c_black, c_red, c_green, 3, true, false)