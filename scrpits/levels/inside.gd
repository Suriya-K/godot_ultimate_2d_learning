extends level_parrent

var outside_level_scenes: PackedScene = preload("res://scenes/levels/outside.tscn")

func _on_exit_area_body_entered(_body):
	var tween: Tween = create_tween()
	tween.tween_property(player,'speed',0,0.1)
	get_tree().change_scene_to_packed(outside_level_scenes)
