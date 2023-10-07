extends Area2D

@onready var self_remove_timer: Timer = $self_remove_timer

var speed: int = 2000
var direction: Vector2 = Vector2.RIGHT

func _ready():
	self_remove_timer.start()

func _process(delta):
	self.position += direction * speed * delta


func _on_body_entered(body):
	self.queue_free()


func _on_self_remove_timer_timeout():
	self.queue_free()
