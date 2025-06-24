# 募集中のtick処理

# -- 募集中の参加者数カウント ----------------------

# スコアボードに設定
scoreboard players reset * liars.participants
scoreboard players set @a[tag=liars.participant] liars.participants 1

execute store result score #current_count liars.participants if entity @a[tag=liars.participant]
execute store result score #can_start liars.participants if score #current_count liars.participants >= MIN_PLAYERS liars.const

# -- 選択中表示 ----------------------

title @a actionbar [{text:"選択中のゲーム: ",color:"white"},{text:"Liars",color:"aqua"}]

# -- 参加者スコアボードの更新 ----------------------

# 参加者スコアボードのタイトルを更新（例: "参加者 (2/8)"）
execute if score #can_start liars.participants matches 0 run scoreboard objectives modify liars.participants displayname [{"text":"参加者 ","color":"white"},{text:"(",color:"yellow"},{"score":{"name":"#current_count","objective":"liars.participants"},"color":"yellow"},{"text":"/","color":"yellow"},{"score":{"name":"MAX_PLAYERS","objective":"liars.const"},"color":"yellow"},{"text":")","color":"yellow"}]

execute if score #can_start liars.participants matches 1 run scoreboard objectives modify liars.participants displayname [{"text":"参加者 ","color":"white"},{text:"(",color:"green"},{"score":{"name":"#current_count","objective":"liars.participants"},"color":"green"},{"text":"/","color":"green"},{"score":{"name":"MAX_PLAYERS","objective":"liars.const"},"color":"green"},{"text":")","color":"green"}]
