# Liars ゲーム選択
execute as @a[scores={sui.select.liars=1..}] run function sui:game/liars/select
scoreboard players reset @a[scores={sui.select.liars=1..}] sui.select.liars
scoreboard players enable @a sui.select.liars

# PlayOut ゲーム選択
execute as @a[scores={sui.select.playout=1..}] run function sui:game/playout/select
scoreboard players reset @a[scores={sui.select.playout=1..}] sui.select.playout
scoreboard players enable @a sui.select.playout

# ゲーム参加
execute as @a[scores={sui.join=1..}] run function sui:game/_common/player/join
scoreboard players reset @a[scores={sui.join=1..}] sui.join
scoreboard players enable @a sui.join

# ゲーム離脱
execute as @a[scores={sui.leave=1..}] run function sui:game/_common/player/leave
scoreboard players reset @a[scores={sui.leave=1..}] sui.leave
scoreboard players enable @a sui.leave
