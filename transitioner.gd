extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func transition_to_scene(scene: PackedScene):
	animation_player.play("fade_out")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(scene)
	animation_player.play("fade_in")


func change_scene(scene: PackedScene):
	get_tree().change_scene_to_packed(scene)
