extends Node2D

@onready var scene = preload("res://Fases/ufn.tscn")

func _ready() -> void:
	SoundManager.end_soundtrack()

func end_cutscene():
	Transitioner.change_scene(scene)
