![godotsteam-multiplayerpeer-example](/godotsteam-multiplayerpeer-example.png)

# godotsteam-multiplayerpeer-example
An example for GodotSteam MultiplayerPeer.

### Background
This was made following along Gwizz's Youtube video, [Godot 4 Steam Multiplayer](https://www.youtube.com/watch?v=fUBdnocrc3Y).

## Getting Started
1. Download and unarchive [GodotSteam MultiplayerPeer](https://github.com/GodotSteam/MultiplayerPeer/releases/latest)
    - I recommed unarchiving all files into a `godotsteam` folder
1. Login with Steam using the Desktop Steam Client
1. Launch the game from Godot (or the export, see below)

## Exporting to Windows
This section created following along Gwizz's YouTube video, [Godot 4 Steam Export](https://www.youtube.com/watch?v=_bD-ZCOZdMM)
1. Open GodotSteam
1. Select "Project" > "Export..."
1. Select "Add" > "Windows Desktop"
    - Ignore the warning about the icon (for now)
1. For "Options" > "Custom Template" > "Debug", select the template from the unarchived folder
1. Repeat the process for the "Release" template
1. Select "Export Project..."
1. Create/Select a new folder called "export"
1. Unselect "Export With Debug" unless you want the console to open with your app
1. Select "Save"
    - Again, ignore rcedit warnings
1. If you get an error on Launch, it is becuase you need the [steam_api64.dll](export/steam_api64.dll) next to the `.exe`

## Fixing RCEDIT Warnings
1. Download [rcedit](https://github.com/electron/rcedit/releases)
1. Open GodotSteam
1. Select "Editor" > "Editor Settings..."
1. Select "Export" > "Windows"
1. Open the rcedit file
