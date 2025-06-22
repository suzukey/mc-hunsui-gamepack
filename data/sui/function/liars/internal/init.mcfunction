# ゲーム初期化スクリプト

# -- ゲーム設定保持 ----------------------

# ゲーム設定用スコアボードの作成
scoreboard objectives add liars.configs dummy "ゲーム基本設定"
scoreboard players set GAME_STARTED liars.configs 0
scoreboard players set MIN_PLAYERS liars.configs 2
scoreboard players set MAX_PLAYERS liars.configs 4

# -- 参加者管理 ----------------------

scoreboard objectives add liars.participants dummy "参加者"
scoreboard objectives setdisplay sidebar liars.participants

scoreboard objectives add liars.score dummy "ゲームスコア"
scoreboard objectives setdisplay list liars.score

# -- Trigger システムの初期化 ----------------------

function sui:liars/trigger/init

# -- 完了メッセージ ----------------------

tellraw @a [{"text":"■ ","color":"gray"},{"text":"ロードされました","color":"green"}]
