extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(_on_dialogic_timeline_ended)
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("res://dialog/intro.dtl")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_dialogic_timeline_ended() -> void:
	get_tree().change_scene_to_file("res://root.tscn")


func _on_dialogic_signal(argument:String) -> void:
	var head = Starburst.get_node("head")
	var body = Starburst.get_node("body")
	head.texture = load("res://img/starburst head gray.png")
	head.visible = false
		
	if argument == "skin":
		Starburst.position = Vector2(451, 170)
		Starburst.visible = true
		Starburst.z_index = $BG.z_index + 1
		
	if argument == "burst":
		Starburst.move_child(head, Starburst.get_node("Bursts").get_index() + -1)
		head.visible = true
