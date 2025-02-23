extends Area2D

var nev="kocka"

signal felvesz(nev,node)



func _on_Kocka_body_entered(body):
	emit_signal("felvesz",nev,self)
