extends Area2D


var nev="bucket"

signal felvesz(nev,node)




func _on_Bucket_body_entered(body):
	emit_signal("felvesz",nev,self)
