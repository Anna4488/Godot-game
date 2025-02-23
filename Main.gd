extends Node2D


export (Array, String) var inventory
export (Array, String) var targyak
export (Array, Texture) var kepek
var targyak_kepek = {}
signal outro()

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(len(targyak)):
		var sprite = Sprite.new()
		sprite.texture = kepek[i]
		targyak_kepek[targyak[i]] = sprite
	$Targyak.connect("felvesz",self,"inventory_plus")
	$Player.connect("start_conversation",self,"beszel")
	$Palya.connect("palya_akcio",self,"ajto")
	$HUD.connect("BGMon",self,"BGMon")
	$HUD.connect("BGMoff",self,"BGMoff")
	$Timer.paused=true
	
	
func inventory_plus(nev):
	print("Inventory nő: ",nev)
	inventory.append(nev)
	#$Player.show_item(targyak_kepek[nev])

func beszel(node):
	print("Ezzel beszél: ",node)
	if node.name=="Kislany":
		if not "bluepaint" in inventory:
			$Dialog.startdialog(1,node)
		else:
			$Dialog.startdialog(2, node)
	if node.name=="Boltos":
		if not "penz" in inventory: 
			$Dialog.startdialog(3, node)
		else:
			if not "oldoszer" in inventory:
				$Dialog.startdialog(4, node)
				inventory_plus("oldoszer")
			else:
				$Dialog.startdialog(5, node)
	if node.name=="Festo":
		if not "bucket" in inventory:
			$Dialog.startdialog(6, node)
		else:
			if not "penz" in inventory:
				$Dialog.startdialog(7, node)
				inventory_plus("penz")
			else:
				$Dialog.startdialog(8, node)

func ajto(num, node):
	if num == 1 and "kulcs" in inventory:
		print("végre")
		node.nyilj_ki()


func _process(delta):
	if "rongy" in inventory and "oldoszer" in inventory:
		print("win")
		$Timer.paused=false

func BGMoff():
	$AudioStreamPlayer.playing = false

func BGMon():
	$AudioStreamPlayer.playing = true




func _on_Timer_timeout():
	emit_signal("outro")
	$Palya.queue_free()
	$NPC.queue_free()
	$Player.queue_free()
	$Targyak.queue_free()
