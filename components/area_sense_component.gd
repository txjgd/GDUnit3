class_name AreaSenseComponent
extends Area2D

@export var host :CharacterBody2D
@export var target :CharacterBody2D
@export var range :float = 125

var direction :Vector2
var in_range :bool = false

func _ready() -> void:
	$CollisionShape2D.shape.radius = range
	connect( "body_entered", _on_body_entered )
	connect( "body_exited", _on_body_exited )
	pass
	
func _process( delta :float ) -> void:
	if in_range:
		direction = host.position.direction_to( target.position ).normalized()
		
func is_in_range() -> bool:
	return in_range

func distance() -> float:
	if in_range:
		return host.position.distance_to( target.position )
	else:
		return 0

func _on_body_entered(body):
	if body == target:
		in_range = true

func _on_body_exited(body):
	if body == target:
		in_range = false
