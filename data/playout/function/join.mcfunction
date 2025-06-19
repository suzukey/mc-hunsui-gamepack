# ゲームに参加

# 既に参加しているかチェック
execute if score @s playout.participants matches 1.. run tellraw @s {"text":"すでに参加しています！","color":"yellow"}
execute if score @s playout.participants matches 1.. run return fail

# サイドバーに表示（値は1で統一）
scoreboard players set @s playout.participants 1

# 参加人数を計算
execute store result score #player_count playout.participants if entity @a[scores={playout.participants=1..}]

# 参加メッセージ
tellraw @a ["",{"selector":"@s"},{"text":" がゲームに参加しました！ (","color":"green"},{"score":{"name":"#player_count","objective":"playout.participants"}},{"text":"人目)","color":"green"}]

# サウンドエフェクト
execute at @s run playsound entity.player.levelup player @s ~ ~ ~ 0.5 1
