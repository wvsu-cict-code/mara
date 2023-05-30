extends Node2D
@onready var Move = $AnimationPlayer
@onready var click = Sounds.Bsfx
@onready var Names = $ColorRect/ColorRect2/AnimatedSprite2D

var frame = 0

func _ready():
	Move.play("RESET")
	Names.play("Prologue")
	$CanvasLayer/Prev.disabled = true
	
	
func _on_next_pressed():
	click.play()
	if frame <= 2:
		frame += 1
	match frame:
		1:
			Names.play("Chapter1")
			$CanvasLayer/Prev.disabled = false
			$CanvasLayer/Next.disabled = false
			Move.play("Chapter1")
		2:
			Names.play("Chapter2")
			$CanvasLayer/Next.disabled = true
			Move.play("Chapter2")

func _on_prev_pressed():
	click.play()
	if frame >= 0:
		frame -= 1
	match frame:
		0:
			Names.play("Prologue")
			$CanvasLayer/Prev.disabled = true
			Move.play("RESET")
		1:
			Names.play("Chapter1")
			$CanvasLayer/Prev.disabled = false
			$CanvasLayer/Next.disabled = false
			Move.play("Chapter1")
		2:
			$CanvasLayer/Next.disabled = true

func _on_back_pressed():
	click.play()
	ChangeScene.Next(ChangeScene.Menu)
	pass # Replace with function body.
