# アイテムを与える
loot give @s loot sui:liars/items/play_cards_button
loot give @s loot sui:liars/items/call_lie_button
loot give @s loot sui:liars/items/roulette_gun

# アイテムの配置変更
data modify entity @s hotbar.6 set from entity @s Inventory[{Slot:0b}]
data modify entity @s hotbar.7 set from entity @s Inventory[{Slot:1b}]
data modify entity @s hotbar.8 set from entity @s Inventory[{Slot:2b}]
