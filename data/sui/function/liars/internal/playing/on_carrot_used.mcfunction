# 人参棒使用時の処理

# アイテムの種類に応じて処理を分岐
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{item_type:"card"}}}}] run function sui:liars/internal/playing/action/toggle_card
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{action:"play_cards"}}}}] run function sui:liars/internal/playing/action/play_cards
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{action:"call_lie"}}}}] run function sui:liars/internal/playing/action/call_lie

# 使用回数をリセット
scoreboard players reset @s liars.used_carrot
