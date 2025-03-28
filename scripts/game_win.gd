extends Control

@onready var final = $CenterContainer/VBoxContainer/Final

func _ready():
	final.text = "Final Score: " + str(GameManager.final_score)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed( "ui_accept" ):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/menu.tscn")
		#get_tree().change_scene_to_file( "res://scenes/menu.tscn" )
