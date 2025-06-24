# ダウト宣言処理

# -- ターンプレイヤーチェック ----------------------

# 現在のターンプレイヤーでない場合は拒否
execute unless entity @s[tag=liars.current_turn] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"あなたのターンではありません","color":"red"}]
execute unless entity @s[tag=liars.current_turn] run return 0

# -- ダウト可能チェック ----------------------

# 最初のターンではダウト不可
execute if score TURN_COUNT liars.game matches 1 run tellraw @s [{"text":"■ ","color":"gray"},{"text":"最初のターンではダウトできません","color":"red"}]
execute if score TURN_COUNT liars.game matches 1 run return 0

# 前のプレイヤーが存在しない場合
execute unless entity @a[tag=liars.last_player] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"ダウトする対象がいません","color":"red"}]
execute unless entity @a[tag=liars.last_player] run return 0

# -- ダウト宣言 ----------------------

# ダウト宣言メッセージ
tellraw @a [{"text":"■ ","color":"gray"},{"selector":"@s","color":"red","bold":true},{"text":" がダウトを宣言しました！","color":"white"}]

# 効果音
execute as @a at @s run playsound minecraft:entity.witch.ambient master @s ~ ~ ~ 0.7 0.8

# -- カード検証処理 ----------------------

function sui:liars/internal/playing/turn/resolve_doubt
