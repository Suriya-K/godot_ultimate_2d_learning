extends Node2D

@onready var player: CharacterBody2D = $player
var bullet_scenes: PackedScene = preload("res://scenes/projectiles/bullet.tscn")
var grenade_scenes: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_player_laser(marker_position: Vector2, direction: Vector2):
	var bullet = bullet_scenes.instantiate() as Area2D
	bullet.scale = Vector2(0.15,0.15)
	bullet.direction = direction
	bullet.position = marker_position
	$projectiles.add_child(bullet)


func _on_player_grenade(marker_position: Vector2, direction: Vector2):
	var grenade = grenade_scenes.instantiate() as RigidBody2D
	grenade.position = marker_position
	grenade.rotation = direction.angle()
	grenade.linear_velocity = direction * 100
	grenade.scale = Vector2(2.25,2.25)
	$projectiles.add_child(grenade)
	pass
