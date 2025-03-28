class_name StraightMoverComponent
extends Node

@export var host :Area2D  # must have a power variable defined
@export var Speed :float = 200
@export var Direction :Vector2 = Vector2.UP

func _ready() -> void:
	host.connect( "body_entered", _on_body_entered )
	
func _physics_process(delta):
	host.position += Direction * Speed * delta
	pass

func _on_body_entered(body):
	if body.has_method( "take_damage" ):
		body.take_damage( host.power )
	host.queue_free()
