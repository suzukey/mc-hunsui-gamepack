# PlayOutを選択した時の処理

# 参加者スコアボードをリセット
scoreboard objectives remove sui.participants
scoreboard objectives add sui.participants dummy "参加者リスト"
scoreboard players set #current_count sui.participants 0

# スコアボードの設定値を更新
scoreboard players operation GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants
scoreboard players operation MAX_PLAYERS sui.configs = PLAYOUT_MAX_PLAYERS sui.constants
scoreboard players operation MIN_PLAYERS sui.configs = PLAYOUT_MIN_PLAYERS sui.constants

# サイドバー
scoreboard objectives setdisplay sidebar sui.participants

# 参加者リストのタイトルを更新
function sui:game/_common/player/update_title

# メッセージ (選択通知 + 参加案内)
tellraw @a [{"text":"[SUI_GAMEPACK] ","color":"gold"},{"text":"PlayOut","color":"light_purple"},{"text":" が選択されました ","color":"white"}]
