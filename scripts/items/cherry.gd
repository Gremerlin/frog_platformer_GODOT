extends Area2D

@onready var game_manadger = %game_manadger



func _on_body_entered(body):
	if (body.name == 'frog'):
		queue_free()
		game_manadger.add_point()
