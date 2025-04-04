class_name SpawnerComponent
extends Node

@export var spawn_count :int = 10
@export var object :PackedScene
@export var spawn_node :Node

var rng = RandomNumberGenerator.new()
var game_play
var time_since_spawn :float = 0.0

func _process( delta :float ) -> void:
	time_since_spawn += delta

func _ready():
	rng.randomize()
	
	if get_child_count() == 0:
		print( "ERROR! No Marker2Ds set" )

	print( "spawn count = ", spawn_count )
	game_play = get_tree().get_first_node_in_group( "game_play_group" )
	game_play.add_amount_to_gather( spawn_count )
	print( game_play )
	spawn()

func picked_up( who :Node ) -> void:
	game_play.note_item_picked_up( time_since_spawn )
	who.queue_free()
	
	var tree = get_tree()
	if tree:
		await tree.create_timer(0.5).timeout
		spawn()


func spawn() -> void:
	var places = get_child_count()
	var place = rng.randi_range( 0, places - 1 )
	var child = get_child( place )
	var obj = object.instantiate()

	spawn_node.add_child( obj )
	obj.global_position = child.global_position
	obj.spawner = self

	spawn_count -= 1
	time_since_spawn = 0.0
