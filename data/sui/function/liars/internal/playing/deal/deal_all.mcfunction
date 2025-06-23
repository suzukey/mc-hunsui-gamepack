# -- 配布処理初期化 ----------

tellraw @a [{"text":"■ ","color":"gray"},{"text":"カードを配布します","color":"green"}]

# 全プレイヤーの手札をリセット
clear @a carrot_on_a_stick 0

# スコアボードの値をリセット
scoreboard players set #deck_distributed liars.number_of_cards 0
scoreboard players set @a[scores={liars.seat=1..4}] liars.number_of_cards 0

# 再帰関数を呼び出し
function sui:liars/internal/playing/deal/deal_one
