# デバッグ用：人参棒使用時のログ

tellraw @s [{"text":"[DEBUG] ","color":"red"},{"text":"人参棒が使用されました","color":"white"}]

# 持っているアイテムの情報を表示
tellraw @s [{"text":"[DEBUG] ","color":"red"},{"text":"アイテム: ","color":"gray"},{"nbt":"SelectedItem.id","entity":"@s"}]

# カスタムデータがあるか確認
execute if data entity @s SelectedItem.components."minecraft:custom_data" run tellraw @s [{"text":"[DEBUG] ","color":"red"},{"text":"custom_data: ","color":"gray"},{"nbt":"SelectedItem.components.\"minecraft:custom_data\"","entity":"@s"}]
execute unless data entity @s SelectedItem.components."minecraft:custom_data" run tellraw @s [{"text":"[DEBUG] ","color":"red"},{"text":"custom_dataなし","color":"yellow"}]
