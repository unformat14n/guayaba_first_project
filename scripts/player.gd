extends CharacterBody2D

@onready var anim_handler = $AnimationPlayer
@onready var sprite = $Sprite2D

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 100
	
	var x_dir = Input.get_axis("left","right")
	
	if x_dir != 0:
		sprite.flip_h = (x_dir == -1)
	
	move_and_slide()
	update_anims(velocity.length())
	

func update_anims(vel):
	if vel == 0.0:
		anim_handler.play("base_idle")
	else: 
		anim_handler.play("base_run")
