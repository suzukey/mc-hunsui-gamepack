# Liarsを選択した時の処理

# 既に選択されているかチェック
execute if score GAME_TYPE sui.configs = GAME_TYPE_LIARS sui.constants run tellraw @s ["",{"text":"■ ","color":"gray"},{"text":"Liars は既に選択されています","color":"red"}]
execute if score GAME_TYPE sui.configs = GAME_TYPE_LIARS sui.constants run return 0

# 設定値スコアボードを更新
scoreboard players operation GAME_TYPE sui.configs = GAME_TYPE_LIARS sui.constants
scoreboard players operation MAX_PLAYERS sui.configs = LIARS_MAX_PLAYERS sui.constants
scoreboard players operation MIN_PLAYERS sui.configs = LIARS_MIN_PLAYERS sui.constants

# 共通準備処理
function sui:game/_common/control/on_game_changed
function sui:game/_common/matching/update_score_title

# メッセージ (選択通知 + 参加案内)
tellraw @a [{"text":"■ ","color":"gray"},{"text":"Liars","color":"aqua"},{"text":" が選択されました ","color":"white"}]
