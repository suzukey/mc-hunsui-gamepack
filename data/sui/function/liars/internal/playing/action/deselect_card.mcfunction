# カードの選択を解除する

# カード名を元に戻す
data modify storage sui:liars/temp deselected_card_name set value '[{"text":""}]'

# カードタイプに応じて元の名前を設定
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"Ace"}}}}] run data modify storage sui:liars/temp deselected_card_name set value '{"text":"Ace","color":"gold","italic":false}'
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"King"}}}}] run data modify storage sui:liars/temp deselected_card_name set value '{"text":"King","color":"gold","italic":false}'
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"Queen"}}}}] run data modify storage sui:liars/temp deselected_card_name set value '{"text":"Queen","color":"gold","italic":false}'
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"Joker"}}}}] run data modify storage sui:liars/temp deselected_card_name set value '{"text":"Joker","color":"light_purple","italic":false}'

# アイテムを修正
item modify entity @s weapon.mainhand sui:liars/card/deselect

# 名前を設定
item modify entity @s weapon.mainhand {function:"minecraft:set_name",name:{type:"minecraft:storage",source:"sui:liars/temp",path:"deselected_card_name",interpret:true}}

# フィードバック
title @s actionbar [{"text":"■ ","color":"gray"},{"text":"カードの選択を解除しました","color":"yellow"}]
