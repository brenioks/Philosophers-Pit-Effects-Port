extends Node2D

@onready var particles: CPUParticles2D = $CPUParticles2D


func _ready() -> void:
	particles.one_shot = true
	particles.emitting = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("parry"):
			particles.emitting = true
			
