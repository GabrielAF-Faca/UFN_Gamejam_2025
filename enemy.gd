extends CharacterBody2D

@export var SPEED = 150.0
const JUMP_VELOCITY = -400.0

var target = null

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var attack_timer: Timer = $AttackTimer

@export var in_cutscene: bool = false

var attacking = false
var can_attack = true
var can_move = true
var last_dir = 1

func _ready():
	name = "Ricardo"
	animation_player.play("RESET")

func _physics_process(delta: float) -> void:
	
	if in_cutscene:
		animation_player.play("landing")
		$Sprite2D.visible = false
		return
	
	if not get_tree().get_nodes_in_group("player"):
		return
	
	if not target:
		var points = get_tree().get_nodes_in_group("player").pick_random().target_points
		var distance1 = global_position.distance_to(points[0].global_position)
		var distance2 = global_position.distance_to(points[1].global_position)
		
		if distance1 > distance2:
			target = points[1]
		else:
			target = points[0]
		
		return
	
	if attacking and can_attack:
		can_attack = false
		animation_player.play(["punch1"+str(-int(last_dir)), "punch2"+str(-int(last_dir))].pick_random())
		return
	
	var look_direction = global_position.direction_to(target.owner.global_position).x
	
	if look_direction > 0:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false
	
	if look_direction != 0:
		last_dir = sign(look_direction)
	
	
	if not can_move:
		return
	
	var direction = (target.global_position - global_position).normalized()

	if global_position.distance_to(target.owner.global_position) > 190:
		velocity = velocity.move_toward(direction*SPEED, 10)
		animation_player.play("walk")
		can_move = true
	else:
		velocity = Vector2.ZERO
		animation_player.play("idle")
		can_move = false
		attack_timer.start(Global.rng.randf_range(0.4, 0.7))
		
	
	move_and_slide()

func flash():
	animation_player.play("hit")
	await animation_player.animation_finished
	return

func _on_attack_timer_timeout() -> void:
	attacking = true

func end_attack():
	attacking = false
	can_attack = true
	can_move = true
