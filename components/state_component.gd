class_name StateComponent
extends Node

var host :CharacterBody2D

func init( ahost :CharacterBody2D ):
	host = ahost

func running( delta ) -> StateComponent:
	return null
	
func enter( prev :StateComponent ) -> void:
	pass
	
func leave() -> void:
	pass
