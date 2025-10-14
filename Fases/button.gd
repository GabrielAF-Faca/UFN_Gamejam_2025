extends Button

const CUSCENE = preload("uid://b7ygjclj0nua")


func _on_button_down() -> void:
	Transitioner.transition_to_scene(CUSCENE)
