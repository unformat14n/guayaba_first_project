extends Area2D

var dist = 0
var form = "base"

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const MAX_DIST = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	dist = dist + SPEED * delta
	if dist > MAX_DIST:
		queue_free()
		
