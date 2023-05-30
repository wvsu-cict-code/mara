extends Area2D

var cd = false
@export var spring = 700
@export var cool_down = 3
@onready var timer = $ObjectTimer
@onready var mush = $AnimatedSprite2D
var player = load("res://scene/character/Player.tscn").instantiate()

func _ready():
	mush.play("Idle")

func _on_object_timer_timeout():
	cd = false
	mush.play("Idle")
	timer.stop()


func _on_body_entered(body):
	if body.name == "Player" and cd == false:
		player.call("on_air",true)
		cd = true
		mush.play("Bounce")
		$"../../Player".velocity.y = -spring
		await mush.animation_finished
		timer.start(cool_down)
		mush.play("Cooling")
	pass # Replace with function body.
