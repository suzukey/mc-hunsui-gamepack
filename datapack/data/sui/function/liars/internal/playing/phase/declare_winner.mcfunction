# 勝利者宣言処理

# 勝利者を取得（最後の1人）
execute as @a[tag=liars.alive] run tag @s add liars.winner

# 勝利メッセージを表示
execute as @a[tag=liars.winner] run tellraw @a [{"text":"[Liars] ","color":"gold"},{"selector":"@s"},{"text":"が勝利しました！","color":"yellow"}]

# 勝利エフェクト
execute as @a[tag=liars.winner] at @s run particle minecraft:totem_of_undying ~ ~1 ~ 1 1 1 0.1 100
execute as @a[tag=liars.winner] at @s run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# タグをクリア
tag @a remove liars.winner

# ゲームをリセット
function sui:liars/cmd/control/reset
