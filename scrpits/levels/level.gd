extends Node2D

@onready var player: CharacterBody2D = $player
var bullet_scenes: PackedScene = preload("res://scenes/projectiles/bullet.tscn")
var grenade_scenes: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_player_laser(marker_position: Vector2):
	var bullet: Area2D = bullet_scenes.instantiate()
	bullet.scale = Vector2(0.15,0.15)
	bullet.position = marker_position
	$projectiles.add_child(bullet)


func _on_player_grenade(marker_position: Vector2):
	var grenade: RigidBody2D = grenade_scenes.instantiate()
	grenade.position = marker_position
	$projectiles.add_child(grenade)
	pass
