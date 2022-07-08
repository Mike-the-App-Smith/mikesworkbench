extends Node
# Main's purpose is to contain and change the views

# Begin code:

# views
var cat_view
var edit_view
var info_view


func _ready() -> void:
	FUNK._load()
	VARS.lang = "ENGL"
	FUNK._localize()
	var _err_cat = SIGN.connect("view_cat", self, "view_to_cat")
	var _err_edit = SIGN.connect("view_edit", self, "view_to_edit")
	var _err_info = SIGN.connect("view_info", self, "view_to_info")
	SIGN.emit_signal("view_info")
	


func view_to_edit():
	edit_view = load("res://views/EditView.tscn").instance()
	add_child(edit_view)


func view_to_cat():
	cat_view = load("res://views/CatView.tscn").instance()
	add_child(cat_view)


func view_to_info():
	info_view = load("res://views/InfoView.tscn").instance()
	add_child(info_view)
