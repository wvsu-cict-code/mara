extends CharacterBody2D

@export var speed : float = 200
@export var jump_velocity : float = 600
@export var can_pick = true
@onready var spriteplayer = $AnimatedSprite2D

var object_time: float = 3
var coyote_time: float = 1
var can_jump = false
var mid_air = false
var die = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add gravity every frame
	if die:
		dead()
	if not is_on_floor():
		velocity.y += gravity * delta
		mid_air = true
	else:
		$CoyoteTimer.stop()
		mid_air = false
		
	if is_on_floor() and can_jump == false:
		can_jump = true
	elif can_jump == true and $CoyoteTimer.is_stopped() and !mid_air:
		$CoyoteTimer.start(coyote_time) 
		
	if Input.is_action_pressed("ui_up") and can_jump:
		velocity.y = -jump_velocity
		spriteplayer.play("Jump")
		can_jump = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		spriteplayer.play("Run")
		spriteplayer.flip_h = false
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
		spriteplayer.flip_h = true
		spriteplayer.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if !spriteplayer.is_playing():
			spriteplayer.play("Idle")

	move_and_slide()
 
func _on_coyote_timer_timeout():
	can_jump = false

func on_air(air):
	mid_air = air

func dead():
	get_parent().get_child(1)
