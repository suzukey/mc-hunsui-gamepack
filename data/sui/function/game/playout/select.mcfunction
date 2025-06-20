# PlayOutを選択した時の処理

# スコアボードをリセット
scoreboard objectives remove sui.participants
scoreboard objectives add sui.participants dummy "参加者リスト"

# スコアボードの設定値を更新
scoreboard players operation GAME_TYPE sui.config = GAME_TYPE_PLAYOUT sui.constants
scoreboard players operation MAX_PLAYERS sui.config = PLAYOUT_MAX_PLAYERS sui.constants
scoreboard players operation MIN_PLAYERS sui.config = PLAYOUT_MIN_PLAYERS sui.constants

# サイドバー
scoreboard objectives setdisplay sidebar sui.participants
scoreboard objectives modify sui.participants displayname {"text":"PlayOut 参加者リスト","color":"light_purple","bold":true}

# メッセージ (選択通知 + 参加案内)
tellraw @a [{"text":"[SUI_GAMEPACK] ","color":"gold"},{"text":"PlayOut","color":"light_purple"},{"text":" が選択されました ","color":"white"}]
