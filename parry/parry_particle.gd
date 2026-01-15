extends Node2D

@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var unfreeze_timer: Timer = $UnfreezeTimer


func _ready() -> void:
	particles.one_shot = true
	particles.emitting = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("parry"):
			particles.restart()
			particles.speed_scale = 0
			unfreeze_timer.start()


func _unfreeze_particles():
	particles.speed_scale = 1
