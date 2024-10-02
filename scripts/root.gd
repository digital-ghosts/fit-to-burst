extends Control

@onready var guts: Control = Starburst.get_node("Guts")

var filled_guts: Array[Area2D] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	Dialogic.signal_event.connect(_on_dialogic_signal)
	$StoryTimer.start()
	Starburst.get_node("SpawnTimer").start()
	Starburst.is_dead = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for gut in guts.get_children():
		var gut_area := gut as Area2D

		if not gut_area:
			pass
			
		if gut_area.get_overlapping_areas().size() > 0:
			if gut_area not in filled_guts:
				filled_guts.append(gut_area)
		else:
			if gut_area in filled_guts:
				filled_guts.erase(gut_area)
				
	if filled_guts.size() >= guts.get_child_count():
		Starburst.is_dead = true
		get_tree().change_scene_to_file("res://loss.tscn")
	
func _on_dialogic_signal(argument:String) -> void:
	Starburst.color = argument
		

func _on_story_timer_timeout() -> void:
	Dialogic.start("res://dialog/story 1.dtl")
