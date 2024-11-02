extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_finish_body_entered(body):
	if body.name == 'frog':
		get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")
	pass # Replace with function body.
