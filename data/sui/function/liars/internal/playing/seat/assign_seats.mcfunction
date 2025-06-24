# プレイヤーの座席割り当て処理

# -- 準備処理 ----------------------

# 全プレイヤーの座席を解除
execute as @a[predicate=sui:liars/is_participant] run ride @s dismount

# ターン順をリセット
scoreboard players reset @a liars.seat

# -- 効率的な座席割り当て ----------------------

# カウンター初期化
scoreboard players set #seat_counter liars.configs 0

# 参加者をランダムに並べて座席を割り当て
execute as @a[predicate=sui:liars/is_participant,sort=random] run function sui:liars/internal/playing/seat/assign_next_seat

# -- 座席への着席 ----------------------

function sui:liars/internal/playing/seat/ride_seats

# -- 通知 ----------------------

# 各プレイヤーに座席番号を通知
execute as @a[scores={liars.seat=1}] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたは座席1番に着席しました","color":"yellow"}]
execute as @a[scores={liars.seat=2}] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたは座席2番に着席しました","color":"yellow"}]
execute as @a[scores={liars.seat=3}] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたは座席3番に着席しました","color":"yellow"}]
execute as @a[scores={liars.seat=4}] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたは座席4番に着席しました","color":"yellow"}]