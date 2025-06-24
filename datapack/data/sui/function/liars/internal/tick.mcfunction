# tick処理スクリプト

# -- 共通のtick処理 ----------------------

# pass

# -- ゲーム開始前のtick処理 ----------------------

execute if score PLAYING liars.game matches 0 run function sui:liars/internal/matching/tick

# -- ゲームごとのtick処理 ----------------------

execute if score PLAYING liars.game matches 1 run function sui:liars/internal/playing/tick

# -- Trigger システムのtick処理 ----------------------

function sui:liars/trigger/tick
