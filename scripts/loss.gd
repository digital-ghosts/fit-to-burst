extends Control

var true_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Starburst.visible = true
	
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.timeline_ended.connect(_on_dialogic_timeline_ended)
	Dialogic.start("res://dialog/outro.dtl")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../begin again?".is_hovered():
		$"../begin again?".modulate = Color(0.969, 0.435, 0.039)
	else:
		$"../begin again?".modulate = Color(1, 1, 1)
	pass

func _on_dialogic_timeline_ended() -> void:
	$"../begin again?".visible = true
	$"../begin again?".disabled = false
	Starburst.z_index -= 1
	pass

func _on_dialogic_signal(argument:String) -> void:
	if argument == "true_end":
		true_end = true
		var head = Starburst.get_node("head")
		var body = Starburst.get_node("body")
		Starburst.move_child(head, body.get_index() + 1)
		head.texture = load("res://img/starburst head color.png")
		head.animated = true
		

func _on_begin_again_pressed() -> void:
	for node in Starburst.get_node("Bursts").get_children():
		node.queue_free()
	Starburst.get_node("head").visible = false
		
	if !true_end:
		Starburst.visible = false
	
	get_tree().change_scene_to_file("res://menu.tscn")
	pass # Replace with function body.
