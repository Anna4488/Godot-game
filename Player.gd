extends KinematicBody2D

var speed=200

var leftwalk="leftwalkred"
var leftstay="leftstayred"
var upwalk="upwalkred"
var upstay="upstayred"
var downwalk="downwalkred"
var downstay="downstayred"

signal start_conversation(node)
signal vege(node)

var statfig="downstay"
func _ready():
	pass # Replace with function body.
	$CollisionShape2D2.disabled=true
	$CollisionShape2D.disabled=false
	
	
func _physics_process(delta):
	var x=0
	var y=0
	var changeframe
	if Input.is_action_pressed("ui_left"):
		changeframe=leftwalk
		$AnimatedSprite.flip_h=false
		statfig=leftstay
		x-=1
		$RayCast2D.rotation_degrees=180
		$CollisionShape2D.disabled=false
		$CollisionShape2D2.disabled=true
	if Input.is_action_pressed("ui_right"):
		changeframe=leftwalk
		$AnimatedSprite.flip_h=true
		x+=1
		statfig=leftstay
		$RayCast2D.rotation_degrees=0
		$CollisionShape2D.disabled=false
		$CollisionShape2D2.disabled=true
	if Input.is_action_pressed("ui_up"):
		changeframe=upwalk
		y-=1
		statfig=upstay
		$RayCast2D.rotation_degrees=270
		$CollisionShape2D.disabled=true
		$CollisionShape2D2.disabled=false
	if Input.is_action_pressed("ui_down"):
		changeframe=downwalk
		y+=1
		statfig=downstay
		$RayCast2D.rotation_degrees=90
		$CollisionShape2D.disabled=true
		$CollisionShape2D2.disabled=false
	if x==0 and y==0:
		$AnimatedSprite.animation=statfig
	else:
		if $AnimatedSprite.animation!=changeframe:
			$AnimatedSprite.animation=changeframe
		var movec=Vector2(x,y).normalized()
		move_and_collide(movec*speed*delta,false)
	if Input.is_action_just_pressed("ui_select"):
		#$RayCast2D.enabled=true
		var node=$RayCast2D.get_collider()
		#$RayCast2D.enabled=false
		if (node):
			emit_signal("start_conversation",node)
			
func show_item(sprite):
	$Area2D.add_child(sprite)	
	$AnimationPlayer.play("eltunes")
	yield($AnimationPlayer,"animation_finished")
	$Area2D.remove_child(sprite)		
	
func blue():
	leftwalk="leftwalkblue"
	leftstay="leftstayblue"
	upwalk="upwalkblue"
	upstay="upstayblue"
	downwalk="downwalkblue"
	downstay="downstayblue"
	
