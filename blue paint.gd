extends Area2D


var nev="bluepaint"

signal felvesz(nev,node)



func _on_bluepaint_body_entered(body):
	emit_signal("felvesz",nev,self)
