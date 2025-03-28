class_name IdleFoeState
extends StateComponent


@export var sensor :AreaSenseComponent
@export var action :StateComponent

func running( delta :float ) -> StateComponent:
	if sensor.is_in_range():
		return action
	return null
