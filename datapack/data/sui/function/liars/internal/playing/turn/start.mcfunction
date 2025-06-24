# ターン開始処理
# フェーズ開始時に一度だけ呼ばれる

# ターンカウンタをリセット
scoreboard players set TURN_COUNT liars.game 0

# 全員の current_turn タグをクリア
tag @a remove liars.current_turn

# 開始プレイヤーの決定
# フェーズ1: 座席0から開始
execute if score CURRENT_PHASE liars.game matches 1 run scoreboard players set current_turn liars.game 0

# フェーズ2以降: 前フェーズの敗者から開始（敗者がいない/脱落している場合は座席0）
execute if score CURRENT_PHASE liars.game matches 2.. if entity @a[tag=liars.phase_loser,tag=liars.alive] as @a[tag=liars.phase_loser,tag=liars.alive] store result score current_turn liars.game run scoreboard players get @s liars.seat
execute if score CURRENT_PHASE liars.game matches 2.. unless entity @a[tag=liars.phase_loser,tag=liars.alive] run scoreboard players set current_turn liars.game 0

# フェーズ敗者タグをクリア
tag @a remove liars.phase_loser

# 最初のプレイヤーを探す
function sui:liars/internal/playing/turn/find_next_player

# -- ターン状態の初期化 ----------------------

# ターン状態をアクション選択中に設定
scoreboard players set TURN_STATE liars.game 1

# -- ターン開始メッセージ ----------------------

execute as @a[tag=liars.current_turn] run tellraw @a [{"text":"■ ","color":"gray"},{"selector":"@s","color":"green"},{"text":" のターン","color":"white"}]

# ダウトオプションの表示（2ターン目以降）
execute if score TURN_COUNT liars.game matches 2.. as @a[tag=liars.current_turn] run tellraw @s [{"text":"■ ","color":"gray"},{"text":"アクション: ","color":"white"},{"text":"カードをプレイ","color":"green"},{"text":" または ","color":"white"},{"text":"ダウト","color":"red"}]

# 効果音
execute as @a[tag=liars.current_turn] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 1.2
