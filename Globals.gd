extends Node

var working_index
var current_world = null
var current_room = null

var json_layout = {}
var working_layout = json_layout

var DEBUG = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var worlds = [
	"Frigate Orpheon",
	"Tallon Overworld",
	"Chozo Ruins",
	"Magmoor Caverns",
	"Phendrana Drifts",
	"Phazon Mines",
	"Impact Crater",
	"End of Game"
]

var elevators = [
	"",
	"Crater Entry Point",
	"Phendrana Drifts North (Phendrana Shorelines)",
	"Phendrana Drifts South (Quarantine Cave)",
	"Magmoor Caverns North (Lava Lake)",
	"Magmoor Caverns West (Monitor Station)",
	"Magmoor Caverns East (Twin Fires)",
	"Magmoor Caverns South (Magmoor Workstation, Debris)",
	"Magmoor Caverns South (Magmoor Workstation, Save Station)",
	"Phazon Mines East (Main Quarry)",
	"Phazon Mines West (Phazon Processing Center)",
	"Tallon Overworld North (Tallon Canyon)",
	"Artifact Temple",
	"Tallon Overworld East (Frigate Crash Site)",
	"Tallon Overworld West (Root Cave)",
	"Tallon Overworld South (Great Tree Hall, Upper)",
	"Tallon Overworld South (Great Tree Hall, Lower)",
	"Chozo Ruins West (Main Plaza)",
	"Chozo Ruins North (Sun Tower)",
	"Chozo Ruins East (Reflecting Pool, Save Station)",
	"Chozo Ruins South (Reflecting Pool, Far End)",
	"Frigate Escape Cutscene",
	"Essence Dead Cutscene",
	"Credits"
]

var elevators_world = {
	"Crater Entry Point": "Impact Crater",
	"Phendrana Drifts North (Phendrana Shorelines)" : "Phendrana Drifts",
	"Phendrana Drifts South (Quarantine Cave)": "Phendrana Drifts",
	"Magmoor Caverns North (Lava Lake)": "Magmoor Caverns",
	"Magmoor Caverns West (Monitor Station)": "Magmoor Caverns",
	"Magmoor Caverns East (Twin Fires)": "Magmoor Caverns",
	"Magmoor Caverns South (Magmoor Workstation, Debris)": "Magmoor Caverns",
	"Magmoor Caverns South (Magmoor Workstation, Save Station)": "Magmoor Caverns",
	"Phazon Mines East (Main Quarry)": "Phazon Mines",
	"Phazon Mines West (Phazon Processing Center)": "Phazon Mines",
	"Tallon Overworld North (Tallon Canyon)": "Tallon Overworld",
	"Artifact Temple": "Tallon Overworld",
	"Tallon Overworld East (Frigate Crash Site)": "Tallon Overworld",
	"Tallon Overworld West (Root Cave)": "Tallon Overworld",
	"Tallon Overworld South (Great Tree Hall, Upper)": "Tallon Overworld",
	"Tallon Overworld South (Great Tree Hall, Lower)": "Tallon Overworld",
	"Chozo Ruins West (Main Plaza)": "Chozo Ruins",
	"Chozo Ruins North (Sun Tower)": "Chozo Ruins",
	"Chozo Ruins East (Reflecting Pool, Save Station)": "Chozo Ruins",
	"Chozo Ruins South (Reflecting Pool, Far End)": "Chozo Ruins",
	"Frigate Escape Cutscene": "Frigate Orpheon",
	"Essence Dead Cutscene": "Impact Crater",
	"Credits": "End of Game"
}


