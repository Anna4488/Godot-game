extends CanvasLayer

var szoveg={}

var szovegszam
var sorszam
var npc

var active=false


func _ready():
	var file = File.new()
	var dialog_number = 0
	file.open("res://dialog.dat", File.READ)
	var content = file.get_as_text().split("\n")
	print(content)
	for i in content:
		if i[0] == ".":
			dialog_number = int(i.substr(1, -1))
			szoveg[dialog_number] =  []
			continue
		print(i)
		szoveg[dialog_number].append(i)
	print(szoveg)
	file.close()
	


func startdialog(dialog_szama,npc_node):
	if not $Timer.time_left==0: return
	get_tree().paused=true
	sorszam=0
	szovegszam=dialog_szama
	$TextureRect/RichTextLabel.text=szoveg[szovegszam][sorszam]
	$TextureRect.visible=true
	active=true
	npc=npc_node
	npc.beszel()

func _input(event):
	if not active: return
	if event.is_action_pressed("ui_select"):
		if sorszam==len(szoveg[szovegszam])-1:
			active=false
			$TextureRect.visible=false
			$Timer.start()
			get_tree().paused=false
			npc.hallgat()
			
		else:
			sorszam+=1
			$TextureRect/RichTextLabel.text=szoveg[szovegszam][sorszam]
