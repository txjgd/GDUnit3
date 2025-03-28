class_name StunFoeState
extends StateComponent

@export var animations :AnimationPlayer
@export var idle :IdleFoeState
@export var action :StateComponent
@export var stun_time :float = 5

var cooldown :float = 0

func enter( prev :StateComponent ) -> void:
	cooldown = stun_time
	#host.get_node("Angry").visible = false
	#host.get_node("Shock").visible = false
	animations.stop()
	animations.play( "shake" )


func running( delta :float ) -> StateComponent:
	cooldown -= delta
	if cooldown < 0:
		return action
	
	return null
