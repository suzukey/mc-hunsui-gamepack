# 次の座席番号を割り当てる

# カウンターをインクリメント
scoreboard players add #seat_counter liars.configs 1

# 現在のプレイヤーに座席番号を割り当て
scoreboard players operation @s liars.seat = #seat_counter liars.configs