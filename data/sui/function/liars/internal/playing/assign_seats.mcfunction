# プレイヤーの座席割り当て処理

# -- 準備処理 ----------------------

# 全プレイヤーの座席を解除
execute as @a[scores={liars.participants=1..}] run ride @s dismount

# ターン順をリセット
scoreboard players reset @a liars.seat

# -- ランダムな順番割り当て ----------------------

# 各プレイヤーにランダムなスコアを付与（1-1000000の範囲）
execute as @a[scores={liars.participants=1..}] store result score @s liars.seat run random value 1..1000000

# -- 順位付け処理 ----------------------

# 一時的なターン順保存用
scoreboard objectives add liars.temp dummy
scoreboard players set #turn_order liars.temp 1

# スコアの高い順に順番を割り当て
execute as @a[scores={liars.participants=1..}] run scoreboard players operation @s liars.temp = @s liars.seat

# 1番目のプレイヤーを決定
scoreboard players set #max liars.temp -2147483648
execute as @a[scores={liars.participants=1..}] if score @s liars.temp > #max liars.temp run scoreboard players operation #max liars.temp = @s liars.temp
execute as @a[scores={liars.participants=1..}] if score @s liars.temp = #max liars.temp run scoreboard players set @s liars.seat 1
execute as @a[scores={liars.seat=1}] run scoreboard players reset @s liars.temp

# 2番目のプレイヤーを決定
scoreboard players set #max liars.temp -2147483648
execute as @a[scores={liars.participants=1..,liars.temp=1..}] if score @s liars.temp > #max liars.temp run scoreboard players operation #max liars.temp = @s liars.temp
execute as @a[scores={liars.participants=1..,liars.temp=1..}] if score @s liars.temp = #max liars.temp run scoreboard players set @s liars.seat 2
execute as @a[scores={liars.seat=2}] run scoreboard players reset @s liars.temp

# 3番目のプレイヤーを決定（3人以上の場合）
execute if score #current_count liars.participants matches 3.. run scoreboard players set #max liars.temp -2147483648
execute if score #current_count liars.participants matches 3.. as @a[scores={liars.participants=1..,liars.temp=1..}] if score @s liars.temp > #max liars.temp run scoreboard players operation #max liars.temp = @s liars.temp
execute if score #current_count liars.participants matches 3.. as @a[scores={liars.participants=1..,liars.temp=1..}] if score @s liars.temp = #max liars.temp run scoreboard players set @s liars.seat 3
execute if score #current_count liars.participants matches 3.. as @a[scores={liars.seat=3}] run scoreboard players reset @s liars.temp

# 4番目のプレイヤーを決定（4人の場合）
execute if score #current_count liars.participants matches 4 run scoreboard players set #max liars.temp -2147483648
execute if score #current_count liars.participants matches 4 as @a[scores={liars.participants=1..,liars.temp=1..}] if score @s liars.temp > #max liars.temp run scoreboard players operation #max liars.temp = @s liars.temp
execute if score #current_count liars.participants matches 4 as @a[scores={liars.participants=1..,liars.temp=1..}] if score @s liars.temp = #max liars.temp run scoreboard players set @s liars.seat 4

# 一時スコアボードを削除
scoreboard objectives remove liars.temp

# -- 座席への着席 ----------------------

function sui:liars/internal/playing/ride_seats

# -- 通知 ----------------------

# 各プレイヤーに座席番号を通知
execute as @a[scores={liars.seat=1}] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたは座席1番に着席しました","color":"yellow"}]
execute as @a[scores={liars.seat=2}] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたは座席2番に着席しました","color":"yellow"}]
execute as @a[scores={liars.seat=3}] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたは座席3番に着席しました","color":"yellow"}]
execute as @a[scores={liars.seat=4}] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたは座席4番に着席しました","color":"yellow"}]

# 最初のターンプレイヤーを設定
scoreboard players set CURRENT_TURN liars.game 1
