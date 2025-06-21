# ゲームリセット処理

# 既にゲームが開始されている場合は何もしない
execute if score GAME_STARTED sui.configs matches 1 run return 0

# 選択されているゲームタイプに応じて対応するリセット処理を呼び出す

# Liars ゲームのリセット
execute if score GAME_TYPE sui.configs = GAME_TYPE_LIARS sui.constants run function sui:game/liars/control/reset

# PlayOut ゲームのリセット
execute if score GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants run function sui:game/playout/control/reset

# ゲームが選択されていない場合の警告
execute if score GAME_TYPE sui.configs = GAME_TYPE_NONE sui.constants run tellraw @s {"text":"ゲームが選択されていません","color":"red"}
