extends Node2D

signal start_game()


func start():
	pass # Replace with function body.
	$AnimationPlayer.play("intro")

func _on_TextureButton_pressed():
	emit_signal("start_game")
