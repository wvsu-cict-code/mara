extends ParallaxBackground

@export var move = false
@export var move_spead = 40

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move:
		scroll_offset.x -= move_spead*delta
	pass
