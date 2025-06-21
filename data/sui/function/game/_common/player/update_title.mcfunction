# 参加者リストのタイトルを更新
# 現在の人数と最大人数を含めたタイトルに変更

# 現在の人数を取得
execute store result score #current_count sui.participants if entity @a[scores={sui.participants=1}]

# 開始要件を満たすかチェック
execute store result score #can_start sui.participants if score #current_count sui.participants >= MIN_PLAYERS sui.configs

# タイトルを更新（例: "参加者リスト (2/8)"）
execute if score #can_start sui.participants matches 0 run scoreboard objectives modify sui.participants displayname [{"text":"参加者リスト ","color":"white"},{text:"(",color:"yellow"},{"score":{"name":"#current_count","objective":"sui.participants"},"color":"yellow"},{"text":"/","color":"yellow"},{"score":{"name":"MAX_PLAYERS","objective":"sui.configs"},"color":"yellow"},{"text":")","color":"yellow"}]

execute if score #can_start sui.participants matches 1 run scoreboard objectives modify sui.participants displayname [{"text":"参加者リスト ","color":"white"},{text:"(",color:"green"},{"score":{"name":"#current_count","objective":"sui.participants"},"color":"green"},{"text":"/","color":"green"},{"score":{"name":"MAX_PLAYERS","objective":"sui.configs"},"color":"green"},{"text":")","color":"green"}]
