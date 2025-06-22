# ゲーム参加
execute as @a[scores={liars.join=1..}] run function sui:liars/cmd/matching/join
scoreboard players reset @a[scores={liars.join=1..}] liars.join
scoreboard players enable @a liars.join

# ゲーム離脱
execute as @a[scores={liars.leave=1..}] run function sui:liars/cmd/matching/leave
scoreboard players reset @a[scores={liars.leave=1..}] liars.leave
scoreboard players enable @a liars.leave

# ゲーム開始
execute as @a[scores={liars.start=1..}] run function sui:liars/cmd/control/start
scoreboard players reset @a[scores={liars.start=1..}] liars.start
scoreboard players enable @a liars.start

# ゲームリセット
execute as @a[scores={liars.reset=1..}] run function sui:liars/cmd/control/reset
scoreboard players reset @a[scores={liars.reset=1..}] liars.reset
scoreboard players enable @a liars.reset
