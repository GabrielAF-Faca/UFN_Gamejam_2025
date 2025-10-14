extends Node2D


const CENAS = [
	preload("res://Cutscene1/parados.jpg"), # 0
	preload("res://Cutscene1/gustavo_aberto.jpg"), #1
	preload("res://Cutscene1/parados.jpg"), #2
	preload("res://Cutscene1/gustavo_bebe.jpg"), #3
	preload("res://Cutscene1/parados.jpg"), # 4
	preload("res://Cutscene1/faca_aberto.jpg"), # 5
	preload("res://Cutscene1/parados.jpg"), # 6
	preload("res://Cutscene1/faca_bebe.jpg"), # 7
	preload("res://Cutscene1/parados.jpg"), #8
	preload("res://Cutscene1/faca_aberto.jpg"), #9
	preload("res://Cutscene1/parados.jpg"), #10
	preload("res://Cutscene1/faca_bebe.jpg"), # 11
	preload("res://Cutscene1/parados.jpg"), #12
	preload("res://Cutscene1/bebem.jpg"), #13
	preload("res://Cutscene1/parados.jpg"), #14
	preload("res://Cutscene1/bebem.jpg"), #15
	preload("res://Cutscene1/parados.jpg"), #16
	preload("res://Cutscene1/gustavo_dorme.jpg"), #17
	preload("res://Cutscene1/gustavo_nao_dorme.jpg"), #18
	preload("res://Cutscene1/gustavo_fala.jpg"), #19
	preload("res://Cutscene1/gustavo_nao_dorme.jpg"), #20
	preload("res://Cutscene1/faca_parado.jpg"), #21
	preload("res://Cutscene1/faca_fala.jpg"), #22
	preload("res://Cutscene1/faca_parado.jpg"), #23
	preload("res://Cutscene1/righi_parado.jpg"), #24
	preload("res://Cutscene1/righi_aberto.jpg"), #25
	preload("res://Cutscene1/righi_parado.jpg"), #26
	preload("res://Cutscene1/gustavo_levanta.jpg"), #27
	preload("res://Cutscene1/gustavo_levanta_fala.jpg"), #28
	preload("res://Cutscene1/gustavo_levanta.jpg"), #29
	preload("res://Cutscene1/righi_aberto.jpg"), #30
	preload("res://Cutscene1/absolute_cinema.jpg"), #31
	preload("res://Cutscene1/righi_aponta.jpg"), #32
	preload("res://Cutscene1/brinde.jpg"), #brinde
]

const MAIN = preload("uid://bdv7fsllbdoyn")

@export var cena_atual: int = 0:
	set(new_cena):
		cena_atual = new_cena
		$Sprite2D.texture = CENAS[cena_atual]

func change_scene():

	Transitioner.transition_to_scene(MAIN)
