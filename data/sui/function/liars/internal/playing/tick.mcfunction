# プレイヤーが座席から降りられないようにする
function sui:liars/internal/playing/seat/ride_seats

# 人参棒クリック検知（スコアボード方式）
execute as @a[scores={liars.used_carrot_stick=1..}] at @s run function sui:liars/internal/playing/on_carrot_stick_used
