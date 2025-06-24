# 共通参加処理
# 呼び出し元でゲームタイプを確認してから実行される

# -- 条件チェック ---------------

# ゲームが始まっているかチェック
execute if score PLAYING liars.game matches 1 run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"ゲームは既に開始されています","color":"red"}]
execute if score PLAYING liars.game matches 1 run return 0

# 既に参加しているかチェック
execute if entity @s[tag=liars.participant] run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"既にゲームに参加しています","color":"red"}]
execute if entity @s[tag=liars.participant] run return 0

# 現在の参加者数を取得
execute store result score #current_count liars.participants if entity @a[tag=liars.participant]

# 最大人数チェック
execute if score #current_count liars.participants >= MAX_PLAYERS liars.const run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"ゲームは満員です","color":"red"}]
execute if score #current_count liars.participants >= MAX_PLAYERS liars.const run return 0

# -- 参加処理 ---------------

# タグを追加
tag @s add liars.participant

# 参加メッセージ
tellraw @a [{text:"■ ",color:"gray"},{"selector":"@s","color":"green"},{"text":" がゲームに参加しました","color":"gray"}]
