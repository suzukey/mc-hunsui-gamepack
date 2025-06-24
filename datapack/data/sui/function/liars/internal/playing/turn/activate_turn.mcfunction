# ターンを開始する処理
# @a[tag=liars.current_turn] のプレイヤーが対象

# ターン数を増加
scoreboard players add TURN_COUNT liars.game 1

# -- ターン開始メッセージ ----------------------

execute as @a[tag=liars.current_turn] run tellraw @a [{"text":"■ ","color":"gray"},{"selector":"@s","color":"green"},{"text":" のターン","color":"white"}]

# ダウトオプションの表示（2ターン目以降）
execute if score TURN_COUNT liars.game matches 2.. as @a[tag=liars.current_turn] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"アクション: ","color":"white"},{"text":"カードをプレイ","color":"green"},{"text":" または ","color":"white"},{"text":"ダウト","color":"red"}]

# 効果音
execute as @a[tag=liars.current_turn] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 1.2

# -- ターン状態の設定 ----------------------

# ターン状態をアクション選択中に設定
scoreboard players set TURN_STATE liars.game 1