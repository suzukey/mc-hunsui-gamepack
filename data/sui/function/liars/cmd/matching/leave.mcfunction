# 離脱処理

# -- 前提条件チェック --------------- 

# プレイヤーが参加しているかチェック
execute unless entity @s[tag=liars.participant] run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"ゲームに参加していません","color":"red"}]
execute unless entity @s[tag=liars.participant] run return 0

# -- 離脱処理 ---------------

# タグを削除
tag @s remove liars.participant

# 離脱メッセージ
tellraw @a [{text:"■ ",color:"gray"},{"selector":"@s","color":"yellow"},{"text":" がゲームから離脱しました","color":"gray"}]
