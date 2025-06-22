# ゲームリセット処理

# -- リセット処理 ----------------

# ゲーム関連設定のスコアボードをリセット
scoreboard players set GAME_STARTED liars.configs 0
scoreboard players set MAX_PLAYERS liars.configs 0
scoreboard players set MIN_PLAYERS liars.configs 0

# 完了メッセージ
tellraw @a [{"text":"■ ","color":"gray"},{"text":"ゲームがリセットされました","color":"green"}]
