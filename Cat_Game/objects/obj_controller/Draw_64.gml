draw_healthbar(healthBarX, healthBarY, (healthBarX + healthBarWidth), (healthBarY + healthBarHeight),
health, c_black, c_red, c_green, 3, true, false)

draw_set_colour(c_white);
draw_set_font(FNT_Debug)
draw_text(10,10,("Postition: " + string(obj_player.x) + "," + string(obj_player.y) +"\n" + "Veloctiy: " + string(obj_player.velocityX) + "," + string(obj_player.velocityY)
+ "\nCan Jump: " + string(obj_player.canJump)
+ "Can Move: " + string(obj_player.canMove)
+ " \nIs Falling: " + string(obj_player.isFalling)
+ " Is Jumping: " + string(obj_player.isJumping)
+ " Jump Power: " + string(obj_player.jumpPower)
+ "Coyote Timer: " + string(obj_player.coyoteTimer)
+ " In Air: " + string(obj_player.inAir)
+ " On Ground: " + string(obj_player.onGround)
+ " \nCan Attack: " + string(obj_player.canAttack)
+ " Is Attacking: " + string(obj_player.isAttacking)
+ " \nCan Block: " + string(obj_player.canBlock)
+ " Is Blocking: " + string(obj_player.isBlocking)
+ " \nCan Evade: " + string(obj_player.canEvade)
+ " Is Evading: " + string(obj_player.isEvading)
+ " \nCan Dash: " + string(obj_player.canDash)
+ " Is Charging: " + string(obj_player.isCharging)
+ " Is Dashing: " + string(obj_player.isDashing)
+ " Charge Amount: " + string(obj_player.dashCharge)
+ " \nPlayer Direction: " + string(obj_player.playerDirection)));


if(showDir){
	draw_set_font(FNT_Tutorial)
	draw_text(512,288,"PRESS A AND D TO MOVE")
	if(keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D"))){
		showDir = false
	}
}

if(showBlock){
	draw_set_font(FNT_Tutorial)
	draw_text(512,288,"PRESS B TO BLOCK DAMAGE")
	if(keyboard_check_pressed(ord("B"))){
		showBlock = false
	}
}
if(showDash){
	draw_set_font(FNT_Tutorial)
	draw_text(512,288,"PRESS H TO CHARGE DASH TO DAMAGE\nOR TO JUMP FURTHER")
	if(keyboard_check_pressed(ord("H"))){
		showDash = false
	}
}
if(showJump){
	draw_set_font(FNT_Tutorial)
	draw_text(512,288,"PRESS SPACE TO JUMP \nAND HOLD FOR HIGHER JUMPS")
	if(keyboard_check_pressed(vk_space)){
		showJump = false
	}
}
if(showAttack){
	draw_set_font(FNT_Tutorial)
	draw_text(512,288,"PRESS J TO ATTACK")
	if(keyboard_check_pressed(ord("J"))){
		showAttack = false
	}
}
if(showEvade){
	draw_set_font(FNT_Tutorial)
	draw_text(512,288,"PRESS E TO EVADE")
	if(keyboard_check_pressed(ord("E"))){
		showEvade = false
	}
}
if(showInteract){
	draw_set_font(FNT_Tutorial)
	draw_text(512,288,"PRESS S TO INTERACT")
	if(keyboard_check_pressed(ord("S"))){
		showInteract = false
	}
}
