# カードのトグル処理

# 選択済みタグの有無でトグル
execute if entity @s[nbt={SelectedItem:{components:{"minecraft:custom_data":{selected:1b}}}}] run tag @s add toggling_off
execute unless entity @s[tag=toggling_off] run tag @s add toggling_on

# トグルON処理（選択状態にする）
execute if entity @s[tag=toggling_on] run function sui:liars/internal/playing/action/select_card

# トグルOFF処理（選択解除）  
execute if entity @s[tag=toggling_off] run function sui:liars/internal/playing/action/deselect_card

# タグをクリア
tag @s remove toggling_on
tag @s remove toggling_off

# 選択数スコアボード値の更新
execute store result score @s liars.selected_count run clear @s carrot_on_a_stick[custom_data~{selected:1b}] 0

# サウンド再生
execute at @s run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1.2
