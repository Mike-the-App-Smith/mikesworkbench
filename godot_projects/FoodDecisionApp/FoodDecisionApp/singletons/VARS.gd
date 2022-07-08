extends Node
# Contains Form Data

# Begin Code:
# FORM INPUT & SAVED DICT

var meal_name: String # make unique
# --> meal_pic from name
var total: int = 0
var ck01: bool
var ck02: bool
var ck03: bool
var ck04: bool
var ck05: bool
var ck06: bool
var ck07: bool


var card_catalogue = {}

var sort_score = []

var lang := ""

# Paths
var save_path = "user://db/cards.json"
var lang_path = "user://db/lang.json"

# Begin Strings
# Check Save
var fail_save := ""
var not_allow := ""
var ts := ""

# Edit View buttons:
var save := ""
var cam := ""
var del := ""
var cc := ""

# Cat View buttons:
var tc := ""
var gl := ""
var new_meal_card := ""

# Form labels:
var QL1 := ""
var QL2 := ""
var QL3 := ""
var QL4 := ""
var QL5 := ""
var QL6 := ""
var QL7 := ""

var hints := ""

# Popups
var pop_save := ""
var pop_edit := ""
var pop_del := ""
var pop_ads := ""

# Info View
var top_btn = ""
var mid_btn = ""
var bot_btn = ""

var blog = """

"""