var elevators_room = {
	"Crater Entry Point": "Crater Entry Point",
	"Phendrana Drifts North (Phendrana Shorelines)" : "Transport to Magmoor Caverns West",
	"Phendrana Drifts South (Quarantine Cave)": "Transport to Magmoor Caverns South",
	"Magmoor Caverns North (Lava Lake)": "Transport to Chozo Ruins North",
	"Magmoor Caverns West (Monitor Station)": "Transport to Phendrana Drifts North",
	"Magmoor Caverns East (Twin Fires)": "Transport to Tallon Overworld West",
	"Magmoor Caverns South (Magmoor Workstation, Debris)": "Transport to Phazon Mines West",
	"Magmoor Caverns South (Magmoor Workstation, Save Station)": "Transport to Phendrana Drifts South",
	"Phazon Mines East (Main Quarry)": "Transport to Tallon Overworld South",
	"Phazon Mines West (Phazon Processing Center)": "Transport to Magmoor Caverns South",
	"Tallon Overworld North (Tallon Canyon)": "Transport to Chozo Ruins West",
	"Artifact Temple": "Artifact Temple",
	"Tallon Overworld East (Frigate Crash Site)": "Transport to Chozo Ruins East",
	"Tallon Overworld West (Root Cave)": "Transport to Magmoor Caverns East",
	"Tallon Overworld South (Great Tree Hall, Upper)": "Transport to Chozo Ruins South",
	"Tallon Overworld South (Great Tree Hall, Lower)": "Transport to Phazon Mines East",
	"Chozo Ruins West (Main Plaza)": "Transport to Tallon Overworld North",
	"Chozo Ruins North (Sun Tower)": "Transport to Magmoor Caverns North",
	"Chozo Ruins East (Reflecting Pool, Save Station)": "Transport to Tallon Overworld East",
	"Chozo Ruins South (Reflecting Pool, Far End)": "Transport to Tallon Overworld South",
	"Frigate Escape Cutscene": "Exterior Docking Hangar",
	"Essence Dead Cutscene": "Crater Entry Point",
	"Credits": "Credits"
}


