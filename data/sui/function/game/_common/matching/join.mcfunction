# 共通参加処理
# 呼び出し元でゲームタイプを確認してから実行される

# プレイヤーが既に参加しているかチェック
execute if score @s sui.participants matches 1 run tellraw @s ["",{"text":"■","color":"gray"},{"text":"既にゲームに参加しています","color":"red"}]
execute if score @s sui.participants matches 1 run return 0

# 現在の人数を取得
execute store result score #current_count sui.participants if entity @a[scores={sui.participants=1}]

# 最大人数チェック
execute if score #current_count sui.participants >= MAX_PLAYERS sui.configs run tellraw @s ["",{"text":"■","color":"gray"},{"text":"ゲームは満員です","color":"red"}]
execute if score #current_count sui.participants >= MAX_PLAYERS sui.configs run return 0

# 参加処理
scoreboard players set @s sui.participants 1

# 人数を更新
scoreboard players add #current_count sui.participants 1

# 参加メッセージ
tellraw @a ["",{"selector":"@s","color":"green"},{"text":" がゲームに参加しました","color":"gray"}]

# 参加者リストのタイトルを更新
function sui:game/_common/matching/update_score_title
