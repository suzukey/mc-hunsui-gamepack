# 共通離脱処理

# プレイヤーが参加していないかチェック
execute if score @s sui.participants matches 0 run tellraw @s ["",{"text":"[システム] ","color":"gray"},{"text":"ゲームに参加していません","color":"red"}]
execute if score @s sui.participants matches 0 run return 0

# 離脱処理
scoreboard players reset @s sui.participants

# 人数を更新
execute store result score #current_count sui.participants if entity @a[scores={sui.participants=1}]

# 離脱メッセージ
tellraw @a ["",{"selector":"@s","color":"yellow"},{"text":" がゲームから離脱しました（","color":"gray"},{"score":{"name":"#current_count","objective":"sui.participants"},"color":"yellow"},{"text":"人）","color":"gray"}]

# 最小人数を下回ったかチェック
execute if score #current_count sui.participants < MIN_PLAYERS sui.configs run tellraw @a ["",{"text":"[システム] ","color":"gray"},{"text":"参加人数が最小人数を下回りました","color":"yellow"}]

# 成功を返す
return 1
