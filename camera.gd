extends Camera2D

@export_category("Limits")
@export var camera_x_limit: Vector2 = Vector2(0.0, 1000.0)
@export var camera_y_limit: Vector2 = Vector2(0.0, 10000.0)

@export_category("Players")
@export var player1: Player
@export var player2: Player
@export var player_center_offset: Vector2 = Vector2(0, -250.0)

@export_category("Movement")
@export var camera_speed: float = 10.0

var shake_intensity: float = 0.0
var active_shake_time: float = 0.0

var shake_decay: float = 5.0

var shake_time: float = 0.0
var shake_time_speed: float = 20.0

var noise = FastNoiseLite.new()

func _ready():
	limit_left = camera_x_limit[0]
	limit_right = camera_x_limit[1]
	limit_top = camera_y_limit[0]
	limit_bottom = camera_y_limit[1]
	
	var meio_dos_players = (player1.global_position + player2.global_position)/2
	global_position = meio_dos_players + player_center_offset


func _process(delta: float) -> void:
	
	if not player1 and not player2:
		return
	
	if not player1:
		player1 = player2
	
	if not player2:
		player2 = player1
	
	var meio_dos_players = (player1.global_position + player2.global_position)/2
	
	global_position = global_position.move_toward(meio_dos_players + player_center_offset, camera_speed)


func _physics_process(delta: float) -> void:
	if active_shake_time > 0:
		shake_time += delta * shake_time_speed
		active_shake_time -= delta
		
		offset = Vector2(
			noise.get_noise_2d(shake_time, 0) * shake_intensity,
			noise.get_noise_2d(0, shake_time) * shake_intensity
		)
		
		shake_intensity = max(shake_intensity - shake_decay * delta, 0)
	else:
		offset = lerp(offset, Vector2.ZERO, 10.5 * delta)
		
func screen_shake(intensity: int, time: float):
	randomize()
	noise.seed = randi()
	noise.frequency = 2.0
	
	shake_intensity = intensity
	active_shake_time = time
	shake_time = 0.0

func super_shake():
	screen_shake(20, 1)
