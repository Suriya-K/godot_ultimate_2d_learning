extends Area2D

var speed: int = 1000
var direction: Vector2 = Vector2.RIGHT

func _process(delta):
	self.position += direction * speed * delta