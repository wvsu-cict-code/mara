extends Node2D

@onready var In = $InteractButtons/goIn


func _on_inside_body_entered(body):
	if body.name == "Player":
		In.show()
	pass # Replace with function body.


func _on_inside_body_exited(body):
	if body.name == "Player":
		In.hide()
	pass # Replace with function body.


func _on_go_in_pressed():
	ChangeScene.fade(ChangeScene.Mainfloor)
	pass # Replace with function body.
