# ロシアンルーレット処理
# @s = ロシアンルーレットを実行するプレイヤー（liars.phase_loser）

# -- トリガーカウントを増加 ----------------------

# 引き金を引いた回数を増加
scoreboard players add @s liars.trigger 1

# -- ロシアンルーレットの判定 ----------------------

# ルーレット番号とトリガー番号が一致したら発砲
execute if score @s liars.trigger = @s liars.roulette run tag @s add liars.shot

# -- 発砲演出 ----------------------

# 発砲しなかった場合
execute unless entity @s[tag=liars.shot] run tellraw @a [{"text":"カチッ… ","color":"gray","italic":true},{"selector":"@s","color":"yellow"},{"text":" はセーフ！","color":"green"}]
execute unless entity @s[tag=liars.shot] at @s run playsound minecraft:block.dispenser.fail master @a ~ ~ ~ 1 0.8

# 発砲した場合
execute if entity @s[tag=liars.shot] run tellraw @a [{"text":"バーン！！ ","color":"red","bold":true},{"selector":"@s","color":"red"},{"text":" が脱落しました","color":"white"}]
execute if entity @s[tag=liars.shot] at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 1.2
execute if entity @s[tag=liars.shot] at @s run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1

# -- 脱落処理 ----------------------

# スペクテイターモードに変更
execute if entity @s[tag=liars.shot] run gamemode spectator @s

# 生存タグを削除
execute if entity @s[tag=liars.shot] run tag @s remove liars.alive

# 座席から降りる
execute if entity @s[tag=liars.shot] run ride @s dismount

# 発砲タグをクリア
tag @s remove liars.shot
