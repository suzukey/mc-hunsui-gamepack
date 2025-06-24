# ダウト結果処理
# 前のプレイヤーのカードを検証し、敗者を決定

# -- カード検証 ----------------------

# TODO: 実際のカード検証ロジックを実装
# 現在は仮の実装（50%の確率でダウト成功）
execute store result score #doubt_result liars.game run random value 0..1

# -- 結果処理 ----------------------

# ダウト成功（前のプレイヤーが嘘をついていた）
execute if score #doubt_result liars.game matches 1 run tellraw @a [{"text":"✔ ","color":"green","bold":true},{"text":"ダウト成功！","color":"green","bold":true},{"text":" ","color":"white"},{"selector":"@a[tag=liars.last_player]","color":"red"},{"text":" が嘘をついていました","color":"white"}]
execute if score #doubt_result liars.game matches 1 run tag @a[tag=liars.last_player] add liars.phase_loser

# ダウト失敗（前のプレイヤーは正直だった）
execute if score #doubt_result liars.game matches 0 run tellraw @a [{"text":"✖ ","color":"red","bold":true},{"text":"ダウト失敗…","color":"red","bold":true},{"text":" ","color":"white"},{"selector":"@a[tag=liars.last_player]","color":"green"},{"text":" は正直でした","color":"white"}]
execute if score #doubt_result liars.game matches 0 run tag @s add liars.phase_loser

# -- ロシアンルーレット ----------------------

execute as @a[tag=liars.phase_loser] run function sui:liars/internal/playing/turn/trigger_roulette

# -- フェーズ終了 ----------------------

# フェーズリセット
scoreboard players set TURN_COUNT liars.game 0
tag @a remove liars.current_turn
tag @a remove liars.last_player

# 次のフェーズへ
schedule function sui:liars/internal/playing/phase/start 3s
