# 共通離脱処理

# プレイヤーが参加していないかチェック（スコアがない場合も含む）
execute unless score @s sui.participants matches 1 run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"ゲームに参加していません","color":"red"}]
execute unless score @s sui.participants matches 1 run return 0

# 離脱処理
scoreboard players reset @s sui.participants

# 離脱メッセージ
tellraw @a ["",{"selector":"@s","color":"yellow"},{"text":" がゲームから離脱しました","color":"gray"}]
