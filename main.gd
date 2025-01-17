extends Node2D

var lobby_id = 0
var peer = SteamMultiplayerPeer.new()

@onready var spawner: MultiplayerSpawner = $MultiplayerSpawner


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawner.spawn_function = spawn_level
	peer.lobby_created.connect(_on_lobby_created)
	Steam.lobby_match_list.connect(_on_lobby_match_list)
	open_lobby_list()


func _on_host_pressed() -> void:
	peer.create_lobby(SteamMultiplayerPeer.LOBBY_TYPE_PUBLIC)
	multiplayer.multiplayer_peer = peer
	spawner.spawn("res://level.tscn")
	$Host.hide()
	$Refresh.hide()
	$LobbyContainer/Lobbies.hide()


func _on_lobby_created(connect, id):
	if connect:
		lobby_id = id
		Steam.setLobbyData(lobby_id, "name", str(Steam.getPersonaName()+"'s lobby"))
		Steam.setLobbyJoinable(lobby_id, true)
		print(lobby_id)


func _on_lobby_match_list(lobbies):
	for lobby in lobbies:
		var lobby_name = Steam.getLobbyData(lobby, "name")
		var members_count = Steam.getNumLobbyMembers(lobby)

		var button = Button.new()
		button.set_text(str(lobby_name,"| Player Count: ", members_count))
		button.set_size(Vector2(100.0, 5.0))
		button.connect("pressed", Callable(self, "join_lobby").bind(lobby))

		$LobbyContainer/Lobbies.add_child(button)


func join_lobby(id):
	peer.connect_lobby(id)
	multiplayer.multiplayer_peer = peer
	lobby_id = id
	$Host.hide()
	$Refresh.hide()
	$LobbyContainer/Lobbies.hide()


func open_lobby_list():
	Steam.addRequestLobbyListDistanceFilter(Steam.LOBBY_DISTANCE_FILTER_WORLDWIDE)
	Steam.requestLobbyList()


func spawn_level(data):
	return (load(data) as PackedScene).instantiate()


func _on_refresh_pressed() -> void:
	if $LobbyContainer/Lobbies.get_child_count() > 0:
		for node in $LobbyContainer/Lobbies.get_children():
			node.queue_free()
	open_lobby_list()
