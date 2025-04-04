extends Node2D

var total_gathered :int = 0

var remaining :int = 0
var score :int = 0

@onready var hud_count = $CanvasLayer/HUD/Count
@onready var hud_score = $CanvasLayer/HUD/Score

func _ready():
	GameManager.next_map()
	pass # Replace with function body.


func add_amount_to_gather( amt :int ) -> void:
	remaining += amt
	hud_count.text = str( remaining )

func note_item_picked_up( time :float ):
	remaining -= 1
	total_gathered += 1
	score += clamp( 100 - (time * 10), 5, 100 )
	hud_count.text = str( remaining )
	hud_score.text = str( score )
	GameManager.final_score = score
	
	if remaining == 0:
		GameManager.next_map()
