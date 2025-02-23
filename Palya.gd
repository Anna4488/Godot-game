extends Node2D


signal palya_akcio(akcio_kod, node)


	
func open_door(ajto_node):
	emit_signal("palya_akcio",1 , ajto_node)
	pass
