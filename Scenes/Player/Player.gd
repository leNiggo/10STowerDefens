extends Control

@export var money: int = 100;
@export var player_live: int = 5;

@onready var live_amount_ui: Label = $ColorRect/HBoxContainer/HealthCount
@onready var money_amount_ui: Label = $ColorRect/HBoxContainer/MoneyAmount

func _ready():
	live_amount_ui.text = str(player_live)
	money_amount_ui.text = str(money)
	pass

func on_buy(cost: int) -> bool: 
	if cost <= money:
		money -= cost;
		return true
	else:
		return false


func lose_live() -> void: 
	if player_live > 0:
		player_live -= 1;
		live_amount_ui.text = str(player_live)
	else:
		on_lose()
	pass


func earn_money(amount: int):
	money += amount;
	money_amount_ui.text = str(money)
	pass

func on_lose():
	# Go To Loose scene!
	pass
