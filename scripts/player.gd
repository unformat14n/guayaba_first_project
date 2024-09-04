extends CharacterBody2D

@onready var anim_handler = $AnimationPlayer
@onready var sprite = $Sprite2D

var form = "base"

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 300
	
	var x_dir = Input.get_axis("left","right")
	
	if x_dir != 0:
		sprite.flip_h = (x_dir == -1)
		
	if Input.is_key_pressed(KEY_1):
		form = "base"
	if Input.is_key_pressed(KEY_2):
		form = "fire"
	if Input.is_key_pressed(KEY_3):
		form = "ice"
	
	
	move_and_slide()
	update_anims(velocity.length())
	

func update_anims(vel):
	if vel == 0.0:
		anim_handler.play(form + "_idle")
	else: 
		anim_handler.play(form + "_run")
		

func shoot():
	const BULLET_BLUEPRINT = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET_BLUEPRINT.instantiate()
	# In this case, this line was not needed: Maybe sprite?
	#new_bullet.global_position = sprite.global_position
	sprite.add_child(new_bullet)

func _on_timer_timeout() -> void:
	shoot()
