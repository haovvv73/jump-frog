extends Area2D

const MAIN = "CharacterBody2D"
#@onready var game_manager: Node = $"../GameManager"
@onready var game_manager: Node = %GameManager # access on unique name

func _on_body_entered(body: Node2D):
	#print(body.name)
	if body.name == MAIN:
		queue_free()
		game_manager.add_point()
