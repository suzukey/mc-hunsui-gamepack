# 次のプレイヤーを探す処理
# 最大4回まで探索して無限ループを防ぐ

# 探索カウンタを初期化（初回呼び出し時のみ）
execute unless score #search_count liars.game matches 0.. run scoreboard players set #search_count liars.game 0

# 探索回数が4回を超えたら中止
execute if score #search_count liars.game matches 4.. run tellraw @a [{"text":"■ ","color":"gray"},{"text":"エラー: 次のプレイヤーが見つかりません","color":"red"}]
execute if score #search_count liars.game matches 4.. run return 0

# 現在のターン番号のプレイヤーを探す
execute as @a[tag=liars.alive] if score @s liars.seat = current_turn liars.game run tag @s add liars.current_turn

# プレイヤーが見つかった場合
execute if entity @a[tag=liars.current_turn] run function sui:liars/internal/playing/turn/activate_turn
execute if entity @a[tag=liars.current_turn] run scoreboard players reset #search_count liars.game
execute if entity @a[tag=liars.current_turn] run return 1

# プレイヤーが見つからなかった場合、次の座席番号へ
scoreboard players add current_turn liars.game 1

# 座席番号が4以上になったら0に戻す
execute if score current_turn liars.game matches 4.. run scoreboard players set current_turn liars.game 0

# 探索カウンタを増やして再帰的に呼び出し
scoreboard players add #search_count liars.game 1
function sui:liars/internal/playing/turn/find_next_player