# ゲーム開始処理

# -- 既にゲームが開始されている場合 ---------------

execute if score GAME_STARTED liars.configs matches 1 run tellraw @s [{text:"■ ","color":"gray"},{"text":"ゲームは既に開始されています","color":"red"}]
execute if score GAME_STARTED liars.configs matches 1 run return 0

# -- 人数が要件を満たしていない場合 ---------------

execute if score #current_count liars.participants < MIN_PLAYERS liars.configs run tellraw @s [{text:"■ ","color":"gray"},{"text":"プレイヤー数が足りません","color":"red"}]
execute if score #current_count liars.participants < MIN_PLAYERS liars.configs run return 0

# -- ゲーム共通開始設定 ---------------

scoreboard players set GAME_STARTED liars.configs 1

# -- ゲームごとの開始処理 ----------------

tellraw @a [{"text":"■ ","color":"gray"},{"text":"ゲームを開始します","color":"green"}]
