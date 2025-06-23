# カード種類ごとに loot give
execute if score #deck_distributed liars.number_of_cards matches 0..5 run loot give @s loot sui:liars/deck/queen_card
execute if score #deck_distributed liars.number_of_cards matches 6..11 run loot give @s loot sui:liars/deck/king_card
execute if score #deck_distributed liars.number_of_cards matches 12..17 run loot give @s loot sui:liars/deck/ace_card
execute if score #deck_distributed liars.number_of_cards matches 18..19 run loot give @s loot sui:liars/deck/joker_card

# 各ユーザーの手札枚数と山札のindexをインクリメント
scoreboard players add @s liars.number_of_cards 1
scoreboard players add #deck_distributed liars.number_of_cards 1
