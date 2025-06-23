# プレイフェーズ開始処理

# -- カード配布処理 ----------------------

function sui:liars/internal/playing/deal/deal_all

# -- フェーズをインクリメント ----------------------

scoreboard players add CURRENT_PHASE liars.game 1
