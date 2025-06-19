# データパックロード時の初期化を行う

# 参加管理用スコアボード
scoreboard objectives add playout.participants dummy "参加プレイヤー"

# スコアボード表示設定
scoreboard objectives setdisplay sidebar playout.participants

# 完了メッセージ
tellraw @a [{"text":"[PlayOut] ","color":"gold"},{"text":"初期化しました","color":"green"}]
