extends Node


@export var game_ui: CanvasLayer
@export var game_over_ui_template: PackedScene

func _ready():
	GameManager.game_over.connect(trigger_gamer_over)

func trigger_gamer_over():
	#Deletar o gameUI
	if game_ui:
		game_ui.queue_free()
		game_ui = null

	
	#Criar o game over UI
	var game_over_ui: GameOverUi = game_over_ui_template.instantiate()
	add_child(game_over_ui)
	
