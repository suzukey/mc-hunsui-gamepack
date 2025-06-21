# ゲーム開始処理

# 既にゲームが開始されている場合は何もしない
execute if score GAME_STARTED sui.configs matches 1 run return 0

# 人数が要件を満たしていない場合は何もしない
execute if score PLAYER_COUNT sui.configs < MIN_PLAYER_COUNT sui.constants run tellraw @s {"text":"プレイヤー数が足りません","color":"red"}
execute if score PLAYER_COUNT sui.configs < MIN_PLAYER_COUNT sui.constants run return 0

# 選択されているゲームタイプに応じて対応する開始処理を呼び出す

# Liars ゲームの開始
execute if score GAME_TYPE sui.configs = GAME_TYPE_LIARS sui.constants run function sui:game/liars/control/start

# PlayOut ゲームの開始
execute if score GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants run function sui:game/playout/control/start

# ゲームが選択されていない場合の警告
execute if score GAME_TYPE sui.configs = GAME_TYPE_NONE sui.constants run tellraw @s {"text":"ゲームが選択されていません","color":"red"}
