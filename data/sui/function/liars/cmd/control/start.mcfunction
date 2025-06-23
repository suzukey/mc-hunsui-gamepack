# ゲーム開始処理

# -- 既にゲームが開始されている場合 ---------------

execute if score GAME_STARTED liars.configs matches 1 run tellraw @s [{text:"■ ","color":"gray"},{"text":"ゲームは既に開始されています","color":"red"}]
execute if score GAME_STARTED liars.configs matches 1 run return 0

# -- 人数が要件を満たしていない場合 ---------------

execute if score #current_count liars.participants < MIN_PLAYERS liars.configs run tellraw @s [{text:"■ ","color":"gray"},{"text":"プレイヤー数が足りません","color":"red"}]
execute if score #current_count liars.participants < MIN_PLAYERS liars.configs run return 0

# -- ゲーム共通開始設定 ---------------

scoreboard players set GAME_STARTED liars.configs 1

# -- 開始処理 ----------------

tellraw @a [{"text":"■ ","color":"gray"},{"text":"ゲームを開始します","color":"green"}]

# -- ゲーム進行管理 ----------------------

scoreboard objectives remove liars.game
scoreboard objectives add liars.game dummy "ゲーム状態"
scoreboard players set CURRENT_PHASE liars.game 0
scoreboard players set CURRENT_TURN liars.game 0

# -- 山札・手札管理 ----------------------

scoreboard objectives remove liars.number_of_cards
scoreboard objectives add liars.number_of_cards dummy "手札枚数"

# -- プレイヤー個別データ ----------------------

scoreboard objectives remove liars.seat
scoreboard objectives add liars.seat dummy "プレイヤー座席"

# -- 座席エンティティの初期化 ----------------------

# 既存の座席エンティティを削除
kill @e[tag=liars.seat]

# 座席エンティティを生成（4つの固定位置）
# 座席1: 北側
summon armor_stand 18 -59.5 -14 {Tags:["liars.seat","liars.seat.1"],Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
# 座席2: 東側
summon armor_stand 24 -59.5 -8 {Tags:["liars.seat","liars.seat.2"],Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
# 座席3: 南側
summon armor_stand 18 -59.5 -2 {Tags:["liars.seat","liars.seat.3"],Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
# 座席4: 西側
summon armor_stand 12 -59.5 -8 {Tags:["liars.seat","liars.seat.4"],Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}

# 座席番号をスコアボードに設定
scoreboard players set @e[tag=liars.seat.1] liars.seat 1
scoreboard players set @e[tag=liars.seat.2] liars.seat 2
scoreboard players set @e[tag=liars.seat.3] liars.seat 3
scoreboard players set @e[tag=liars.seat.4] liars.seat 4

# フェーズ開始処理を実行
scoreboard players set CURRENT_PHASE liars.game 0
function sui:liars/internal/playing/start_phase
