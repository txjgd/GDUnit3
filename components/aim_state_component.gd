class_name AimStateComponent
extends Node

@export var origin :Node2D

# Samples mouse to see in which direction to aim
# Can be extended to handle right analog stick
func get_aim_direction() -> Vector2 :
	var direction = Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down").normalized()
	return direction	
	#var mouse = origin.get_global_mouse_position()
	#return origin.global_position.direction_to( mouse ).normalized()

func get_aim_from_position() -> Vector2 :
	return origin.global_position
