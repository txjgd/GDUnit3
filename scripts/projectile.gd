extends Area2D

@export var power :float = 10

func _ready() -> void:
	$AnimationPlayer.play( "spin" )
	
