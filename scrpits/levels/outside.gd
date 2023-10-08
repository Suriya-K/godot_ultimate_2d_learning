extends level_parrent

func _ready():
	super()
	player.global_position = Globals.current_position

func _on_house_orange_player_entered():
	var tween: Tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(player,'speed',0,0.1)
	tween.tween_property(player_camera, 'zoom', Vector2(1,1), 1)
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")


func _on_house_orange_player_exited():
	var tween: Tween = create_tween()
	tween.tween_property(player_camera, 'zoom', Vector2(0.8,0.8), 1)


func _on_house_orange_marker_pos(marker_position: Vector2):
	print('how do')
	Globals.current_position = marker_position
