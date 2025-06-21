# Liars ゲーム選択
execute as @a[scores={sui.select.liars=1..}] run function sui:game/liars/select
scoreboard players reset @a[scores={sui.select.liars=1..}] sui.select.liars
scoreboard players enable @a sui.select.liars

# PlayOut ゲーム選択
execute as @a[scores={sui.select.playout=1..}] run function sui:game/playout/select
scoreboard players reset @a[scores={sui.select.playout=1..}] sui.select.playout
scoreboard players enable @a sui.select.playout

# ゲーム参加
execute as @a[scores={sui.join=1..}] run function sui:game/_common/matching/join
scoreboard players reset @a[scores={sui.join=1..}] sui.join
scoreboard players enable @a sui.join

# ゲーム離脱
execute as @a[scores={sui.leave=1..}] run function sui:game/_common/matching/leave
scoreboard players reset @a[scores={sui.leave=1..}] sui.leave
scoreboard players enable @a sui.leave

# ゲーム開始
execute as @a[scores={sui.start=1..}] run function sui:game/_common/control/start
scoreboard players reset @a[scores={sui.start=1..}] sui.start
scoreboard players enable @a sui.start

# ゲームリセット
execute as @a[scores={sui.reset=1..}] run function sui:game/_common/control/reset
scoreboard players reset @a[scores={sui.reset=1..}] sui.reset
scoreboard players enable @a sui.reset
