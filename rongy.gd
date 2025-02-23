extends Area2D


var nev="rongy"

signal felvesz(nev,node)


func _on_rongy_body_entered(body):
	emit_signal("felvesz",nev,self)
