extends Panel


# onready paths:
onready var lab1 = $VBoxContainer/Label1
onready var lab2 = $VBoxContainer/Label2
onready var led = $VBoxContainer/LineEdit

onready var pic = $VBoxContainer/TextureButton

onready var cb1b = $VBoxContainer/HBoxContainer1/CheckBox
onready var cb1l = $VBoxContainer/HBoxContainer1/Label
onready var cb2b = $VBoxContainer/HBoxContainer2/CheckBox
onready var cb2l = $VBoxContainer/HBoxContainer2/Label
onready var cb3b = $VBoxContainer/HBoxContainer3/CheckBox
onready var cb3l = $VBoxContainer/HBoxContainer3/Label
onready var cb4b = $VBoxContainer/HBoxContainer4/CheckBox
onready var cb4l = $VBoxContainer/HBoxContainer4/Label
onready var cb5b = $VBoxContainer/HBoxContainer5/CheckBox
onready var cb5l = $VBoxContainer/HBoxContainer5/Label
onready var cb6b = $VBoxContainer/HBoxContainer6/CheckBox
onready var cb6l = $VBoxContainer/HBoxContainer6/Label
onready var cb7b = $VBoxContainer/HBoxContainer7/CheckBox
onready var cb7l = $VBoxContainer/HBoxContainer7/Label


#signal 


func _ready() -> void:
	var _err_edit = pic.connect("button_up", self, "_view_edit")
	var _err_letc = led.connect("text_changed", self, "_on_LineEdit_text_changed")
	#var _err_dis_del = led.connect("text_changed", self, "_del_btn_dis")
	var _err_cb1 = cb1b.connect("toggled", self, "_cb1")
	var _err_cb2 = cb2b.connect("toggled", self, "_cb2")
	var _err_cb3 = cb3b.connect("toggled", self, "_cb3")
	var _err_cb4 = cb4b.connect("toggled", self, "_cb4")
	var _err_cb5 = cb5b.connect("toggled", self, "_cb5")
	var _err_cb6 = cb6b.connect("toggled", self, "_cb6")
	var _err_cb7 = cb7b.connect("toggled", self, "_cb7")
	
	
	led.placeholder_text = VARS.hints
	
	cb1l.text = VARS.QL1
	cb2l.text = VARS.QL2
	cb3l.text = VARS.QL3
	cb4l.text = VARS.QL4
	cb5l.text = VARS.QL5
	cb6l.text = VARS.QL6
	cb7l.text = VARS.QL7
	
	

### need func to pass data to card instance in edit


func _view_edit():
	VARS.meal_name = lab2.text
	VARS.ck01 = _vckl1()
	VARS.ck02 = _vckl2()
	VARS.ck03 = _vckl3()
	VARS.ck04 = _vckl4()
	VARS.ck05 = _vckl5()
	VARS.ck06 = _vckl6()
	VARS.ck07 = _vckl7()
	VARS.total = 0
	SIGN.emit_signal("view_edit")
	get_node("/root/Main/CatView").queue_free()


func _edit_this():
	led.visible = true
	lab2.visible = false
	pic.disabled = true
	cb1b.visible = true
	cb2b.visible = true
	cb3b.visible = true
	cb4b.visible = true
	cb5b.visible = true
	cb6b.visible = true
	cb7b.visible = true

func _view_this():
	led.visible = false
	lab2.visible = true
	pic.disabled = false
	cb1b.visible = false
	cb2b.visible = false
	cb3b.visible = false
	cb4b.visible = false
	cb5b.visible = false
	cb6b.visible = false
	cb7b.visible = false
	


###########################################

func _on_LineEdit_text_changed(new_text: String):
	if !new_text.is_valid_filename():
		lab1.text = VARS.not_allow
		VARS.meal_name = "%%%"
		return
	else:
		lab1.text = VARS.ts + str(VARS.total)
		VARS.meal_name = new_text
	pass # Replace with function body.


