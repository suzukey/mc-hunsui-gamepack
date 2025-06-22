# ゲーム開始処理

# -- 既にゲームが開始されている場合 ---------------
execute if score GAME_STARTED sui.configs matches 1 run tellraw @s [{text:"■ ","color":"gray"},{"text":"ゲームは既に開始されています","color":"red"}]
execute if score GAME_STARTED sui.configs matches 1 run return 0

# -- 人数が要件を満たしていない場合 ---------------
execute if score PLAYER_COUNT sui.configs < MIN_PLAYER_COUNT sui.constants run tellraw @s [{text:"■ ","color":"gray"},{"text":"プレイヤー数が足りません","color":"red"}]
execute if score PLAYER_COUNT sui.configs < MIN_PLAYER_COUNT sui.constants run return 0

# -- ゲームタイプが選択されていない場合 ---------------
# ゲームが選択されていない場合の警告
execute if score GAME_TYPE sui.configs = GAME_TYPE_NONE sui.constants run tellraw @s [{text:"■ ","color":"gray"},{"text":"ゲームが選択されていません","color":"red"}]
execute if score GAME_TYPE sui.configs = GAME_TYPE_NONE sui.constants run return 0

# -- ゲーム共通開始設定 ---------------
scoreboard players set GAME_STARTED sui.configs 1

# -- ゲームごとの開始処理 ----------------

# Liars ゲームの開始
execute if score GAME_TYPE sui.configs = GAME_TYPE_LIARS sui.constants run function sui:game/liars/control/start

# PlayOut ゲームの開始
execute if score GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants run function sui:game/playout/control/start
