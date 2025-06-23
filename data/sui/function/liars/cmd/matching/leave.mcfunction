# 離脱処理

# -- 前提条件チェック --------------- 

# プレイヤーが参加しているかチェック（スコアがない場合も含む）
execute unless score @s liars.participants matches 1 run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"ゲームに参加していません","color":"red"}]
execute unless score @s liars.participants matches 1 run return 0

# -- 離脱処理 ---------------

# スコアボードから削除
scoreboard players reset @s liars.participants

# 離脱メッセージ
tellraw @a [{text:"■ ",color:"gray"},{"selector":"@s","color":"yellow"},{"text":" がゲームから離脱しました","color":"gray"}]