var frigate_rooms = [
	"Air Lock",
	"Biohazard Containment",
	"Biotech Research Area 1",
	"Biotech Research Area 2",
	"Cargo Freight Lift to Deck Gamma",
	"Connection Elevator to Deck Alpha",
	"Connection Elevator to Deck Beta",
	"Connection Elevator to Deck Beta (2)",
	"Deck Alpha Access Hall",
	"Deck Alpha Mech Shaft",
	"Deck Alpha Umbilical Hall",
	"Deck Beta Conduit Hall",
	"Deck Beta Security Hall",
	"Deck Beta Transit Hall",
	"Deck Gamma Monitor Hall",
	"Emergency Evacuation Area",
	"Exterior Docking Hangar",
	"Main Ventilation Shaft Section A",
	"Main Ventilation Shaft Section B",
	"Main Ventilation Shaft Section C",
	"Main Ventilation Shaft Section D",
	"Main Ventilation Shaft Section E",
	"Main Ventilation Shaft Section F",
	"Map Facility",
	"Reactor Core",
	"Reactor Core Entrance",
	"Subventilation Shaft Section A",
	"Subventilation Shaft Section B",
]
var tallon_rooms = [
	"Alcove",
	"Arbor Chamber",
	"Artifact Temple",
	"Biohazard Containment",
	"Biotech Research Area 1",
	"Canyon Cavern",
	"Cargo Freight Lift to Deck Gamma",
	"Connection Elevator to Deck Beta",
	"Deck Beta Conduit Hall",
	"Deck Beta Security Hall",
	"Deck Beta Transit Hall",
	"Frigate Access Tunnel",
	"Frigate Crash Site",
	"Great Tree Chamber",
	"Great Tree Hall",
	"Gully",
	"Hydro Access Tunnel",
	"Landing Site",
	"Life Grove",
	"Life Grove Tunnel",
	"Main Ventilation Shaft Section A",
	"Main Ventilation Shaft Section B",
	"Main Ventilation Shaft Section C",
	"Overgrown Cavern",
	"Reactor Access",
	"Reactor Core",
	"Root Cave",
	"Root Tunnel",
	"Savestation",
	"Tallon Canyon",
	"Temple Hall",
	"Temple Lobby",
	"Temple Security Station",
	"Transport to Chozo Ruins East",
	"Transport to Chozo Ruins South",
	"Transport to Chozo Ruins West",
	"Transport to Magmoor Caverns East",
	"Transport to Phazon Mines East",
	"Transport Tunnel A",
	"Transport Tunnel B",
	"Transport Tunnel C",
	"Transport Tunnel D",
	"Transport Tunnel E",
	"Waterfall Cavern",
]
var chozo_rooms = [
	"Antechamber",
	"Arboretum",
	"Arboretum Access",
	"Burn Dome",
	"Burn Dome Access",
	"Crossway",
	"Crossway Access South",
	"Crossway Access West",
	"Dynamo",
	"Dynamo Access",
	"East Atrium",
	"East Furnace Access",
	"Elder Chamber",
	"Elder Hall Access",
	"Energy Core",
	"Energy Core Access",
	"Eyon Tunnel",
	"Furnace",
	"Gathering Hall",
	"Gathering Hall Access",
	"Hall of the Elders",
	"Hive Totem",
	"Magma Pool",
	"Main Plaza",
	"Map Station",
	"Meditation Fountain",
	"North Atrium",
	"Nursery Access",
	"Piston Tunnel",
	"Plaza Access",
	"Reflecting Pool",
	"Reflecting Pool Access",
	"Ruined Fountain",
	"Ruined Fountain Access",
	"Ruined Gallery",
	"Ruined Nursery",
	"Ruined Shrine",
	"Ruined Shrine Access",
	"Ruins Entrance",
	"Save Station 1",
	"Save Station 2",
	"Save Station 3",
	"Sun Tower",
	"Sun Tower Access",
	"Sunchamber",
	"Sunchamber Access",
	"Sunchamber Lobby",
	"Totem Access",
	"Tower Chamber",
	"Tower of Light",
	"Tower of Light Access",
	"Training Chamber",
	"Training Chamber Access",
	"Transport Access North",
	"Transport Access South",
	"Transport to Magmoor Caverns North",
	"Transport to Tallon Overworld East",
	"Transport to Tallon Overworld North",
	"Transport to Tallon Overworld South",
	"Vault",
	"Vault Access",
	"Watery Hall",
	"Watery Hall Access",
	"West Furnace Access",
]
var magmoor_rooms = [
	"Burning Trail",
	"Fiery Shores",
	"Geothermal Core",
	"Lake Tunnel",
	"Lava Lake",
	"Magmoor Workstation",
	"Monitor Station",
	"Monitor Tunnel",
	"North Core Tunnel",
	"Pit Tunnel",
	"Plasma Processing",
	"Save Station Magmoor A",
	"Save Station Magmoor B",
	"Shore Tunnel",
	"South Core Tunnel",
	"Storage Cavern",
	"Transport to Chozo Ruins North",
	"Transport to Phazon Mines West",
	"Transport to Phendrana Drifts North",
	"Transport to Phendrana Drifts South",
	"Transport to Tallon Overworld West",
	"Transport Tunnel A",
	"Transport Tunnel B",
	"Transport Tunnel C",
	"Triclops Pit",
	"Twin Fires",
	"Twin Fires Tunnel",
	"Warrior Shrine",
	"Workstation Tunnel",
]
var phendrana_rooms = [
	"Aether Lab Entryway",
	"Canyon Entryway",
	"Chamber Access",
	"Chapel of the Elders",
	"Chapel Tunnel",
	"Chozo Ice Temple",
	"Control Tower",
	"Courtyard Entryway",
	"East Tower",
	"Frost Cave",
	"Frost Cave Access",
	"Frozen Pike",
	"Gravity Chamber",
	"Hunter Cave",
	"Hunter Cave Access",
	"Hydra Lab Entryway",
	"Ice Ruins Access",
	"Ice Ruins East",
	"Ice Ruins West",
	"Lake Tunnel",
	"Lower Edge Tunnel",
	"Map Station",
	"North Quarantine Tunnel",
	"Observatory",
	"Observatory Access",
	"Phendrana Canyon",
	"Phendrana Shorelines",
	"Phendrana's Edge",
	"Pike Access",
	"Plaza Walkway",
	"Quarantine Access",
	"Quarantine Cave",
	"Quarantine Monitor",
	"Research Core",
	"Research Core Access",
	"Research Entrance",
	"Research Lab Aether",
	"Research Lab Hydra",
	"Ruined Courtyard",
	"Ruins Entryway",
	"Save Station A",
	"Save Station B",
	"Save Station C",
	"Save Station D",
	"Security Cave",
	"Shoreline Entrance",
	"South Quarantine Tunnel",
	"Specimen Storage",
	"Storage Cave",
	"Temple Entryway",
	"Transport Access",
	"Transport to Magmoor Caverns South",
	"Transport to Magmoor Caverns West",
	"Upper Edge Tunnel",
	"West Tower",
	"West Tower Entrance",
]
var phazon_rooms = [
	"Central Dynamo",
	"Dynamo Access",
	"Elevator A",
	"Elevator Access A",
	"Elevator Access B",
	"Elevator B",
	"Elite Control",
	"Elite Control Access",
	"Elite Quarters",
	"Elite Quarters Access",
	"Elite Research",
	"Fungal Hall A",
	"Fungal Hall Access",
	"Fungal Hall B",
	"Main Quarry",
	"Maintenance Tunnel",
	"Map Station Mines",
	"Metroid Quarantine A",
	"Metroid Quarantine B",
	"Mine Security Station",
	"Missile Station Mines",
	"Omega Research",
	"Ore Processing",
	"Phazon Mining Tunnel",
	"Phazon Processing Center",
	"Processing Center Access",
	"Quarantine Access A",
	"Quarantine Access B",
	"Quarry Access",
	"Research Access",
	"Save Station Mines A",
	"Save Station Mines B",
	"Save Station Mines C",
	"Security Access A",
	"Security Access B",
	"Storage Depot A",
	"Storage Depot B",
	"Transport Access",
	"Transport to Magmoor Caverns South",
	"Transport to Tallon Overworld South",
	"Ventilation Shaft",
	"Waste Disposal",
]
var impact_rooms = [
	"Crater Entry Point",
	"Crater Missile Station",
	"Crater Tunnel A",
	"Crater Tunnel B",
	"Metroid Prime Lair",
	"Phazon Core",
	"Phazon Infusion Chamber",
	"Subchamber Five",
	"Subchamber Four",
	"Subchamber One",
	"Subchamber Three",
	"Subchamber Two",
]
var endgame_rooms = [
	"Credits"
]

