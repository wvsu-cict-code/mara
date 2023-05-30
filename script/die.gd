extends Area2D
@onready var spawn = $"../Spawnpoint"


func _on_body_entered(body):
	if body.name == "Player":
		$"../../Player".position = spawn.position
		pass
