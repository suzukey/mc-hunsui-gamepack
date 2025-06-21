# 共通参加処理
# 呼び出し元でゲームタイプを確認してから実行される

# プレイヤーが既に参加しているかチェック
execute if score @s sui.participants matches 1 run tellraw @s ["",{"text":"[システム] ","color":"gray"},{"text":"既にゲームに参加しています","color":"red"}]
execute if score @s sui.participants matches 1 run return 0

# 現在の人数を取得
execute store result score #current_count sui.participants if entity @a[scores={sui.participants=1}]

# 最大人数チェック
execute if score #current_count sui.participants >= MAX_PLAYERS sui.configs run tellraw @s ["",{"text":"[システム] ","color":"gray"},{"text":"ゲームは満員です（最大","color":"red"},{"score":{"name":"MAX_PLAYERS","objective":"sui.constants"},"color":"yellow"},{"text":"人）","color":"red"}]
execute if score #current_count sui.participants >= MAX_PLAYERS sui.configs run return 0

# 参加処理
scoreboard players set @s sui.participants 1

# 人数を更新
scoreboard players add #current_count sui.participants 1

# 開始要件を満たすかチェック
execute store result score #can_start sui.participants if score #current_count sui.participants >= MIN_PLAYERS sui.configs

# 参加メッセージ（開始要件を満たす場合は緑、満たさない場合は黄色）
execute if score #can_start sui.participants matches 1 run tellraw @a ["",{"selector":"@s","color":"green"},{"text":" がゲームに参加しました（","color":"gray"},{"score":{"name":"#current_count","objective":"sui.participants"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"MAX_PLAYERS","objective":"sui.configs"},"color":"green"},{"text":"人）","color":"gray"}]
execute if score #can_start sui.participants matches 0 run tellraw @a ["",{"selector":"@s","color":"green"},{"text":" がゲームに参加しました（","color":"gray"},{"score":{"name":"#current_count","objective":"sui.participants"},"color":"yellow"},{"text":"/","color":"gray"},{"score":{"name":"MAX_PLAYERS","objective":"sui.configs"},"color":"yellow"},{"text":"人）","color":"gray"}]

# 成功を返す
return 1
