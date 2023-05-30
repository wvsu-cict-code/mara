extends CanvasLayer

const Menu = "res://scene/ui/Main.tscn"
const Settings = "res://scene/ui/Settings.tscn"
const Lore = "res://scene/Lore/Lore.tscn"
const Main = "res://scene/levels/Forest.tscn"
const Mainfloor = "res://scene/levels/AltarRoom.tscn"

@onready var anim = $Trans

func Next(scene):
	self.show()
	anim.play("Loading")
	Sounds.Start.play()
	await anim.animation_finished
	
	get_tree().change_scene_to_file(scene)
	
	anim.play("LoadingOut")
	Sounds.Start.play()
	await  anim.animation_finished
	self.hide()

func fade(scene):
	self.show()
	anim.play("Fadein")
	await anim.animation_finished
	
	get_tree().change_scene_to_file(scene)
	
	anim.play("Fadeout")
	Sounds.Start.play()
	await  anim.animation_finished
	self.hide()
	

func _ready():
	self.hide()
	pass # Replace with function body.
