# 共通参加処理
# 呼び出し元でゲームタイプを確認してから実行される

# -- 条件チェック ---------------

# 既に参加しているかチェック
execute if score @s liars.participants matches 1 run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"既にゲームに参加しています","color":"red"}]
execute if score @s liars.participants matches 1 run return 0

# 最大人数チェック
execute if score #current_count liars.participants >= MAX_PLAYERS liars.configs run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"ゲームは満員です","color":"red"}]
execute if score #current_count liars.participants >= MAX_PLAYERS liars.configs run return 0

# -- 参加処理 ---------------

# スコアボードに登録
scoreboard players set @s liars.participants 1

# 参加メッセージ
tellraw @a ["",{"selector":"@s","color":"green"},{"text":" がゲームに参加しました","color":"gray"}]
