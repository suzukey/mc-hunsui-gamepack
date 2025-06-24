# ゲーム開始処理

# -- 既にゲームが開始されている場合 ---------------

execute if score PLAYING liars.game matches 1 run tellraw @s [{text:"■ ","color":"gray"},{"text":"ゲームは既に開始されています","color":"red"}]
execute if score PLAYING liars.game matches 1 run return 0

# -- 人数が要件を満たしていない場合 ---------------

execute if score #current_count liars.participants < MIN_PLAYERS liars.const run tellraw @s [{text:"■ ","color":"gray"},{"text":"プレイヤー数が足りません","color":"red"}]
execute if score #current_count liars.participants < MIN_PLAYERS liars.const run return 0

# -- 開始処理 ----------------

# ゲーム開始フラグを設定
scoreboard players set PLAYING liars.game 1

tellraw @a [{"text":"■ ","color":"gray"},{"text":"ゲームを開始します","color":"green"}]

# フェーズを初期化
scoreboard players set CURRENT_PHASE liars.game 0

# 全員を生存状態にする
scoreboard players set @a[tag=liars.participant] liars.is_alive 1

# -- 座席エンティティの初期化 ----------------------

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

# プレイヤーを座席に割り当て
function sui:liars/internal/playing/seat/assign_seats

# 座席1番のプレイヤーを最初のターンプレイヤーに設定
scoreboard players set @a[tag=liars.participant] liars.current_turn 0
scoreboard players set @a[tag=liars.participant,scores={liars.seat=1}] liars.current_turn 1

# -- ロシアンルーレット初期化 --------------------

# ランダムな弾倉位置を設定
execute as @a[tag=liars.participant] store result score @s liars.roulette run random value 1..6

# 引き金を引いた回数を初期化
execute as @a[tag=liars.participant] run scoreboard players set @s liars.triggered 0

# -- アイテム配布関連 ------------------

# 全アイテムを削除
kill @e[type=item]
clear @a

# カード以外の使用アイテムを配布
execute as @a[tag=liars.participant] run function sui:liars/internal/playing/give_action_items

# フェーズ開始処理を実行
function sui:liars/internal/playing/phase/start
