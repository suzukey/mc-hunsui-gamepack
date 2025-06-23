# カードを選択状態にする

# カード名を取得してストレージに保存
data modify storage sui:liars/temp selected_card_name set value '[{"text":""}]'

# カードタイプに応じて名前を設定
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"Ace"}}}}] run data modify storage sui:liars/temp selected_card_name set value '[{"text":"Ace","color":"gold","italic":false},{"text":" (選択中)","color":"yellow","italic":false}]'
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"King"}}}}] run data modify storage sui:liars/temp selected_card_name set value '[{"text":"King","color":"gold","italic":false},{"text":" (選択中)","color":"yellow","italic":false}]'
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"Queen"}}}}] run data modify storage sui:liars/temp selected_card_name set value '[{"text":"Queen","color":"gold","italic":false},{"text":" (選択中)","color":"yellow","italic":false}]'
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"Joker"}}}}] run data modify storage sui:liars/temp selected_card_name set value '[{"text":"Joker","color":"light_purple","italic":false},{"text":" (選択中)","color":"yellow","italic":false}]'

# アイテムを修正
item modify entity @s weapon.mainhand sui:liars/card/select

# 名前を設定
item modify entity @s weapon.mainhand {function:"minecraft:set_name",name:{type:"minecraft:storage",source:"sui:liars/temp",path:"selected_card_name",interpret:true}}

# フィードバック
title @s actionbar [{"text":"■ ","color":"gray"},{"text":"カードを選択しました","color":"green"}]
