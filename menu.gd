extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Starburst.get_node("head").animated = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../return".is_hovered():
		$"../return".modulate = Color(0.969, 0.435, 0.039)
	else:
		$"../return".modulate = Color(1, 1, 1)
		
	for child in self.get_children():
		var button := child as Button
	
		if button.is_hovered():
			button.modulate = Color(0.969, 0.435, 0.039)
		else:
			button.modulate = Color(1, 1, 1)
			

func _prep_submenu() -> void:
	Starburst.visible = false
	
	$"how to play".disabled = true
	$start.disabled = true
	$credits.disabled = true
	$btw.disabled = true
	
	$"how to play".visible = false
	$start.visible = false
	$credits.visible = false
	$btw.visible = false

	$"../return".visible = true
	$"../return".disabled = false
	
	$"../HideButtons".visible = true

func _on_how_to_play_pressed() -> void:
	_prep_submenu()
	$"../HideButtons/instructions".visible = true
	
func _on_btw_pressed() -> void:
	_prep_submenu()
	$"../HideButtons/true ending".visible = true

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://intro.tscn")

func _on_credits_pressed() -> void:
	_prep_submenu()
	$"../HideButtons/credits".visible = true

func _on_return_pressed() -> void:
	$"../return".visible = false
	$"../return".disabled = true
	
	$"../HideButtons".visible = false
	for child in $"../HideButtons".get_children():
		child.visible = false
		
	$"how to play".disabled = false
	$start.disabled = false
	$credits.disabled = false
	$btw.disabled = false
	
	$"how to play".visible = true
	$start.visible = true
	$credits.visible = true
	$btw.visible = true
