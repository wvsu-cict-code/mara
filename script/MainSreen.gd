extends Node

func _ready():
	$BG/AnimatedSprite2D.play("Title")
	SaveData.load_vol()
	if Sounds.next.playing != true:
		Sounds.next.play()


func _on_play_pressed():
	Sounds.Bsfx.play()
	ChangeScene.Next(ChangeScene.Main)
	

func _on_settings_pressed():
	Sounds.Bsfx.play()
	ChangeScene.Next(ChangeScene.Settings)


func _on_lore_pressed():
	Sounds.Bsfx.play()
	ChangeScene.Next(ChangeScene.Lore)


func _on_credits_pressed():
	Sounds.Bsfx.play()


func _on_exit_pressed():
	Sounds.Bsfx.play()
	get_tree().quit()
