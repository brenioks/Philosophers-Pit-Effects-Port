extends Node2D

@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var unfreeze_timer: Timer = $UnfreezeTimer
@onready var flashbang: CanvasLayer = $Flashbang


func _ready() -> void:
	particles.one_shot = true
	particles.emitting = false
	flashbang.visible = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("parry"):
			particles.restart()
			particles.speed_scale = 0
			flashbang.visible = true
			unfreeze_timer.start()

func unfreeze():
	particles.speed_scale = 1
	flashbang.visible = false
