extends KinematicBody2D

var from
var beszel = false

func beszel():
	beszel = true
	$AnimatedSprite.animation="speak"

func hallgat():
	beszel = false
	$AnimatedSprite.animation="stay"

func _ready():
	from = position.x

var mozgas = 50
var irany
func _physics_process(delta):
	if beszel:
		return
	if position.x >= from:
		irany = -mozgas
		$AnimatedSprite.flip_h = false
	if position.x <= from-100:
		irany = mozgas
		$AnimatedSprite.flip_h = true
	position.x += irany*delta
	
