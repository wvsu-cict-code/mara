extends HBoxContainer

@export var label = String()
@export var bus_name = String()
@onready var Filename = SaveData.Filename
var audio_stream_player: AudioStreamPlayer
@onready var bus_idX = AudioServer.get_bus_index(bus_name)
@onready var pers = $HSlider.value
@onready var def = ($HSlider.min_value/2)

func _on_masters_slider_value_changed(value):
	$Perc.text = "%s" % [(value+20)*5] + " %"
	if value > $HSlider.min_value:
		AudioServer.set_bus_mute(bus_idX, false)
		AudioServer.set_bus_volume_db(bus_idX, value)
	else:
		AudioServer.set_bus_mute(bus_idX, true)
	if bus_name.begins_with("SFX"):
		$Delay.start()


func save():
	var S_data = {
	"filename" : get_scene_file_path(),
	"parent" : get_parent().get_path(),
	"pos_x" : position.x,
	"pos_y" : position.y,
	"BusName": bus_name,
	"Volume": $HSlider.value
	}
	return S_data

func _on_ready():
	$Label.text = label
	$Perc.text = "%s" % [(pers+20)*5]  + " %"


func _on_delay_timeout():
	Sounds.Bsfx.play()
	$Delay.stop()
	
func update_Slide(busname,volume):
	bus_name = busname
	bus_idX = AudioServer.get_bus_index(bus_name)
	$Label.text = busname
	$HSlider.set_value_no_signal(volume)
	pers = $HSlider.value
	$Perc.text = "%s" % [(pers+20)*5]  + " %"
