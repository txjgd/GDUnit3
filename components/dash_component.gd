class_name DashComponent
extends Node

# A component for launching, throwing or other firing

@export var body :Node2D
@export var dash_distance :float = 200
@export var dash_speed :float = 400
@export var rate :float = 1
@export var mover :BasicMoveInputComponent

var dash_loc :Vector2

var cooldown :float = 0
var mid_dash :bool = false

func _physics_process( delta :float ) -> void:
	if body.global_position.distance_to( dash_loc ) > 5:
		#print( host.global_position.distance_to( rush_loc ) )
		var direction = body.global_position.direction_to( dash_loc )
		body.velocity = direction * dash_speed
		body.move_and_slide()
	else:
		mid_dash = false
		
	pass
	

func activate() -> Node2D:
	if cooldown > 0:
		return null

	dash_loc = body.position + (mover.direction * dash_distance)
	mid_dash = true
	return body


func _process( delta :float ) -> void:
	if mid_dash:
		return

	cooldown -= delta
