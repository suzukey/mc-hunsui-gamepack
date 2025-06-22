# PlayOutを選択した時の処理

# 既に選択されているかチェック
execute if score GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"PlayOut は既に選択されています","color":"red"}]
execute if score GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants run return 0

# 設定値スコアボードを更新
scoreboard players operation GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants
scoreboard players operation MAX_PLAYERS sui.configs = PLAYOUT_MAX_PLAYERS sui.constants
scoreboard players operation MIN_PLAYERS sui.configs = PLAYOUT_MIN_PLAYERS sui.constants

# 共通準備処理
function sui:game/_common/control/on_game_changed
function sui:game/_common/matching/update_score_title

# メッセージ (選択通知 + 参加案内)
tellraw @a [{"text":"■ ","color":"gray"},{"text":"PlayOut","color":"light_purple"},{"text":" が選択されました ","color":"white"}]
