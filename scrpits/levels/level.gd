extends Node2D

@onready var player = $player
var test_scale: float = 1

func _ready():
	test_scale = 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_player_laser():
	print('laser from level')


func _on_player_grenade():
	print('greade from level')
