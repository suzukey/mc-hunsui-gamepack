# プレイヤー参加・退出検知
# tick.mcfunction から毎tick実行される

# 全員のプレゼンス状態を一旦オフライン（2）に設定
# 注意: これはスコアボードを持つ全エンティティが対象
scoreboard players set @e[scores={sui.presence=1..}] sui.presence 2

# オンラインプレイヤーのプレゼンス状態をオンライン（1）に更新
scoreboard players set @a sui.presence 1

# -- オフラインタイマーの更新 ----------------

# オンラインプレイヤー（presence=1）のタイマーをリセット
scoreboard players set @e[scores={sui.presence=1}] sui.offline_timer 0

# オフラインプレイヤー（presence=2）のタイマーを増加
scoreboard players add @e[scores={sui.presence=2}] sui.offline_timer 1

# -- ゲーム開始前 ----------------

execute if score GAME_STARTED sui.configs matches 0 as @e[scores={sui.participants=1,sui.presence=2}] run function sui:game/_common/matching/leave

# -- ゲーム中 ----------------

# 0秒時点（オフラインになった瞬間）
execute if score GAME_STARTED sui.configs matches 1 if entity @e[scores={sui.participants=1,sui.offline_timer=1}] run tellraw @a [{"text":"■ ","color":"gray"},{"text":"参加者がオフラインになりました（30秒後にゲーム終了）","color":"yellow"}]

# 15秒経過時点
execute if score GAME_STARTED sui.configs matches 1 if entity @e[scores={sui.participants=1,sui.offline_timer=300}] run tellraw @a [{"text":"■ ","color":"gray"},{"text":"参加者のオフラインから15秒経過（残り15秒）","color":"yellow"}]

# 30秒経過時点（ゲーム終了）
execute if score GAME_STARTED sui.configs matches 1 if entity @e[scores={sui.participants=1,sui.offline_timer=600}] run tellraw @a [{"text":"■ ","color":"gray"},{"text":"参加者のオフラインから30秒経過 - ゲームを終了します","color":"red"}]
execute if score GAME_STARTED sui.configs matches 1 if entity @e[scores={sui.participants=1,sui.offline_timer=600..}] run function sui:game/_common/control/reset
