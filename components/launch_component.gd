class_name LaunchComponent
extends Node

# A component for launching, throwing or other firing

@export var projectile :PackedScene
@export var aim :AimStateComponent
@export var container :Node
@export var rate :float = 1

var cooldown :float = 0

# launch will create the projectile as a child of the specified
# node. It will return it so other things can be set in the 
# client
func activate() -> Node2D:
	if cooldown > 0:
		return null
	
	var dir = aim.get_aim_direction()
	if dir.x == 0 and dir.y == 0: 
		return null
		
	var proj = projectile.instantiate()
	container.add_child( proj )
	proj.global_position = aim.get_aim_from_position()
	
	var move = proj.get_node("StraightMoverComponent")
	if move:
		move.Direction = dir
	cooldown = rate
	return proj
	
func _process( delta :float ) -> void:
		cooldown -= delta
