extends Node

# begin code:


func _ready() -> void:
	SIGN.connect("pic_save", self, "_save_edit")


# puts the saved data into the card_cat dict
func _load():
	var file = File.new()
	if file.file_exists(VARS.save_path):
		var error = file.open_encrypted_with_pass(VARS.save_path, File.READ, "p@$$=W0rd-y0")
		if error == OK:
			var player_data = file.get_var()
			VARS.card_catalogue = player_data
			file.close()


func _save_edit(image_pic):
	var dir = Directory.new()
	if !dir.dir_exists("user://pics/"):
		dir.make_dir_recursive("user://pics/")
	if !dir.dir_exists("user://db/"):
		dir.make_dir_recursive("user://db/")
	var img = image_pic
	var img_png = "user://pics/"+VARS.meal_name+".png"
	img.save_png(img_png) # saves the pic
	
	VARS.card_catalogue[VARS.meal_name] = {   
		"name" : VARS.meal_name,
		"meal_pic" : img_png,
		"total" : VARS.total,
		"ck01" : VARS.ck01,
		"ck02" : VARS.ck02,
		"ck03" : VARS.ck03,
		"ck04" : VARS.ck04,
		"ck05" : VARS.ck05,
		"ck06" : VARS.ck06,
		"ck07" : VARS.ck07,
	}
	
	var file = File.new()
	var error = file.open_encrypted_with_pass(VARS.save_path, File.WRITE, "p@$$=W0rd-y0")
	if error == OK:
		file.store_var(VARS.card_catalogue) #saves the VARS
		file.close()
	pass


func _delete_card():
	var file = File.new()
	if file.file_exists(VARS.save_path):
		if VARS.meal_name == "":
			print("nameless")
		elif VARS.meal_name == str(VARS.card_catalogue.get(VARS.meal_name)["name"]):
			# remove .png file
			var dir := Directory.new()
			var _remove = dir.remove(VARS.card_catalogue[VARS.meal_name]["meal_pic"])
	
			# remove dict VARS
			var nam = VARS.meal_name
			VARS.card_catalogue.erase(nam)
	
			# updates dict VARS in file
			var error = file.open_encrypted_with_pass(VARS.save_path, File.WRITE, "p@$$=W0rd-y0")
			if error == OK:
				file.store_var(VARS.card_catalogue) #saves the VARS
				file.close()
		else:
			print("unequal")
	pass


func _card_clear():
	# clear vars data
	VARS.meal_name = ""
	VARS.total = 0
	VARS.ck01 = false
	VARS.ck02 = false
	VARS.ck03 = false
	VARS.ck04 = false
	VARS.ck05 = false
	VARS.ck06 = false
	VARS.ck07 = false
	pass


func _sort_cards_total() -> void:
	FUNK._load()
	
	var dict = VARS.card_catalogue
	var sort: Array = []
	var sort_score: Array = []
	var sort_score10: Array = []
	var sort_score9: Array = []
	var sort_score8: Array = []
	var sort_score7: Array = []
	var sort_score6: Array = []
	var sort_score5: Array = []
	var sort_score4: Array = []
	var sort_score3: Array = []
	var sort_score2: Array = []
	var sort_score1: Array = []
	var sort_score0: Array = []

	for i in dict:
		sort.append(dict[i].values())
	var i = 0
	var v = 2
	while i < sort.size():
		if sort[i][v] == 10:
			sort_score10.append(sort[i])
			i = i +1
		elif sort[i][v] == 9:
			sort_score9.append(sort[i])
			i = i +1
		elif sort[i][v] == 8:
			sort_score8.append(sort[i])
			i = i +1
		elif sort[i][v] == 7:
			sort_score7.append(sort[i])
			i = i +1
		elif sort[i][v] == 6:
			sort_score6.append(sort[i])
			i = i +1
		elif sort[i][v] == 5:
			sort_score5.append(sort[i])
			i = i +1
		elif sort[i][v] == 4:
			sort_score4.append(sort[i])
			i = i +1
		elif sort[i][v] == 3:
			sort_score4.append(sort[i])
			i = i +1
		elif sort[i][v] == 2:
			sort_score4.append(sort[i])
			i = i +1
		elif sort[i][v] == 1:
			sort_score4.append(sort[i])
			i = i +1
		elif sort[i][v] == 0:
			sort_score4.append(sort[i])
			i = i +1
		else:
			print("err sort_score: " + str(sort[i]))
			i = i +1
	sort_score = sort_score10 + sort_score9 + sort_score8 + sort_score7 + sort_score6 + sort_score5 + sort_score4 + sort_score3 + sort_score2 + sort_score1 + sort_score0
	VARS.sort_score = sort_score
	pass


func _load_lang():
	var file = File.new()
	if file.file_exists(VARS.lang_path):
		var error = file.open_encrypted_with_pass(VARS.lang_path, File.READ, "p@$$=W0rd-y0")
		if error == OK:
			var player_data = file.get_var()
			VARS.lang = player_data
			file.close()
	pass


func _save_lang():
	var dir = Directory.new()
	if !dir.dir_exists("user://db/"):
		dir.make_dir_recursive("user://db/")
	
	var file = File.new()
	var error = file.open_encrypted_with_pass(VARS.lang_path, File.WRITE, "p@$$=W0rd-y0")
	if error == OK:
		file.store_var(VARS.lang) #saves the language
		file.close()
	pass




### Languages
func _localize():
	match VARS.lang:
		"ENGL":
			# Check Save
			VARS.fail_save = ENGL.fail_save
			VARS.not_allow = ENGL.not_allow
			VARS.ts = ENGL.ts

			# Edit View buttons:
			VARS.save = ENGL.save
			VARS.cam = ENGL.cam
			VARS.del = ENGL.del
			VARS.cc = ENGL.cc
			
			# Cat View buttons:
			VARS.tc = ENGL.tc
			VARS.gl = ENGL.gl
			VARS.new_meal_card = ENGL.new_meal_card

			# Form labels:
			VARS.QL1 = ENGL.QL1
			VARS.QL2 = ENGL.QL2
			VARS.QL3 = ENGL.QL3
			VARS.QL4 = ENGL.QL4
			VARS.QL5 = ENGL.QL5
			VARS.QL6 = ENGL.QL6
			VARS.QL7 = ENGL.QL7

			VARS.hints = ENGL.hints

			# Popups
			VARS.pop_save = ENGL.pop_save
			VARS.pop_edit = ENGL.pop_edit
			VARS.pop_del = ENGL.pop_del
			VARS.pop_ads = ENGL.pop_ads

			# Info View
			VARS.top_btn = ENGL.top_btn
			VARS.mid_btn = ENGL.mid_btn
			VARS.bot_btn = ENGL.bot_btn

			VARS.blog = ENGL.blog
			
		_:
			print("invalid language")

	pass
