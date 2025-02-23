extends CanvasLayer

signal BGMon()
signal BGMoff()
signal SFXon()
signal SFXoff()

var zene_allapota = true

func _on_Button_pressed():
	if zene_allapota:
		$ZeneGomb.animation = "ki"
		emit_signal("BGMoff")
	else:
		$ZeneGomb.animation = "be"
		emit_signal("BGMon")
	zene_allapota = !zene_allapota

var sfx_allapota = true

func _on_Button_sfx_pressed():
	if sfx_allapota:
		$SFXGomb.animation = "ki"
		emit_signal("SFXoff")
	else:
		$SFXGomb.animation = "be"
	emit_signal("SFXon")
	sfx_allapota = !sfx_allapota
