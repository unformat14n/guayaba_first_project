extends Area2D

# at the start, get the animation player
@onready var animator = $AnimationPlayer

var dist = 0
var form = "base"
var direction : Vector2

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const MAX_DIST = 1200
	
	animator.play(form)
	
	position += direction * SPEED * delta
	
	dist = dist + SPEED * delta
	if dist > MAX_DIST:
		queue_free()


func set_form(new_form):
	# change the form, just that :)
	form = new_form

func set_bullet(pos, target_pos):
	global_position = pos
	direction = (target_pos - pos).normalized()
	rotation_degrees = rad_to_deg(pos.angle_to_point(target_pos))
