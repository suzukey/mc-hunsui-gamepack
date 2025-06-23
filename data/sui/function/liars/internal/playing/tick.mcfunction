# プレイヤーが座席から降りられないようにする
function sui:liars/internal/playing/seat/ride_seats

# advancement をリセット（連続使用を可能にする）
advancement revoke @a only sui:liars/used_play_cards
advancement revoke @a only sui:liars/used_call_lie
advancement revoke @a only sui:liars/used_card
