# ゲームリセット処理

# -- リセット処理 ----------------

# 参加者のスコアボードのリセット
scoreboard objectives remove liars.participants
scoreboard objectives add liars.participants dummy "参加者"
scoreboard objectives setdisplay sidebar liars.participants

# ゲーム関連設定の値をリセット
scoreboard players set GAME_STARTED liars.configs 0

# 既存の座席エンティティを削除 (立ち上がることができるようにする)
kill @e[tag=liars.seat]

# 完了メッセージ
tellraw @a [{"text":"■ ","color":"gray"},{"text":"ゲームがリセットされました","color":"green"}]
