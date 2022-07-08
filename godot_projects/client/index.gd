extends Control

export var URL = "https://github.com/Mike-the-App-Smith/mikesworkbench"


func _ready() -> void:
	var _err_info = $OpenScene/ColorRect3/Button.connect("button_up", self, "_begin_purp")
	var _err_gbut = $OpenScene/ColorRect3/TextureButton.connect("button_up", self, "_git_link")
	var _err_glink = $OpenScene/ColorRect3/LinkButton.connect("button_up", self, "_git_link")
	pass


func _begin_purp() -> bool:
	var tl_corner = Vector2(0,0)
	var full_size = Vector2(1280,720)
	$Tween.interpolate_property($OpenScene/ColorRect3, "rect_min_size", rect_min_size, full_size, 0.5)
	$Tween.interpolate_property($OpenScene/ColorRect3, "rect_position", rect_position, tl_corner, 0.5)
	$Tween.interpolate_property($OpenScene/ColorRect3, "anchor_right", anchor_right, 1, 0.5)
	$Tween.interpolate_property($OpenScene/ColorRect3, "anchor_bottom", anchor_bottom, 1, 0.5)
	$Tween.start()
	$OpenScene/ColorRect.visible = false
	$OpenScene/ColorRect2.visible = false
	$OpenScene/ColorRect3/Button.visible = false
	$OpenScene/ColorRect3/Label.visible = false
	$OpenScene/ColorRect3/TextureButton.rect_scale = Vector2(2.5, 2.5)
	$OpenScene/ColorRect3/LinkButton.rect_scale = Vector2(0.5, 0.5)
	$OpenScene/ColorRect3/Button2.visible = true
	$OpenScene/ColorRect3/Button2.rect_position = Vector2(200, 100)
	$OpenScene/ColorRect3/Button2/LineEdit.visible = true
	$OpenScene/ColorRect3/Button2/LineEdit.rect_position = Vector2(400, 0)
	$OpenScene/ColorRect3/Button2/LineEdit2.visible = true
	$OpenScene/ColorRect3/Button3.visible = true
	$OpenScene/ColorRect3/Button3.rect_position = Vector2(200, 400)
	$OpenScene/ColorRect3/Button3/LineEdit2.visible = true
	$OpenScene/ColorRect3/Button3/LineEdit2.rect_position = Vector2(400, 0)
	$OpenScene/ColorRect3/Button3/LineEdit3.visible = true
	$OpenScene/ColorRect3/Button3/LineEdit4.visible = true
	return true
	pass


func _git_link() -> void:
	OS.shell_open(URL)
	pass
