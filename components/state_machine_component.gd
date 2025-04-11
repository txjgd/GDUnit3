class_name StateMachineComponent
extends Node

@export var host :CharacterBody2D
@export var initial_state :StateComponent

var state :StateComponent
var prev_state :StateComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	var children = get_children()
	for child in children:
		child.init( host )
		
	transition_to( initial_state )

func transition_to( s :StateComponent ):
	if state:
		state.leave()
		prev_state = state
		
	state = s
	state.enter( prev_state )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var new_state = state.running( delta )
	if new_state:
		transition_to( new_state )
