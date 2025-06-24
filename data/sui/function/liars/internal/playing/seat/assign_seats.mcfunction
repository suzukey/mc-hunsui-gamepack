# プレイヤーの座席割り当て処理

# -- 準備処理 ----------------------

# 全プレイヤーの座席を解除
execute as @a[tag=liars.participant] run ride @s dismount

# ターン順をリセット
scoreboard players reset @a liars.seat

# -- 効率的な座席割り当て ----------------------

# カウンター初期化
scoreboard players set #seat_counter liars.game 0

# 参加者をランダムに並べて座席を割り当て
execute as @a[tag=liars.participant,sort=random] run function sui:liars/internal/playing/seat/assign_next_seat

# -- 座席への着席 ----------------------

function sui:liars/internal/playing/seat/ride_seats
