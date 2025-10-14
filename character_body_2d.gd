extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var esquerda: Marker2D = $Esquerda
@onready var direita: Marker2D = $Direita

@onready var target_points = [esquerda, direita]

@export var hurtbox_component: Hurtbox
@export var in_cutscene:bool = false

var attacking: bool = false
var last_dir = 1

@export var character: int = 0

const CONTROLS_GUSTAVO = ["left", "right", "up", "down", "bater"]
const CONTROLS_FACA = ["left2", "right2", "up2", "down2", "bater2"]

var controls = CONTROLS_GUSTAVO

func _ready():
	name = "Gustavo"
	if character == 1:
		animated_sprite_2d.sprite_frames = preload("uid://c244yeesskkjb")
		controls = CONTROLS_FACA
		name = "Faca"
		
		

func _physics_process(delta: float) -> void:
	
	if in_cutscene:
		animation_player.play("idle")
		animated_sprite_2d.flip_h = true
		return
		
	
	if animation_player.current_animation == "hit":
		return
	
	var direction := Vector2(
			Input.get_axis(controls[0], controls[1]), 
			Input.get_axis(controls[2], controls[3])
		)
	
	if direction.x != 0:
		last_dir = direction.x 
	
	if direction and not attacking:
		animation_player.play("walk")
		velocity = direction.normalized() * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		if not attacking:
			animation_player.play("idle")
	
	if not attacking:
		if last_dir < 0:
			animated_sprite_2d.flip_h = false
		elif last_dir > 0:
			animated_sprite_2d.flip_h = true
	
	
	if Input.is_action_just_released(controls[4]) and not attacking:
		animation_player.play(["kick"+str(-int(last_dir)), "punch1"+str(-int(last_dir)), "punch2"+str(-int(last_dir))].pick_random())
		attacking = true
	

	move_and_slide()

func flash():
	animation_player.play("hit")
	
func end_attack():
	attacking = false