func get_array(area):
	match area:
		"Frigate Orpheon":
			return frigate_rooms
		"Tallon Overworld":
			return tallon_rooms
		"Chozo Ruins":
			return chozo_rooms
		"Magmoor Caverns":
			return magmoor_rooms
		"Phendrana Drifts":
			return phendrana_rooms
		"Phazon Mines":
			return phazon_rooms
		"Impact Crater":
			return impact_rooms
		"End of Game":
			return endgame_rooms

func DePrint(obj):
	if DEBUG:
		print(obj)



var default_file = File.new()
var data_text
var data_parse
var data
func test_file(file):
	if file.open("res://vanilla.json", File.READ) != OK:
		return
	data_text = default_file.get_as_text()
	data_parse = JSON.parse(data_text)
	if data_parse.error != OK:
		return
	data = data_parse.result
	working_layout = data

var world_element = {
	"transports": {},
	"rooms": {}
}

var room_element = {
	name: {
		"pickups": [
			
		],
		"superheated": false,
		"drainLiquids": false,
		"liquids": [],
		"modalHudMemo":null,
		"position": null,
		"destination":null,
		"doors": []
	}
}

var pickup_element = {
	"type": "Nothing",
	"model": "Nothing",
	"scanText": "Nothing",
	"hudmemoText": "Nothing Acquired",
	"currIncrease": 1,
	"maxIncrease": 1,
	"respawn": false
}
var node_details
func Create_Room(pickups, superheated, drainliquids, liquids, hudmemo, position, destination, doors):
	var json = {
		"pickups": pickups,
		"superheated": superheated,
		"drainLiquids": drainliquids,
		"liquids": liquids,
		"modalHudmemo": hudmemo,
		"position": position,
		"destination": destination,
		"doors": doors
	}
	return json
	
func Create_Pickup(type : String, model : String, text : String, memotext : String, cur : int, maxInc : int, respawn : bool):
	var json = {
		"type": type,
		"model": model,
		"scanText": text,
		"hudmemoText": memotext,
		"currIncrease": cur,
		"maxIncrease": maxInc,
		"respawn": respawn
	}
	return json

func Create_Door(type, blastshield, destination):
	return {
		"type": type,
		"blastShieldType": blastshield or null,
		"destination": destination or null
	}

func Create_Liquid():
	return {}
