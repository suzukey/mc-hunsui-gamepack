# -- 終了条件 -----------------

# 1) 山札が尽きたら終了
execute if score #deck_distributed liars.number_of_cards matches 20.. run return 0

# 2) 配布対象プレイヤーがいなくなったら終了
execute unless entity @a[scores={liars.seat=1..4,liars.number_of_cards=..4}] run return 0

# -- 配布処理 ------------

# 配布対象プレイヤーをランダムに選択
execute as @a[scores={liars.seat=1..4,liars.number_of_cards=..4},sort=random,limit=1] at @s run function sui:liars/internal/playing/deal/give_card

# 再帰
function sui:liars/internal/playing/deal/deal_one
