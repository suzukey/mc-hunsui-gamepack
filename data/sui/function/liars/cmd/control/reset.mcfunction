# ゲームリセット処理

# -- リセット処理 ----------------

# ゲーム関連設定のスコアボードをリセット
scoreboard players set GAME_STARTED liars.configs 0
scoreboard players set MAX_PLAYERS liars.configs 0
scoreboard players set MIN_PLAYERS liars.configs 0

# 既存の座席エンティティを削除 (立ち上がることができるようにする)
kill @e[tag=liars.seat]

# 完了メッセージ
tellraw @a [{"text":"■ ","color":"gray"},{"text":"ゲームがリセットされました","color":"green"}]
