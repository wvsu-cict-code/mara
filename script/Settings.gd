extends Node
@export var scene_from = ChangeScene.Menu

func _ready():
	$BG/AnimatedSprite2D.play("Settings")
	SaveData.load_settings()
	pass
	
func _on_save_nexit_pressed():
	Sounds.Bsfx.play()
	SaveData.save_settings()
	ChangeScene.Next(scene_from)
	pass # Replace with function body.

func disableDef(n):
	if n == true:
		$BG/HBoxContainer/Default.disabled = true
	else:
		$BG/HBoxContainer/Default.disabled = n

func _on_default_pressed():
	Sounds.Bsfx.play()
	SaveData.def_vol()
	SaveData.load_vol()
