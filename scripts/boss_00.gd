extends CharacterBody2D

@onready var player = get_parent().find_child("player")
@onready var sprite = $Sprite2D

var direction : Vector2
var flipped: bool

func _ready():
	set_physics_process(false)
	
func _process(_delta):
	direction = player.position - position
	
	if direction.x > 0 and !flipped:
		scale.x *= -1
		flipped = true
	elif direction.x < 0 and flipped:
		scale.x *= -1
		flipped = false
		

func _physics_process(delta):
	velocity = direction.normalized() * 150
	move_and_collide(velocity * delta)
