extends Node2D


onready var bluep = get_node("bluepaint")

signal felvesz(nev)
signal painterisblue()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Kocka.connect("felvesz",self,"felvett")
	$Kocka.position=$Kocka/Kockapos.position
	$Kulcs.connect("felvesz",self,"felvett")
	$Kulcs.position=$Kulcs/Kulcspos.position
	$Bucket.connect("felvesz",self,"felvett")
	$Bucket.position=$Bucket/bucketpos.position
	$bluepaint.connect("felvesz",self,"felvett")
	$bluepaint.position=$bluepaint/bluepaintpos.position
	$rongy.connect("felvesz",self,"felvett")
	$rongy.position=$rongy/rongypos.position
	
	
	
	

func felvett(nev,node):
	print("Felvette: ",nev,node)
	$targyfelvesz.playing=true
	emit_signal("felvesz",nev)
	node.queue_free()
	


func _on_bluepaint_felvesz(nev, node):
	emit_signal("painterisblue")
