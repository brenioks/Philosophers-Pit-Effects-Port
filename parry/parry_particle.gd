@tool
extends Node2D

@export var spacebar_to_test: bool = false
@export_tool_button("Do the parry") var start_parry_action = start_parry

@onready var parried_sprite: AnimatedSprite2D = $ParriedSprite
@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var unfreeze_timer: Timer = $UnfreezeTimer
@onready var flashbang: CanvasLayer = $Flashbang


func _ready() -> void:
	particles.one_shot = true
	particles.emitting = false
	flashbang.visible = false

func _input(event: InputEvent) -> void:
	if Engine.is_editor_hint() or not OS.is_debug_build() or not spacebar_to_test:
		return
	
	if event is InputEventKey:
		if event.is_action_pressed("parry"):
			start_parry()

func start_parry():
	particles.restart()
	parried_sprite.play("parried")
	get_tree().paused = true
	flashbang.visible = true
	if Engine.is_editor_hint():
		var rect: ColorRect = flashbang.get_node("ColorRect")
		rect.global_position = global_position - rect.size * .5
	
	unfreeze_timer.start()

func unfreeze():
	get_tree().paused = false
	flashbang.visible = false
