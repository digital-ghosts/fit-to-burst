extends Node2D

@onready var guts: Control = $Guts

var is_dead: bool = true
var color = "none"

func _ready() -> void:
	pass

func spawn_burst() -> void:
	var new_burst = preload("res://burst.tscn").instantiate()
	
	var rand_scale = randf_range(.3, 1)
	new_burst.set_scale(Vector2(rand_scale, rand_scale))
	
	$SpawnPoints/SpawnFollow.progress_ratio = randf()
	new_burst.position = $SpawnPoints/SpawnFollow.position
	
	var r : float
	var g : float
	var b : float
	
	match color:
		"red":
			r = randf_range(.7, 1)
			g = randf_range(0, .6)
			b = randf_range(0, .4)
		"green":
			r = randf_range(0, .6)
			g = randf_range(.7, 1)
			b = randf_range(0, .6)
		"blue":
			r = randf_range(0, .6)
			g = randf_range(0, .7)
			b = randf_range(.7, 1)
		_:
			r = randf()
			g = randf()
			b = randf()
			
	new_burst.modulate = Color(r, g, b)
	
	Starburst.get_node("Bursts").add_child(new_burst)

func _on_spawn_timer_timeout() -> void:
	if !Starburst.is_dead:
		spawn_burst()
