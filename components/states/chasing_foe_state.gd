class_name ChasingFoeState
extends StateComponent

@export var animations :AnimationPlayer
@export var sensor :AreaSenseComponent
@export var goback :GotoPostState
@export var rush   :BumRushState
@export var speed  :float = 100


var can_rush :float = 0.0

func enter( prev :StateComponent ) -> void:
	can_rush = 0.0
	animations.play( "alert" )


func running( delta :float ) -> StateComponent:
	can_rush += delta
	
	if can_rush > 1.0 and sensor.distance() > 60:
		return rush
	
	if not sensor.is_in_range():
		return goback
	
	host.velocity = sensor.direction * speed
	host.move_and_slide()

	return null
