class_name ThrowingState
extends StateComponent

@export var animations :AnimationPlayer
@export var projectile :PackedScene
@export var sensor :AreaSenseComponent
@export var goback :StateComponent
@export var speed  :float = 100
@export var rate :float = 1.0

@export var container :Node

var cooldown :float = 0

func enter( prev :StateComponent ) -> void:
	cooldown = 0.0
	animations.play( "alert" )


func running( delta :float ) -> StateComponent:
	if sensor.is_in_range() == false:
		return goback

	cooldown += delta
	
	if cooldown > rate:
		cooldown = 0.0
		throw()
	
	return null

func throw() -> void:
	var proj = projectile.instantiate()
	container.add_child( proj )
	proj.global_position = host.global_position
	
	var move = proj.get_node("StraightMoverComponent")
	if move:
		move.Direction = sensor.direction
