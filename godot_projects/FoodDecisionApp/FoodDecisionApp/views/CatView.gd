extends Control


onready var card = preload("res://views/instances/Card.tscn")
onready var hscroll: = $VBoxContainer/ScrollContainer
onready var hbox = $VBoxContainer/ScrollContainer/MarginContainer/HBoxContainer
onready var total_cards = $VBoxContainer/HBoxContainer/Label
onready var about = $VBoxContainer/HBoxContainer/Button3
onready var new_edit

# CHANGE??? is 'this' needed???
onready var margin_r: int = $VBoxContainer/ScrollContainer/MarginContainer.get("custom_constants/margin_right")
onready var card_space: int = $VBoxContainer/ScrollContainer/MarginContainer/HBoxContainer.get("custom_constants/separation")

var card_nodes: Array
var card_x_positions: Array = []
#==='this' is above


func _ready() -> void:
	
	var _err_info = about.connect("button_up", self, "_view_info")
	
	yield(get_tree(), "idle_frame")
	FUNK._sort_cards_total()
	
	
	new_edit = card.instance()
	hbox.add_child(new_edit)
	new_edit._view_this()
	new_edit.lab2.text = VARS.new_meal_card
	
	new_edit._ckl1(false)
	new_edit._ckl2(false)
	new_edit._ckl3(false)
	new_edit._ckl4(false)
	new_edit._ckl5(false)
	new_edit._ckl6(false)
	new_edit._ckl7(false)
	
	
	# CHANGE???
	### do i need this? some other way of adding to the list?
	card_nodes.append(new_edit)
		
		
	for _cards in card_nodes:
		var _card_pos_x: float = (margin_r + _cards.rect_position.x) - ((rect_size.x - _cards.rect_size.x) / 2)
		_cards.rect_pivot_offset = (_cards.rect_size / 2)
		card_x_positions.append(_card_pos_x)
	
	### Add the card cat
	var i = 0
	while i < VARS.sort_score.size():
		var new_card = card.instance()
		hbox.add_child(new_card)
		
		new_card._view_this()
		new_card.lab1.text = VARS.ts + str(VARS.sort_score[i][2])
		new_card.lab2.text = VARS.sort_score[i][0]
		new_card.led.text = VARS.sort_score[i][0]
		
		var img = Image.new()
		var tex = ImageTexture.new()
		img.load("user://pics/"+ VARS.sort_score[i][0] +".png")
		tex.create_from_image(img)
		new_card.pic.texture_normal = tex
		new_card.pic.texture_disabled = tex
		new_card.pic.texture_hover = tex
		new_card.pic.texture_pressed = tex
		new_card.pic.texture_focused = tex
		
		new_card._ckl1(VARS.sort_score[i][3])
		new_card._ckl2(VARS.sort_score[i][4])
		new_card._ckl3(VARS.sort_score[i][5])
		new_card._ckl4(VARS.sort_score[i][6])
		new_card._ckl5(VARS.sort_score[i][7])
		new_card._ckl6(VARS.sort_score[i][8])
		new_card._ckl7(VARS.sort_score[i][9])
		
	# CHANGE???
		card_nodes.append(new_card)
		i += 1
		
		
	for _cards in card_nodes:
		var _card_pos_x: float = (margin_r + _cards.rect_position.x) - ((rect_size.x - _cards.rect_size.x) / 2)
		_cards.rect_pivot_offset = (_cards.rect_size / 2)
		card_x_positions.append(_card_pos_x)
	####################

func _process(_delta: float) -> void:
	total_cards.text = VARS.tc + str(VARS.sort_score.size())


func _view_info():
	SIGN.emit_signal("view_info")
	get_node("/root/Main/CatView").queue_free()
	pass
