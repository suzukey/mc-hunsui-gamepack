# カードプレイ処理

# -- ターンプレイヤーチェック ----------------------

# 現在のターンプレイヤーでない場合は拒否
execute unless entity @s[tag=liars.current_turn] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたのターンではありません","color":"red"}]
execute unless entity @s[tag=liars.current_turn] run return 0

# -- カード選択チェック ----------------------

# 選択したカード数を取得
execute store result score #selected_count liars.game run clear @s carrot_on_a_stick[minecraft:custom_data={liars_selected:1b}] 0

# カードが選択されていない場合
execute if score #selected_count liars.game matches 0 run tellraw @s [{"text":"■ ","color":"gray"},{"text":"カードを選択してください","color":"red"}]
execute if score #selected_count liars.game matches 0 run return 0

# 4枚以上選択されている場合
execute if score #selected_count liars.game matches 4.. run tellraw @s [{"text":"■ ","color":"gray"},{"text":"カードは3枚までしか出せません","color":"red"}]
execute if score #selected_count liars.game matches 4.. run return 0

# -- カード宣言処理 ----------------------

# 宣言されたカード枚数を保存
scoreboard players operation CARDS_DECLARED liars.game = #selected_count liars.game

# メインカードの名称を取得
execute if score DECLARED_CARD liars.game matches 1 run data merge storage liars:temp {card_name:"Queen"}
execute if score DECLARED_CARD liars.game matches 2 run data merge storage liars:temp {card_name:"King"}
execute if score DECLARED_CARD liars.game matches 3 run data merge storage liars:temp {card_name:"Ace"}

# 宣言メッセージ
tellraw @a [{"text":"■ ","color":"gray"},{"selector":"@s","color":"yellow"},{"text":" が ","color":"white"},{"score":{"name":"#selected_count","objective":"liars.game"},"color":"aqua","bold":true},{"text":"枚の","color":"white"},{"nbt":"card_name","storage":"liars:temp","color":"aqua","bold":true},{"text":"をプレイしました","color":"white"}]

# -- カードを場に出す ----------------------

# TODO: カードを保存して後で検証できるようにする

# 選択したカードをクリア
clear @s carrot_on_a_stick[minecraft:custom_data={liars_selected:1b}]

# -- ターン終了 ----------------------

function sui:liars/internal/playing/turn/next
