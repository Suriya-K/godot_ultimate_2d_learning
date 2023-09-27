extends Area2D

var speed: int = 2000
var direction: Vector2 = Vector2.RIGHT

func _process(delta):
	self.position += direction * speed * delta
