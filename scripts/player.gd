extends CharacterBody2D

@onready var anim_handler = $AnimationPlayer
@onready var sprite = $Sprite2D

var form = "base"
# declare variable for the mouse pos
var target_pos : Vector2
var flipped: bool
# get the bullet preloaded scene
const BULLET_BLUEPRINT = preload("res://scenes/bullet.tscn")

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 300
	
	var x_dir = Input.get_axis("left","right")
	
	if x_dir != 0:
		if x_dir > 0 and flipped:
			scale.x *= -1
			flipped = false
		elif x_dir < 0 and !flipped:
			scale.x *= -1
			flipped = true
		
		
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
	# set target_pos to the mouse position
	target_pos = get_global_mouse_position()
	# instance of the bullet scene
	var new_bullet = BULLET_BLUEPRINT.instantiate()
	# set the  form of the bullet according to the player form
	new_bullet.set_form(form)
	# set the direction, rotation of the instantiated bullet
	new_bullet.set_bullet(global_position, target_pos)
	# the parent of the player will contain the instantiated bullet
	get_parent().add_child(new_bullet)

func _on_timer_timeout() -> void:
	#shoot()
	pass
