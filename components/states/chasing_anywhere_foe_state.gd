class_name ChasingAnywhereFoeState
extends StateComponent

@export var animations :AnimationPlayer
@export var sensor :AreaSenseComponent
@export var target :CharacterBody2D
@export var rush   :BumRushState
@export var speed  :float = 100
@export var nav    :NavigationAgent2D


var can_rush :float = 0.0

func enter( prev :StateComponent ) -> void:
	can_rush = 0.0
	animations.play( "alert" )


func running( delta :float ) -> StateComponent:
	can_rush += delta
	
	if can_rush > 1.0 and sensor.distance() >= rush.rush_trigger_distance:
		return rush
	
	nav.target_position = target.global_position
	var next_position = nav.get_next_path_position()
	
	host.velocity = host.position.direction_to( next_position ) * speed
	host.move_and_slide()

	return null
