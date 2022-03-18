from godot import exposed
from godot import *
import py_randomprime
import json
import os


@exposed
class save_iso(Node):
	# member variables here, example:
	input = ""
	output = ""
	globals = ""
	dict = {}
	def _ready(self):
		"""
		Called every time the node is added to the scene.
		Initialization here.
		"""
		self.globals = self.get_node("/root/Globals").working_layout
		pass
	def dumper(self, obj):
		try:
			return obj.toJSON()
		except:
			return obj.__dict__
	def save(self ,json):
		updaters = []
		try:
			py_randomprime.patch_iso_raw(
				json,
				  py_randomprime.ProgressNotifier(lambda percent, msg: updaters[-1](msg, percent)),
				)
			#self.get_node("ProgressBar").value = updaters[0]
		except BaseException as e:
			if isinstance(e, Exception):
				raise
			else:
				raise RuntimeError(f"randomprime panic: {e}") from e
	
	def _on_Save_pressed(self):
		json_path = "working_profile.json"
		serial = JSON.print(self.globals, "\t")
		serialz = str(serial)
		self.save(serialz)

	def _on_output_file_selected(self,path):
		self.output = path
		self.get_node("LineEdit2").text = path
		self.globals["outputIso"] = path
		
	def _on_input_file_selected(self,path):
		self.get_node("LineEdit").text = path
		self.input = path
		self.globals["inputIso"] = path
		
	def _on_select_pressed(self):
		self.get_node("input").popup()
		
	def _on_select_output_pressed(self):
		self.get_node("output").popup()
