extends Control


onready var blog = $HBoxContainer/VBoxContainer/ScrollContainer/Label
onready var btn1 = $HBoxContainer/VBoxContainer2/Button
onready var btn2 = $HBoxContainer/VBoxContainer2/Button2
onready var btn3 = $HBoxContainer/VBoxContainer2/Button3
onready var back_btn = $back_btn


func _ready() -> void:
	blog.text = VARS.blog
	
	# continue code:
	btn1.text = VARS.top_btn
	btn2.text = VARS.mid_btn
	btn3.text = VARS.bot_btn
	
	var _err_cat_view = back_btn.connect("button_up", self, "_cat_view")
	pass



# Change View functions
func _cat_view():
	VARS.card_catalogue = {} # clear vars data
	FUNK._card_clear()
	FUNK._load() # reload and refresh
	SIGN.emit_signal("view_cat")
	queue_free()
	pass

