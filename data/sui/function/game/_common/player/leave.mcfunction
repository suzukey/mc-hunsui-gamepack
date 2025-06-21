# 共通離脱処理

# プレイヤーが参加していないかチェック
execute if score @s sui.participants matches 0 run tellraw @s ["",{"text":"[システム] ","color":"gray"},{"text":"ゲームに参加していません","color":"red"}]
execute if score @s sui.participants matches 0 run return 0

# 離脱処理
scoreboard players reset @s sui.participants

# 人数を更新
execute store result score #current_count sui.participants if entity @a[scores={sui.participants=1}]

# 開始要件を満たすかチェック
execute store result score #can_start sui.participants if score #current_count sui.participants >= MIN_PLAYERS sui.configs

# 離脱メッセージ（開始要件を満たす場合は緑、満たさない場合は黄色）
execute if score #can_start sui.participants matches 1 run tellraw @a ["",{"selector":"@s","color":"yellow"},{"text":" がゲームから離脱しました（","color":"gray"},{"score":{"name":"#current_count","objective":"sui.participants"},"color":"green"},{"text":"人）","color":"gray"}]
execute if score #can_start sui.participants matches 0 run tellraw @a ["",{"selector":"@s","color":"yellow"},{"text":" がゲームから離脱しました（","color":"gray"},{"score":{"name":"#current_count","objective":"sui.participants"},"color":"yellow"},{"text":"人）","color":"gray"}]

# 成功を返す
return 1
