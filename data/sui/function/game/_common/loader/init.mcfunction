# ゲーム初期化スクリプト

# -- ゲーム設定保持 ----------------------

# ゲーム設定用スコアボードの作成
scoreboard objectives add sui.configs dummy "ゲーム基本設定"
scoreboard players operation GAME_TYPE sui.configs = GAME_TYPE_NONE sui.constants
scoreboard players set MAX_PLAYERS sui.configs 0
scoreboard players set MIN_PLAYERS sui.configs 0

# -- 定数管理 ----------------------

# 定数用スコアボードの作成
scoreboard objectives remove sui.constants
scoreboard objectives add sui.constants dummy "ゲーム定数"

# ゲームタイプ定数
scoreboard players set GAME_TYPE_NONE sui.constants 0
scoreboard players set GAME_TYPE_LIARS sui.constants 1
scoreboard players set GAME_TYPE_PLAYOUT sui.constants 2

# Liarsゲームの設定
scoreboard players set LIARS_MIN_PLAYERS sui.constants 2
scoreboard players set LIARS_MAX_PLAYERS sui.constants 4

# PlayOutゲームの設定
scoreboard players set PLAYOUT_MIN_PLAYERS sui.constants 2
scoreboard players set PLAYOUT_MAX_PLAYERS sui.constants 8

# -- 参加者管理 ----------------------

scoreboard objectives add sui.participants dummy "参加者"
scoreboard objectives setdisplay sidebar sui.participants

scoreboard objectives add sui.score dummy "ゲームスコア"
scoreboard objectives setdisplay list sui.score

# -- ゲームごとの初期化 ----------------------

function sui:game/liars/loader/init
function sui:game/playout/loader/init

# -- Trigger システムの初期化 ----------------------

function sui:trigger/init

# -- 完了メッセージ ----------------------
tellraw @a [{"text":"[SUI_GAMEPACK] ","color":"gold"},{"text":"ロードされました","color":"green"}]
