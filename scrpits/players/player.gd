extends CharacterBody2D

@onready var gun_timer: Timer = $gun_timer
@onready var grenade_timer: Timer = $grenade_timer

var gun_reload_timer: float = 0.75
var grenade_reload_timer: float = 2.5
var gun_can_shoot: bool = true
var grenade_can_shoot: bool = true

func _ready():
	gun_timer.wait_time = gun_reload_timer
	grenade_timer.wait_time = gun_reload_timer
	

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	self.velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_pressed("primary_action") and gun_can_shoot:
		print("Shoot")
		gun_can_shoot = false
		gun_timer.start()
	
	if Input.is_action_just_pressed("secondary_action") and grenade_can_shoot:
		print("Shoot Grenade")
		grenade_can_shoot = false
		grenade_timer.start()
		


func _on_gun_timer_timeout():
	gun_can_shoot = true


func _on_grenade_timer_timeout():
	grenade_can_shoot = true
