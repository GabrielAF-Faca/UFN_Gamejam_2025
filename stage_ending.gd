extends Node2D

@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D

@export var next_stage: PackedScene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("enemies"):
		collision_shape_2d.disabled = false
	else:
		collision_shape_2d.disabled = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body in get_tree().get_nodes_in_group("player"):
		Transitioner.transition_to_scene(next_stage)
