# 参加者リストのタイトルを更新
# 現在の人数と最大人数を含めたタイトルに変更

# 現在の人数を取得
execute store result score #current_count sui.participants if entity @a[scores={sui.participants=1}]

# タイトルを更新（例: "参加者リスト (2/8)"）
execute if score GAME_TYPE sui.configs matches 1..2 run scoreboard objectives modify sui.participants displayname [{"text":"参加者リスト (","color":"white"},{"score":{"name":"#current_count","objective":"sui.participants"},"color":"yellow"},{"text":"/","color":"white"},{"score":{"name":"MAX_PLAYERS","objective":"sui.configs"},"color":"yellow"},{"text":")","color":"white"}]

# ゲームが選択されていない場合
execute if score GAME_TYPE sui.configs matches 0 run scoreboard objectives modify sui.participants displayname [{"text":"参加者リスト","color":"white"}]
