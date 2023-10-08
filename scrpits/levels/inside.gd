extends level_parrent


func _on_exit_area_body_entered(_body):
	var tween: Tween = create_tween()
	tween.tween_property(player,'speed',0,0.1)
