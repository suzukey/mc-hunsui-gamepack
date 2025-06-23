# カードの選択を解除する

# 選択マークを外して名前を元に戻す
item modify entity @s weapon.mainhand sui:liars/card/mark_deselected

# Jokerの場合はさらに色を修正
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{card_name:"Joker"}}}}] run item modify entity @s weapon.mainhand sui:liars/card/restore_joker_name

# フィードバック
title @s actionbar [{"text":"■ ","color":"gray"},{"text":"カードの選択を解除しました","color":"yellow"}]
