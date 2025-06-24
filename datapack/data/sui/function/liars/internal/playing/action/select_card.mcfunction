# カードを選択状態にする

# 選択マークの付与
item modify entity @s weapon.mainhand sui:liars/card/mark_selected

# Jokerの場合はさらに色を修正
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"Joker"}}}}] run item modify entity @s weapon.mainhand sui:liars/card/restore_joker_name

# 完了テキスト
tellraw @s [{"text":"■ ","color":"gray"},{"text":"カードを選択しました","color":"green"}]
