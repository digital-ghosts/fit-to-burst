extends CharacterBody2D


const SPEED = 500000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	self.global_position = get_global_mouse_position() + Vector2(-35, -45)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta: float) -> void:
	#var direction = get_viewport().get_mouse_position() - self.position
	#var velocity = direction * delta * SPEED
	#move_and_slide()
