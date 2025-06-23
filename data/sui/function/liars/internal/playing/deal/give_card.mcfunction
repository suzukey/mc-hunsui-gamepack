
# カード種類ごとに loot give
execute if score #cardIdx liars.cardIdx matches 0..5 run loot give @s loot sui:liars/deck/queen_card
execute if score #cardIdx liars.cardIdx matches 6..11 run loot give @s loot sui:liars/deck/king_card
execute if score #cardIdx liars.cardIdx matches 12..17 run loot give @s loot sui:liars/deck/ace_card
execute if score #cardIdx liars.cardIdx matches 18..19 run loot give @s loot sui:liars/deck/joker_card

# 各ユーザーの手札枚数と山札のindexをインクリメント
scoreboard players add @s liars.number_of_cards 1
scoreboard players add #deck liars.number_of_cards 1
