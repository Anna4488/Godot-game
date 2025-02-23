extends Area2D

var nev="kulcs"

signal felvesz(nev,node)



func _on_Kulcs_body_entered(body):
	emit_signal("felvesz",nev,self)
