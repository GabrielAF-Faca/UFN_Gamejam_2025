extends Node2D


const CENAS = [
	preload("res://CutsceneFinal/parados.jpg"), # 0
	preload("res://CutsceneFinal/faca_aberto.jpg"), #1
	preload("res://CutsceneFinal/parados.jpg"), #2
	preload("res://CutsceneFinal/gustavo_aberto.jpg"), #3
	preload("res://CutsceneFinal/parados.jpg"), # 4
	preload("res://CutsceneFinal/bira_fechados.jpg"), # 5
	preload("res://CutsceneFinal/bebendos.jpg"), # 6
	preload("res://CutsceneFinal/bira_fechados.jpg"), # 7
	preload("res://CutsceneFinal/bebendos.jpg"), # 8
	preload("res://CutsceneFinal/bira_fechados.jpg"), #9 
	preload("res://CutsceneFinal/bira_faca_aberto.jpg"), #10
	preload("res://CutsceneFinal/bira_fechados.jpg"), # 11
	preload("res://CutsceneFinal/bebendos.jpg"), #12
	preload("res://CutsceneFinal/bira_fechados.jpg"), # 13
	preload("res://CutsceneFinal/brinde_final.jpg"), #14
]

const MAIN = preload("uid://bdv7fsllbdoyn")

@export var cena_atual: int = 0:
	set(new_cena):
		cena_atual = new_cena
		$Sprite2D.texture = CENAS[cena_atual]

func _ready():
	SoundManager.end_soundtrack()

func change_scene():

	Transitioner.transition_to_scene(MAIN)
