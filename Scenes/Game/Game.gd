extends Node2D


const PIPES = preload("res://Scenes/Pipes/Pipes.tscn")
const MARGIN: float = 100

func spawn_pipes() -> void:
	var new_pipes = PIPES.instantiate()
	var y_pos: float = randf_range(
		get_viewport_rect().position.y + MARGIN,
		get_viewport_rect().end.y - MARGIN)
		
	new_pipes.position = Vector2(get_viewport_rect().end.x + 50, y_pos)
	add_child(new_pipes)


func _on_timer_timeout() -> void:
	print("Times up")
	spawn_pipes()
