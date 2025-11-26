extends CanvasLayer


signal  restart	

func _on_restart_pressed() -> void:
	restart.emit()