func _cb1(button_pressed: bool) -> void:
	if button_pressed == true:
		VARS.ck01 = button_pressed
		VARS.total = VARS.total + 2
	elif button_pressed == false:
		VARS.ck01 = button_pressed
		VARS.total = VARS.total - 2
	lab1.text = VARS.ts + str(VARS.total)
	pass # Replace with function body.


func _cb2(button_pressed: bool) -> void:
	if button_pressed == true:
		VARS.ck02 = button_pressed
		VARS.total = VARS.total + 2
	elif button_pressed == false:
		VARS.ck02 = button_pressed
		VARS.total = VARS.total - 2
	lab1.text = VARS.ts + str(VARS.total)
	pass # Replace with function body.


func _cb3(button_pressed: bool) -> void:
	if button_pressed == true:
		VARS.ck03 = button_pressed
		VARS.total = VARS.total + 2
	elif button_pressed == false:
		VARS.ck03 = button_pressed
		VARS.total = VARS.total - 2
	lab1.text = VARS.ts + str(VARS.total)
	pass # Replace with function body.


func _cb4(button_pressed: bool) -> void:
	if button_pressed == true:
		VARS.ck04 = button_pressed
		VARS.total = VARS.total + 1
	elif button_pressed == false:
		VARS.ck04 = button_pressed
		VARS.total = VARS.total - 1
	lab1.text = VARS.ts + str(VARS.total)
	pass # Replace with function body.


func _cb5(button_pressed: bool) -> void:
	if button_pressed == true:
		VARS.ck05 = button_pressed
		VARS.total = VARS.total + 1
	elif button_pressed == false:
		VARS.ck05 = button_pressed
		VARS.total = VARS.total - 1
	lab1.text = VARS.ts + str(VARS.total)
	pass # Replace with function body.


func _cb6(button_pressed: bool) -> void:
	if button_pressed == true:
		VARS.ck06 = button_pressed
		VARS.total = VARS.total + 1
	elif button_pressed == false:
		VARS.ck06 = button_pressed
		VARS.total = VARS.total - 1
	lab1.text = VARS.ts + str(VARS.total)
	pass # Replace with function body.


func _cb7(button_pressed: bool) -> void:
	if button_pressed == true:
		VARS.ck07 = button_pressed
		VARS.total = VARS.total + 1
	elif button_pressed == false:
		VARS.ck07 = button_pressed
		VARS.total = VARS.total - 1
	lab1.text = VARS.ts + str(VARS.total)
	pass # Replace with function body.


#===============View Visable


func _ckl1(yes: bool) -> void:
	if yes == true:
		cb1l.visible = true
	else:
		cb1l.visible = false


func _ckl2(yes: bool) -> void:
	if yes == true:
		cb2l.visible = true
	else:
		cb2l.visible = false


func _ckl3(yes: bool) -> void:
	if yes == true:
		cb3l.visible = true
	else:
		cb3l.visible = false


func _ckl4(yes: bool) -> void:
	if yes == true:
		cb4l.visible = true
	else:
		cb4l.visible = false


func _ckl5(yes: bool) -> void:
	if yes == true:
		cb5l.visible = true
	else:
		cb5l.visible = false


func _ckl6(yes: bool) -> void:
	if yes == true:
		cb6l.visible = true
	else:
		cb6l.visible = false


func _ckl7(yes: bool) -> void:
	if yes == true:
		cb7l.visible = true
	else:
		cb7l.visible = false
		

#===============View EDIT Visable


func _vckl1() -> bool:
	if cb1l.visible == true:
		return true
	else:
		return false


func _vckl2() -> bool:
	if cb2l.visible == true:
		return true
	else:
		return false


func _vckl3() -> bool:
	if cb3l.visible == true:
		return true
	else:
		return false


func _vckl4() -> bool:
	if cb4l.visible == true:
		return true
	else:
		return false


func _vckl5() -> bool:
	if cb5l.visible == true:
		return true
	else:
		return false


func _vckl6() -> bool:
	if cb6l.visible == true:
		return true
	else:
		return false


func _vckl7() -> bool:
	if cb7l.visible == true:
		return true
	else:
		return false
