# 各プレイヤーを対応する座席に着席させる
execute as @a[tag=liars.alive,scores={liars.seat=1}] run ride @s mount @e[tag=liars.seat.1,limit=1]
execute as @a[tag=liars.alive,scores={liars.seat=2}] run ride @s mount @e[tag=liars.seat.2,limit=1]
execute as @a[tag=liars.alive,scores={liars.seat=3}] run ride @s mount @e[tag=liars.seat.3,limit=1]
execute as @a[tag=liars.alive,scores={liars.seat=4}] run ride @s mount @e[tag=liars.seat.4,limit=1]
