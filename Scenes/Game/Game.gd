extends Node2D


const PIPES = preload("res://Scenes/Pipes/Pipes.tscn")

@onready var pipe_holder: Node = $PipeHolder
@onready var upper_point: Marker2D = $UpperPoint
@onready var lower_point: Marker2D = $LowerPoint

func _ready() -> void:
	spawn_pipes() 

func spawn_pipes() -> void:
	var new_pipes = PIPES.instantiate()
	var y_pos: float = randf_range(
		upper_point.position.y,
		lower_point.position.y)
		
	new_pipes.position = Vector2(upper_point.position.x, y_pos)
	add_child(new_pipes)


func _on_timer_timeout() -> void:
	print("Times up")
	spawn_pipes()


func _on_plane_die() -> void:
	get_tree().paused = true
