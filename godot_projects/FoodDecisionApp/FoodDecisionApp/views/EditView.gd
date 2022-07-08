extends Control
# Add/Edit/Delete a card and return to CatView

# Begin Code:
# CameraPlugin for Android
var imagePlugin

# pass image data to save in FUNK
var new_labe # = new card inst label used to save data

# onready paths:
onready var card = $HBoxContainer/Center/Card
onready var del_btn = $HBoxContainer/Right/VBoxContainer/DeleteBtn
onready var sav_btn = $HBoxContainer/Right/VBoxContainer/SaveBtn
onready var cam_btn = $HBoxContainer/Right/VBoxContainer/CameraBtn
onready var cat_btn = $HBoxContainer/Left/CatViewBtn

onready var con_save = $Save
onready var con_del = $Del
onready var con_ads = $Ads


func _ready():
	#$AdMob.load_interstitial()
	
	del_btn.disabled = true
	
	con_ads.window_title = ""
	con_del.window_title = ""
	con_save.window_title = ""
	del_btn.text = VARS.del
	sav_btn.text = VARS.save
	cam_btn.text = VARS.cam
	cat_btn.text = VARS.cc
	
	
	card._edit_this()
	card.lab1.text = VARS.ts + str(VARS.total)
	card.led.text = VARS.meal_name
	new_labe = card.lab1
	
	#values for card
	card.led.text = VARS.meal_name
	card.cb1b.pressed = VARS.ck01
	card.cb2b.pressed = VARS.ck02
	card.cb3b.pressed = VARS.ck03
	card.cb4b.pressed = VARS.ck04
	card.cb5b.pressed = VARS.ck05
	card.cb6b.pressed = VARS.ck06
	card.cb7b.pressed = VARS.ck07
	
	
	# image
	if VARS.meal_name != VARS.new_meal_card:
		var img = Image.new()
		var tex = ImageTexture.new()
		img.load("user://pics/"+ VARS.meal_name +".png")
		tex.create_from_image(img)
		card.pic.texture_normal = tex
		card.pic.texture_disabled = tex
		card.pic.texture_pressed = tex
	else:
		card.led.text = ""
	
	
	# Signals
	var _err_delete = $HBoxContainer/Right/VBoxContainer/DeleteBtn.connect("button_up", self, "_delete_card")
	var _err_save = $HBoxContainer/Right/VBoxContainer/SaveBtn.connect("button_up", self, "_save_card")
	var _err_camera = $HBoxContainer/Right/VBoxContainer/CameraBtn.connect("button_up", self, "_take_picture")
	var _err_cat_view = $HBoxContainer/Left/CatViewBtn.connect("button_up", self, "_cat_view")
	var _err_save_con = $Save.connect("confirmed", self, "_save_this")
	var _err_del_con = $Del.connect("confirmed", self, "_delete_this")
	var _err_ads_con = $Ads.connect("confirmed", self, "_ads_this")
	#var _err_ads_closed = $AdMob.connect("interstitial_closed", self, "_ad_closed")
			
	# Ready the Camera and connect the signal
	if Engine.has_singleton("GodotGetImage"):
		imagePlugin = Engine.get_singleton("GodotGetImage")
		imagePlugin.connect("image_request_completed", self, "_set_image")
		
		# PIC TAKEN... 4:3 RATIO SEEMS STANDARD
		var options = {
			"image_format" : "jpg",
			"image_width" : 320,
			"image_height" : 240,
			"keep_aspect" : false
		}
		imagePlugin.setOptions(options)


# takes image from addon and puts it in the $Picture
func _set_image(dict):
	# Sets image from camera/library to Picture
	for image in dict.values():
		var currentImage = Image.new()
		currentImage.load_jpg_from_buffer(image)
		yield(get_tree(), "idle_frame")
		var tex = ImageTexture.new()
		tex.create_from_image(currentImage, 0)
		# change when completed, requires full destination?
		card.pic.texture_normal = tex
		card.pic.texture_disabled = tex
		card.pic.texture_pressed = tex
	pass


func _process(_delta: float) -> void:
	if VARS.card_catalogue.has(VARS.meal_name):
		del_btn.disabled = false
	else:
		del_btn.disabled = true

##########################
### BUTTON FUNCTIONS ###
##########################
func _delete_card():
	con_del.dialog_text = VARS.pop_del
	con_del.visible = true
	pass


func _save_card():
	# prepare the image
	yield(VisualServer, "frame_post_draw")
	
	# validate card name
	var x = VARS.card_catalogue.get(VARS.meal_name, "???")
	# not valid due to special characters
	if VARS.meal_name == "%%%":
		new_labe.text = VARS.fail_save
	elif VARS.meal_name == "" || VARS.meal_name == VARS.new_meal_card:
		new_labe.text = VARS.fail_save
		
	# create new card 
	elif str(x) == "???":
		con_save.dialog_text = VARS.pop_save
		con_save.visible = true
	# edit a card
	else:
		con_save.dialog_text = VARS.pop_edit
		con_save.visible = true
	pass


func _take_picture():
	if imagePlugin:
		imagePlugin.resendPermission()
		imagePlugin.getCameraImage()
	else:
		print("Button worked, but plugin isn't loaded...")
	pass


# Change View functions
func _cat_view():
	FUNK._card_clear()
	FUNK._load() # reload and refresh
	SIGN.emit_signal("view_cat")
	queue_free()
	pass


func _save_this():
	var image_pic = card.pic.texture_normal.get_data()
	SIGN.emit_signal("pic_save", image_pic)
	_cat_view()
	
	#con_ads.dialog_text = VARS.pop_ads
	#con_ads.visible = true
	pass


func _delete_this():
	FUNK._delete_card()
	_cat_view()
	
	#con_ads.dialog_text = VARS.pop_ads
	#con_ads.visible = true
	pass

"""
func _ads_this():
	$AdMob.show_interstitial()
	pass


func _ad_closed():
	_cat_view()
	pass
"""
