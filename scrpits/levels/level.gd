extends Node2D

class_name level_parrent

@onready var player: CharacterBody2D = $player
var bullet_scenes: PackedScene = preload("res://scenes/projectiles/bullet.tscn")
var grenade_scenes: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var camera_scenes: PackedScene = preload("res://scenes/players/camera.tscn")

var player_camera: Camera2D

func _ready():
	player_camera = camera_scenes.instantiate() as Camera2D
	player.add_child(player_camera)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_player_laser(marker_position: Vector2, direction: Vector2):
	var bullet = bullet_scenes.instantiate() as Area2D
	bullet.scale = Vector2(0.15,0.15)
	bullet.direction = direction
	bullet.position = marker_position
	$projectiles.add_child(bullet)
	$UI.update_bullet_counter()


func _on_player_grenade(marker_position: Vector2, direction: Vector2):
	var grenade = grenade_scenes.instantiate() as RigidBody2D
	grenade.position = marker_position
	grenade.rotation = direction.angle()
	grenade.linear_velocity = direction * 1000
	$projectiles.add_child(grenade)
	$UI.update_grenade_counter()
