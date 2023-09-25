extends Node2D

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	self.position += direction * 500 * delta
	
	if Input.is_action_pressed("primary_action"):
		print("Shoot")
	
	if Input.is_action_just_pressed("secondary_action"):
		print("Shoot Grenade")
		
