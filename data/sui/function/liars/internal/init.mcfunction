# ゲーム初期化スクリプト
# データパック読み込み時に一度だけ実行される
# スコアボードの作成と永続的な設定値のみを扱う

# -- スコアボード作成 ----------------------

# 定数用スコアボード
scoreboard objectives add liars.const dummy "定数"

# ゲームスコア永続化スコアボード
scoreboard objectives add liars.played dummy "プレイ回数"
scoreboard objectives add liars.wins dummy "勝利回数"

# ゲーム状態管理用スコアボード
scoreboard objectives add liars.game dummy "ゲーム状態"

# アクション検知用スコアボード
scoreboard objectives add liars.used_carrot_stick minecraft.used:minecraft.carrot_on_a_stick "人参棒使用"

# カード管理用スコアボード
scoreboard objectives add liars.selected_card dummy "選択カード"
scoreboard objectives add liars.selected_count dummy "選択枚数"
scoreboard objectives add liars.number_of_cards dummy "カード枚数"

# 座席管理用スコアボード
scoreboard objectives add liars.seat dummy "座席"
scoreboard objectives add liars.seat_number dummy "座席番号"

# ロシアンルーレット用スコアボード
scoreboard objectives add liars.roulette dummy "ルーレット"
scoreboard objectives add liars.trigger dummy "トリガー"

# ターン管理用スコアボード
scoreboard objectives add liars.current_turn dummy "現在のターン"

# 参加者表示用スコアボード
scoreboard objectives add liars.participants dummy "参加者"

# -- 表示設定 ----------------------

scoreboard objectives setdisplay sidebar liars.participants
scoreboard objectives setdisplay list liars.wins

# -- 永続的な設定値 ----------------------

scoreboard players set MIN_PLAYERS liars.const 2
scoreboard players set MAX_PLAYERS liars.const 4

# -- Trigger システムの初期化 ----------------------

function sui:liars/trigger/init

# -- 完了メッセージ ----------------------

tellraw @a [{"text":"■ ","color":"gray"},{"text":"ロードされました","color":"green"}]
