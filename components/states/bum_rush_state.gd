class_name BumRushState
extends StateComponent

@export var animations :AnimationPlayer
@export var sensor  :AreaSenseComponent
@export var chasing :ChasingFoeState
@export var goback  :GotoPostState
@export var speed   :float = 200
@export var rush_distance :float = 200
var rush_loc :Vector2

func enter( prev :StateComponent ) -> void:
	animations.play( "rage" )
	rush_loc = host.position + (sensor.direction * rush_distance)

func running( delta :float ) -> StateComponent:
	if host.global_position.distance_to( rush_loc ) > 5:
		#print( host.global_position.distance_to( rush_loc ) )
		var direction = host.global_position.direction_to( rush_loc )
		host.velocity = direction * speed
		host.move_and_slide()
		return null
	
	if sensor.is_in_range():
		return chasing
	else:
		return goback
