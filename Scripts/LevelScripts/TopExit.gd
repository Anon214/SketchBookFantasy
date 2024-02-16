extends Area2D

func _on_body_entered(body: Player):
	get_tree().change_scene_to_file("res://Levels/SecondLevel.tscn")
