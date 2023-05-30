extends Node

@onready var m1 = $Main1
@onready var m2 = $Main2
@onready var Bsfx = $BSfx
@onready var Pickup = $Pick
@onready var Drop = $Drop
@onready var Start = $Starts

@onready var current = [m1,m2]
@onready var next
@onready var bus_idX 

func _ready():
	next = current.pick_random()


func _on_main_1_finished():
	next = current.pick_random()
	next.play()

func _on_main_2_finished():
	next = current.pick_random()
	next.play()

func volFromsettings(bname,vol):
	
	bus_idX = AudioServer.get_bus_index(bname)
	if vol > -20:
		AudioServer.set_bus_mute(bus_idX, false)
		AudioServer.set_bus_volume_db(bus_idX, vol)
	else:
		AudioServer.set_bus_mute(bus_idX, true)
