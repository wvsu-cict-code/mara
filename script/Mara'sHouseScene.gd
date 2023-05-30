extends Node2D

@onready var player = $Player
@onready var Cam = $Cammove
@onready var Up = $InteractButtons/goUp
@onready var Down = $InteractButtons/goDown
@onready var Out = $InteractButtons/goOut
	
func _ready():
	$CanvasGroup/Emunah.play("default")
	Cam.play("ToFirst")

func tosecond():
	ChangeScene.show()
	ChangeScene.anim.play("Fadein")
	await ChangeScene.anim.animation_finished
	Cam.play("ToSecond")
	ChangeScene.anim.play("Fadeout")
	
func tofirst():
	ChangeScene.show()
	ChangeScene.anim.play("Fadein")
	await ChangeScene.anim.animation_finished
	Cam.play("ToFirst")
	ChangeScene.anim.play("Fadeout")


func _on_down_stairs_body_entered(body):
	if body.name == "Player":
		Down.show()
	pass # Replace with function body.


func _on_down_stairs_body_exited(body):
	if body.name == "Player":
		Down.hide()
	pass # Replace with function body.

func _on_go_down_pressed():
	tofirst()
	pass # Replace with function body.



func _on_stairs_body_entered(body):
	if body.name == "Player":
		Up.show()
	pass # Replace with function body.


func _on_stairs_body_exited(body):
	if body.name == "Player":
		Up.hide()
	pass # Replace with function body.

func _on_go_up_pressed():
	tosecond()
	pass # Replace with function body.



func _on_outside_body_entered(body):
	if body.name == "Player":
		Out.show()
	pass # Replace with function body.


func _on_outside_body_exited(body):
	if body.name == "Player":
		Out.hide()
	pass # Replace with function body.


func _on_go_out_pressed():
	ChangeScene.fade(ChangeScene.Main)
	pass # Replace with function body.
