extends StaticBody2D

export var closed = false
signal nyit(node)

func collide(node):
	if node is KinematicBody2D:
		if not closed:
			nyilj_ki()
		else:
			emit_signal("nyit",self)

func stop_collide(body):
	if body is KinematicBody2D:
		close()
	pass


func nyilj_ki():
	closed = false
	$AnimatedSprite.animation="nyit"
	$CollisionShape2D.set_deferred("disabled", true)

func close():
	$AnimatedSprite.animation = "zar"
	$CollisionShape2D.set_deferred("disabled", false)
