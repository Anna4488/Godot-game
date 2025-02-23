extends Node2D

var blueending=false
var timedout=false

func _ready():
	$AnimatedSprite.visible=false
	$Timer.paused=true


func _on_Targyak_painterisblue():
	blueending=true




func _on_Main_outro():
	$Timer.paused=false


func _on_Timer_timeout():
	$AnimatedSprite.visible=true
	if blueending==false:
		$redending.play("walking")
	else:
		$blueending.play("walking")





