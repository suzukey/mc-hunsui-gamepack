# フェーズ開始アナウンス
# メインカードと最初のプレイヤーを通知

# フェーズ番号を表示
tellraw @a[tag=liars.participant] [{"text":"\n=== フェーズ ","color":"gold","bold":true},{"score":{"name":"CURRENT_PHASE","objective":"liars.game"},"color":"yellow","bold":true},{"text":" 開始 ===\n","color":"gold","bold":true}]

# メインカードを表示
execute if score DECLARED_CARD liars.game matches 1 run tellraw @a[tag=liars.participant] [{"text":"■ ","color":"gray"},{"text":"今回のテーブルカード: ","color":"white"},{"text":"Queen (Q)","color":"aqua","bold":true}]
execute if score DECLARED_CARD liars.game matches 2 run tellraw @a[tag=liars.participant] [{"text":"■ ","color":"gray"},{"text":"今回のテーブルカード: ","color":"white"},{"text":"King (K)","color":"light_purple","bold":true}]
execute if score DECLARED_CARD liars.game matches 3 run tellraw @a[tag=liars.participant] [{"text":"■ ","color":"gray"},{"text":"今回のテーブルカード: ","color":"white"},{"text":"Ace (A)","color":"red","bold":true}]

# 効果音
playsound minecraft:block.note_block.pling master @a[tag=liars.participant] ~ ~ ~ 1 1.5