# Called when the node enters the scene tree for the first time.
func _ready():
	var json ={
		"preferences": {
			"qolGameBreaking": true,
			"qolCosmetic": true,
			"qolPickupScans": true,
			"qolCutscenes": "competitive",
			"mapDefaultState": "default",
			"artifactHintBehavior": "all",
			"automaticCrashScreen": true,
			"trilogyDiscPath": null,
			"quickplay": false
		},
		"gameConfig": {
			"startingRoom": "Tallon Overworld:Landing Site",
			"startingMemo": null,
			"warpToStart": false,
			"nonvariaHeatDamage": true,
			"staggeredSuitDamage": false,
			"heatDamagePerSec": 10,
			"autoEnabledElevators": false,
			"startingItems": {
				"combatVisor": true,
				"powerBeam": true,
				"scanVisor": true,
				"ice": false,
				"wave": false,
				"plasma": false,
				"missiles": 0,
				"bombs": false,
				"powerBombs": 0,
				"flamethrower": false,
				"thermalVisor": false,
				"charge": false,
				"superMissile": false,
				"grapple": false,
				"xray": false,
				"iceSpreader": false,
				"spaceJump": false,
				"morphBall": false,
				"boostBall": false,
				"spiderBall": false,
				"gravitySuit": false,
				"variaSuit": false,
				"phazonSuit": false,
				"energyTanks": 0,
				"wavebuster": false
			},
			"etankCapacity": 100,
			"itemMaxCapacity": {
				"Energy Tank": 100,
				"Missile": 250,
				"Power Bomb": 8
			},
			"backwardsFrigate": true,
			"backwardsLabs": true,
			"backwardsUpperMines": true,
			"backwardsLowerMines": true,
			"phazonEliteWithoutDynamo": true,
			"gameBanner": {
				"gameName": "Metroid Prime: Plandomizer",
				"gameNameFull": "Metroid Prime Plandomizer - Metroid Prime Impossible",
				"description": "github.com/toasterparty/metroid-prime-plandomizer"
			},
			"mainMenuMessage": "Metroid Prime Plandomizer\nMetroid Prime Impossible",
			"creditsString": null,
			"artifactHints": {
				"Artifact of Chozo": "&push;&main-color=#c300ff;Artifact of Chozo&pop; has no need to be located.",
				"Artifact of Nature": "&push;&main-color=#c300ff;Artifact of Nature&pop; has no need to be located.",
				"Artifact of Sun": "&push;&main-color=#c300ff;Artifact of Sun&pop; has no need to be located.",
				"Artifact of World": "&push;&main-color=#c300ff;Artifact of World&pop; has no need to be located.",
				"Artifact of Spirit": "&push;&main-color=#c300ff;Artifact of Spirit&pop; has no need to be located.",
				"Artifact of Newborn": "&push;&main-color=#c300ff;Artifact of Newborn&pop; has no need to be located.",
				"Artifact of Truth": "&push;&main-color=#c300ff;Artifact of Truth&pop; is located in &push;&main-color=#89a1ff;Tallon Overworld - Artifact Temple&pop;.",
				"Artifact of Strength": "&push;&main-color=#c300ff;Artifact of Strength&pop; is located in &push;&main-color=#89a1ff;Phendrana Drifts - Ice Ruins East&pop;.",
				"Artifact of Elder": "&push;&main-color=#c300ff;Artifact of Elder&pop; is located in &push;&main-color=#89a1ff;Phendrana Drifts - Phendrana Canyon&pop;.",
				"Artifact of Wild": "&push;&main-color=#c300ff;Artifact of Wild&pop; is located in &push;&main-color=#89a1ff;Magmoor Caverns - Warrior Shrine&pop;.",
				"Artifact of Lifegiver": "&push;&main-color=#c300ff;Artifact of Lifegiver&pop; is located in &push;&main-color=#89a1ff;Phazon Mines - Metroid Quarantine A&pop;.",
				"Artifact of Warrior": "&push;&main-color=#c300ff;Artifact of Warrior&pop; is located in &push;&main-color=#89a1ff;Magmoor Caverns - Transport Tunnel A&pop;."
			}
		},
		"tweaks": {},
		"levelData": {
			"Impact Crater": {
				"transporters": {
					"Crater Entry Point": "Artifact Temple"
				},
				"rooms":{}
			},
			"Phendrana Drifts": {
				"transporters": {
					"Phendrana Drifts North (Phendrana Shorelines)": "Phazon Mines West (Phazon Processing Center)",
					"Phendrana Drifts South (Quarantine Cave)": "Magmoor Caverns South (Magmoor Workstation, Save Station)"
				},
				"rooms":{}
			},
			"Frigate Orpheon": {
				"transporters": {},
				"rooms":{}
			},
			"Magmoor Caverns": {
				"transporters": {
					"Magmoor Caverns North (Lava Lake)": "Chozo Ruins East (Reflecting Pool, Save Station)",
					"Magmoor Caverns West (Monitor Station)": "Tallon Overworld South (Great Tree Hall, Upper)",
					"Magmoor Caverns East (Twin Fires)": "Chozo Ruins North (Sun Tower)",
					"Magmoor Caverns South (Magmoor Workstation, Debris)": "Tallon Overworld East (Frigate Crash Site)",
					"Magmoor Caverns South (Magmoor Workstation, Save Station)": "Phendrana Drifts South (Quarantine Cave)"
				},
				"rooms":{}
			},
			"Phazon Mines": {
				"transporters": {
					"Phazon Mines East (Main Quarry)": "Tallon Overworld South (Great Tree Hall, Lower)",
					"Phazon Mines West (Phazon Processing Center)": "Phendrana Drifts North (Phendrana Shorelines)"
				},
				"rooms":{}
			},
			"Tallon Overworld": {
				"transporters": {
					"Tallon Overworld North (Tallon Canyon)": "Chozo Ruins South (Reflecting Pool, Far End)",
					"Artifact Temple": "Credits",
					"Tallon Overworld East (Frigate Crash Site)": "Magmoor Caverns South (Magmoor Workstation, Debris)",
					"Tallon Overworld West (Root Cave)": "Chozo Ruins West (Main Plaza)",
					"Tallon Overworld South (Great Tree Hall, Upper)": "Magmoor Caverns West (Monitor Station)",
					"Tallon Overworld South (Great Tree Hall, Lower)": "Phazon Mines East (Main Quarry)"
				},
				"rooms":{}
			},
			"Chozo Ruins": {
				"transporters": {
					"Chozo Ruins West (Main Plaza)": "Tallon Overworld West (Root Cave)",
					"Chozo Ruins North (Sun Tower)": "Magmoor Caverns East (Twin Fires)",
					"Chozo Ruins East (Reflecting Pool, Save Station)": "Magmoor Caverns North (Lava Lake)",
					"Chozo Ruins South (Reflecting Pool, Far End)": "Tallon Overworld North (Tallon Canyon)"
				},
				"rooms":{}
			}
		},
		"inputIso": "F:\\Dropbox\\Media\\Games\\ROMs\\Nintendo\\Gamecube\\Metroid Prime\\Metroid Prime [GM8E01].iso",
		"outputIso": "D:\\Libraries\\Downloads\\Prime Randomizer - Turret Turret Nature.iso"
	}
	for x in impact_rooms:
		json["levelData"]["Impact Crater"]["rooms"][x] = Create_Room([Create_Pickup("Nothing","Nothing","Nothing", "Nothing Acquired", 1, 1, false)],false,false,[],null,null,null,[])
	for x in phendrana_rooms:
		json["levelData"]["Phendrana Drifts"]["rooms"][x] = Create_Room([Create_Pickup("Nothing","Nothing","Nothing", "Nothing Acquired", 1, 1, false)],false,false,[],null,null,null,[])
	for x in frigate_rooms:
		json["levelData"]["Frigate Orpheon"]["rooms"][x] = Create_Room([Create_Pickup("Nothing","Nothing","Nothing", "Nothing Acquired", 1, 1, false)],false,false,[],null,null,null,[])
	for x in magmoor_rooms:
		json["levelData"]["Magmoor Caverns"]["rooms"][x] = Create_Room([Create_Pickup("Nothing","Nothing","Nothing", "Nothing Acquired", 1, 1, false)],false,false,[],null,null,null,[])
	for x in phazon_rooms:
		json["levelData"]["Phazon Mines"]["rooms"][x] = Create_Room([Create_Pickup("Nothing","Nothing","Nothing", "Nothing Acquired", 1, 1, false)],false,false,[],null,null,null,[])
	for x in tallon_rooms:
		json["levelData"]["Tallon Overworld"]["rooms"][x] = Create_Room([Create_Pickup("Nothing","Nothing","Nothing", "Nothing Acquired", 1, 1, false)],false,false,[],null,null,null,[])
	for x in chozo_rooms:
		json["levelData"]["Chozo Ruins"]["rooms"][x] = Create_Room([Create_Pickup("Nothing","Nothing","Nothing", "Nothing Acquired", 1, 1, false)],false,false,[],null,null,null,[])
	
	var serial=JSON.print(json, "\t")
	var file = File.new()
	file.open("user://json_test.json", File.WRITE)
	file.store_string(serial)
	file.close()
	test_file(default_file)
	#Json_Handler.Save_Room_Array_Changes("Phendrana Drifts", "Control Tower", "pickups", 0,  {
	#	"type": "Nothing",
	#	"model": "Nothing",
	#	"scanText": "Nothing",
	#	"hudmemoText": "Nothing Aquired",
	#	"currIncrease": 4,
	#	"maxIncrease": 8,
	#	"respawn": true
	#})
	
	#print(working_layout["levelData"]["Phendrana Drifts"]["rooms"]["Control Tower"]["pickups"][0])



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
