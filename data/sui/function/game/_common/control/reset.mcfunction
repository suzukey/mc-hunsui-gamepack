# ゲームリセット処理

# -- ゲームごとのリセット処理 ----------------

# Liars ゲームのリセット
execute if score GAME_TYPE sui.configs = GAME_TYPE_LIARS sui.constants run function sui:game/liars/control/reset

# PlayOut ゲームのリセット
execute if score GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants run function sui:game/playout/control/reset

# -- 共通のリセット処理 ----------------

# ゲーム関連設定のスコアボードをリセット
scoreboard players set GAME_STARTED sui.configs 0
scoreboard players operation GAME_TYPE sui.configs = GAME_TYPE_NONE sui.constants
scoreboard players set MAX_PLAYERS sui.configs 0
scoreboard players set MIN_PLAYERS sui.configs 0

# 参加者リストのクリア
scoreboard objectives remove sui.participants
scoreboard objectives add sui.participants dummy "参加者"
scoreboard objectives setdisplay sidebar sui.participants
function sui:game/_common/matching/update_score_title

# 完了メッセージ
tellraw @a [{"text":"[SUI_GAMEPACK] ","color":"gold"},{"text":"ゲームがリセットされました","color":"green"}]
