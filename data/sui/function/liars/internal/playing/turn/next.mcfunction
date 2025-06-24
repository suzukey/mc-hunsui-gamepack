# ターン終了処理
# プレイヤーがアクションを完了した後に呼ばれる

# -- タグの更新 ----------------------

# 前のプレイヤータグを更新
tag @a remove liars.last_player
tag @a[tag=liars.current_turn] add liars.last_player

# 現在のプレイヤータグをクリア
tag @a remove liars.current_turn

# -- ターン状態のリセット ----------------------

scoreboard players set TURN_STATE liars.game 0

# -- 次のターンを開始 ----------------------

function sui:liars/internal/playing/turn/start
