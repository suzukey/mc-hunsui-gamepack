# tick処理スクリプト

# -- 共通のtick処理 ----------------------

function sui:game/_common/control/matching/show_game_title

# -- ゲームごとのtick処理 ----------------------

execute if score GAME_TYPE sui.configs = GAME_TYPE_LIARS sui.constants run function sui:game/liars/loader/tick
execute if score GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants run function sui:game/playout/loader/tick

# -- Trigger システムのtick処理 ----------------------

function sui:trigger/tick
