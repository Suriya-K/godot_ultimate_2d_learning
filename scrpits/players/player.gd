extends CharacterBody2D

signal laser(maker_position: Vector2, direction: Vector2)
signal grenade(maker_position: Vector2, direction: Vector2)

@onready var gun_timer: Timer = $gun_timer
@onready var grenade_timer: Timer = $grenade_timer
@onready var bullet_markers: Array[Node] = $bullet_start_position.get_children()
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

@export var max_speed: int = 500

var speed: int = max_speed
var gun_reload_timer: float = 0.75
var grenade_reload_timer: float = 2.5
var gun_can_shoot: bool = true
var grenade_can_shoot: bool = true

func _ready():
	gpu_particles_2d.one_shot = true
	gun_timer.wait_time = gun_reload_timer
	grenade_timer.wait_time = gun_reload_timer
	

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	self.velocity = direction * speed
	move_and_slide()
	
	self.look_at(self.get_global_mouse_position())
	
	var player_direction: Vector2 = (self.get_global_mouse_position() - self.position).normalized()
	if Input.is_action_pressed("primary_action") and gun_can_shoot and Globals.bullets > 0:
		Globals.bullets -= 1
		var seleted_bullet: Node = bullet_markers[randi() % bullet_markers.size()]
		laser.emit(seleted_bullet.global_position, player_direction)
		gun_can_shoot = false
		gpu_particles_2d.emitting = true
		gun_timer.start()
	
	if Input.is_action_pressed("secondary_action") and grenade_can_shoot and Globals.grenade > 0:
		Globals.grenade -= 1
		var seleted_bullet: Node = bullet_markers[randi() % bullet_markers.size()]
		grenade.emit(seleted_bullet.global_position, player_direction)
		grenade_can_shoot = false
		grenade_timer.start()
	


func _on_gun_timer_timeout():
	gun_can_shoot = true


func _on_grenade_timer_timeout():
	grenade_can_shoot = true
