extends Node2D

@onready var player = $player
var test_scale: float = 1

func _ready():
	test_scale = 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	test_scale += 0.1
	player.scale = Vector2(test_scale,test_scale)
	pass
