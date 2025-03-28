class_name GotoPostState
extends StateComponent


@export var sensor :AreaSenseComponent
@export var chasing :ChasingFoeState
@export var idle   :IdleFoeState
@export var speed  :float = 75
@export var marker :Marker2D

# Called when the node enters the scene tree for the first time.
func running( delta :float ) -> StateComponent:
	if sensor.is_in_range():
		return chasing

	if host.global_position.distance_to( marker.global_position ) < 0.1:
		return idle
		
	var direction = host.global_position.direction_to( marker.global_position )

	host.velocity = direction * speed
	host.move_and_slide()

	return null
