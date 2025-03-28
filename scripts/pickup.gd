extends Area2D

@export var spawner :SpawnerComponent


func _on_body_entered(body):
	spawner.picked_up( self )
