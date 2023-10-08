extends StaticBody2D

signal marker_pos(marker_position: Vector2)
signal player_entered
signal player_exited

func _on_area_2d_body_entered(_body):
	marker_pos.emit($marker.global_position)
	player_entered.emit()
	
func _on_area_2d_body_exited(_body):
	player_exited.emit()
