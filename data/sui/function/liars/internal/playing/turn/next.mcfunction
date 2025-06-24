# ターン終了処理（次のプレイヤーへ）
# function sui:liars/next_turn で呼び出される

# -- 次のプレイヤーを探す ----------------------

# 前のプレイヤータグを更新
tag @a remove liars.last_player
tag @a[tag=liars.current_turn] add liars.last_player

# 現在のプレイヤータグをクリア
tag @a remove liars.current_turn

# ターン状態をリセット
scoreboard players set TURN_STATE liars.game 0

# 次の座席番号へ
scoreboard players add current_turn liars.game 1
execute if score current_turn liars.game matches 4.. run scoreboard players set current_turn liars.game 0

# 次のプレイヤーを探す
scoreboard players reset #search_count liars.game
function sui:liars/internal/playing/turn/find_next_player
