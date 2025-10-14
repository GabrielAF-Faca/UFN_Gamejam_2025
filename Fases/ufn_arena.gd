extends Node2D

const CUTSCENE_2 = preload("uid://cetrqt7hg0guj")

func _ready() -> void:
	SoundManager.start_soundtrack()

func _process(delta: float) -> void:
	if not get_tree().get_first_node_in_group("boss"):
		Transitioner.transition_to_scene(CUTSCENE_2)
