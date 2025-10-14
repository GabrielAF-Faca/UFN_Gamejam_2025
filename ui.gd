extends CanvasLayer

@export var player1: Player
@export var player2: Player

@onready var timer: Timer = $Timer
@onready var seta_gamer: Sprite2D = $SetaGamer

var pode_seta = false

func _process(delta: float) -> void:
	
	var player1_health
	var player2_health
	
	if not player1:
		player1_health = 0
	else:
		player1_health = player1.hurtbox_component.life
	
	if not player2:
		player2_health = 0
	else:
		player2_health = player2.hurtbox_component.life
	
	if player1_health != $Gustavo.get_child_count():
		$Gustavo.get_children()[0].queue_free()
		
	if player2_health != $Faca.get_child_count():
		$Faca.get_children()[0].queue_free()
	
	if not get_tree().get_nodes_in_group("enemies"):
		if not pode_seta:
			pode_seta = true
			timer.start()
	else:
		pode_seta = false

func _on_timer_timeout() -> void:
	seta_gamer.visible = !seta_gamer.visible
