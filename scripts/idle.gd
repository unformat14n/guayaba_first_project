extends State

@onready var detection = $"../../PlayerDetection/CollisionShape2D"

var player_entered: bool = false:
	set(value):
		player_entered = value
		detection.set_deferred("disabled", value)


func transition():
	if player_entered:
		get_parent().change_state("Follow")

func _on_player_detection_body_entered(body):
	player_entered = true
