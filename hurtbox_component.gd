extends Area2D
class_name Hurtbox


@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var hurt_timer: Timer = $Timer

@export var life:int = 3

signal hurt(amount, who)

func _ready():
	hurt_timer.timeout.connect(_on_hurt_timer_timeout)

func _on_area_entered(area: Area2D) -> void:
	if area.owner == owner:
		print("bati em eu")
		return
	
	if area.owner.is_in_group(owner.get_groups()[0]):
		print("bati no outro")
		return
	
	if not area is Hitbox:
		return
	
	life -= 1
	
	owner.flash()
	SoundManager.play_hit_sound()
	
	if owner.is_in_group("player"):
		get_tree().get_first_node_in_group("camera").screen_shake(5, 0.5)
	
	if life <= 0:
		die()
	
	call_deferred("disable_collision")
	hurt_timer.start()

func _on_hurt_timer_timeout():
	collision_shape.disabled = false

func disable_collision():
	collision_shape.disabled = true

func die():
	owner.queue_free()
