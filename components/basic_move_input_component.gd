class_name BasicMoveInputComponent
extends Node

@export var body :CharacterBody2D
@export var config :MoveConfigComponent

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	body.velocity = direction * config.speed
	body.move_and_slide()
	pass
