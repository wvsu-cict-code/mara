extends CanvasLayer

@export var disable_pick_button = false
@onready var Pause = $Popup
@onready var Pickup = $Pick
@onready var Drop = $Drop
@onready var click = Sounds.Bsfx
var busname
var bus_idX
var can_pick

func _ready():
	Drop.hide()
	Pickup.disabled = disable_pick_button
	if disable_pick_button == true:
		Pickup.hide()
	else:
		Pickup.show()
	$ParallaxBackground.hide()
	
	pass

func _process(_delta):
	if can_pick and disable_pick_button != true:
		Drop.hide()
		Pickup.show()
	elif disable_pick_button != true:
		Pickup.hide()
		Drop.show()
		
	
func _on_left_button_down():
	Input.action_press("ui_left")
	pass # Replace with function body.

func _on_left_button_up():
	Input.action_release("ui_left")
	pass # Replace with function body.

func _on_right_button_down():
	Input.action_press("ui_right")
	pass # Replace with function body.

func _on_right_button_up():
	Input.action_release("ui_right")
	pass # Replace with function body.

func _on_jump_button_down():
	Input.action_press("ui_up")
	pass # Replace with function body.

func _on_jump_button_up():
	Input.action_release("ui_up")
	pass # Replace with function body.

func _on_pick_pressed():
	Sounds.Drop.play()
	can_pick = false
	pass # Replace with function body.

func _on_drop_pressed():
	Sounds.Pickup.play()
	can_pick = true
	pass # Replace with function body.

func _on_pause_pressed():
	click.play()
	get_tree().paused = true
	Pause.popup()
	pass # Replace with function body.

func _on_texture_button_pressed():
	click.play()
	get_tree().paused = false
	Pause.hide()
	pass # Replace with function body.

func _on_mainmenu_pressed():
	click.play()
	$ParallaxBackground.show()
	get_tree().paused = false
	Pause.hide()
	ChangeScene.Next(ChangeScene.Menu)
	pass # Replace with function body.

func _on_master_toggled(button_pressed):
	click.play()
	busname = "Master"
	bus_idX = AudioServer.get_bus_index(busname)
	if button_pressed:
		AudioServer.set_bus_mute(bus_idX, true)
	else:
		AudioServer.set_bus_mute(bus_idX, false)
	pass # Replace with function body.

func _on_music_toggled(button_pressed):
	click.play()
	busname = "Music"
	bus_idX = AudioServer.get_bus_index(busname)
	if button_pressed:
		AudioServer.set_bus_mute(bus_idX, true)
	else:
		AudioServer.set_bus_mute(bus_idX, false)
	pass # Replace with function body.

func _on_sfx_toggled(button_pressed):
	click.play()
	busname = "SFX"
	bus_idX = AudioServer.get_bus_index(busname)
	if button_pressed:
		AudioServer.set_bus_mute(bus_idX, true)
	else:
		AudioServer.set_bus_mute(bus_idX, false)
	pass # Replace with function body.
