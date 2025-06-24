# ターン開始処理
# フェーズ開始時またはターン終了後に呼ばれる

# -- 現在のターンプレイヤーを設定 ----------------------

# 最初のフェーズで最初のターンの場合
execute if score TURN_COUNT liars.game matches 0 run tag @a remove liars.current_turn
execute if score TURN_COUNT liars.game matches 0 if score CURRENT_PHASE liars.game matches 1 run tag @a[tag=liars.alive,scores={liars.seat=1},limit=1] add liars.current_turn
execute if score TURN_COUNT liars.game matches 0 if score CURRENT_PHASE liars.game matches 1 unless entity @a[tag=liars.current_turn] run tag @a[tag=liars.alive,scores={liars.seat=2},limit=1] add liars.current_turn
execute if score TURN_COUNT liars.game matches 0 if score CURRENT_PHASE liars.game matches 1 unless entity @a[tag=liars.current_turn] run tag @a[tag=liars.alive,scores={liars.seat=3},limit=1] add liars.current_turn
execute if score TURN_COUNT liars.game matches 0 if score CURRENT_PHASE liars.game matches 1 unless entity @a[tag=liars.current_turn] run tag @a[tag=liars.alive,scores={liars.seat=4},limit=1] add liars.current_turn

# フェーズ2以降の場合、敗者から開始
execute if score TURN_COUNT liars.game matches 0 if score CURRENT_PHASE liars.game matches 2.. if entity @a[tag=liars.phase_loser,tag=liars.alive] run tag @a[tag=liars.phase_loser,tag=liars.alive,limit=1] add liars.current_turn

# 敗者が脱落している場合は最初の生存者を選択
execute if score TURN_COUNT liars.game matches 0 if score CURRENT_PHASE liars.game matches 2.. unless entity @a[tag=liars.current_turn] run tag @a[tag=liars.alive,limit=1,sort=random] add liars.current_turn

# フェーズ敗者タグをクリア
execute if score TURN_COUNT liars.game matches 0 run tag @a remove liars.phase_loser

# 2ターン目以降の場合、最もシンプルな方法で次のプレイヤーを設定
execute if score TURN_COUNT liars.game matches 1.. as @a[tag=liars.current_turn] store result score #current_seat liars.game run scoreboard players get @s liars.seat
execute if score TURN_COUNT liars.game matches 1.. run tag @a remove liars.current_turn

# 現在の座席より大きい番号で最小の生存者を探す
execute if score TURN_COUNT liars.game matches 1.. as @a[tag=liars.alive] if score @s liars.seat > #current_seat liars.game run tag @s add liars.candidate
execute if score TURN_COUNT liars.game matches 1.. run tag @a[tag=liars.candidate,limit=1,sort=arbitrary] add liars.current_turn
execute if score TURN_COUNT liars.game matches 1.. run tag @a remove liars.candidate

# 見つからなかった場合（最後の座席だった場合）、最小の座席番号の生存者を選択
execute if score TURN_COUNT liars.game matches 1.. unless entity @a[tag=liars.current_turn] run tag @a[tag=liars.alive,limit=1,sort=arbitrary] add liars.current_turn

# ターン数を増加
scoreboard players add TURN_COUNT liars.game 1

# -- ターン状態の初期化 ----------------------

# ターン状態をアクション選択中に設定
scoreboard players set TURN_STATE liars.game 1

# -- ターン開始メッセージ ----------------------

execute as @a[tag=liars.current_turn] run tellraw @a [{"text":"■ ","color":"gray"},{"selector":"@s","color":"green"},{"text":" のターン","color":"white"}]

# ダウトオプションの表示（2ターン目以降）
execute if score TURN_COUNT liars.game matches 2.. as @a[tag=liars.current_turn] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"アクション: ","color":"white"},{"text":"カードをプレイ","color":"green"},{"text":" または ","color":"white"},{"text":"ダウト","color":"red"}]

# 効果音
execute as @a[tag=liars.current_turn] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 1.2
