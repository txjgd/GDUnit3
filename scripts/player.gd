class_name PlayerClass
extends CharacterBody2D

@export var action :Node

func is_player(): return true

func _process( delta :float ) -> void:
	if Input.is_action_just_pressed( "throw" ) or Input.is_action_just_pressed( "ui_select" ) or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		action.activate()
	pass

func _physics_process( delta :float ) -> void:
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().has_method( "is_enemy" ):
			take_damage( 1 )

func take_damage( amt: float ) -> void:
	GameManager.game_over()
	#var tree = get_tree()
	#if tree:
		#tree.change_scene_to_file("res://scenes/game_over.tscn")
