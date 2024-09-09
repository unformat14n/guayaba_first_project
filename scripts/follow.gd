extends State


# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("idle")
	
func  exit():
	super.exit()
	owner.set_physics_process(false)
	
func transition():
	var distance = owner.direction.length()
	
	if distance < 200:
		get_parent().change_state("Attack")
	
	elif distance > 300:
		get_parent().change_state("Bullet")
	
	
