# カードのトグル処理

# 選択済みタグの有無でトグル
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{selected:1b}}}}] run tag @s add toggling_off
execute unless entity @s[tag=toggling_off] run tag @s add toggling_on

# 選択数をチェック（3枚まで許可）
execute if entity @s[tag=toggling_on] if score @s liars.selected_count matches 3.. run tag @s add selection_limit_reached
execute if entity @s[tag=selection_limit_reached] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"最大3枚までしか選択できません","color":"red"}]
execute if entity @s[tag=selection_limit_reached] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 0.5 1.0
execute if entity @s[tag=selection_limit_reached] run tag @s remove toggling_on

# トグルON処理（選択状態にする）
execute if entity @s[tag=toggling_on] run function sui:liars/internal/playing/action/select_card

# トグルOFF処理（選択解除）  
execute if entity @s[tag=toggling_off] run function sui:liars/internal/playing/action/deselect_card

# 選択数スコアボード値の更新
execute store result score @s liars.selected_count run clear @s carrot_on_a_stick[custom_data~{selected:1b}] 0

# サウンド再生（制限に達していない場合のみ）
execute unless entity @s[tag=selection_limit_reached] at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1.2

# タグをクリア
tag @s remove toggling_on
tag @s remove toggling_off
tag @s remove selection_limit_reached
