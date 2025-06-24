# ゲームリセット処理

# -- スコアボードの値をリセット ----------------------

# ※ @a ではなく * を使用して、離脱したプレイヤーの値も確実にリセット

# プレイヤー関連のスコアをリセット
scoreboard players reset * liars.participants
scoreboard players reset * liars.used_carrot_stick
scoreboard players reset * liars.selected_card
scoreboard players reset * liars.selected_count
scoreboard players reset * liars.number_of_cards
scoreboard players reset * liars.seat
scoreboard players reset * liars.seat_number
scoreboard players reset * liars.roulette
scoreboard players reset * liars.trigger
scoreboard players reset * liars.current_turn

# グローバル変数をリセット（0に設定）
scoreboard players set PLAYING liars.game 0
scoreboard players set ACTIVE_PLAYERS liars.game 0
scoreboard players set CURRENT_PHASE liars.game 0
scoreboard players set CURRENT_TURN liars.game 0
scoreboard players set DECLARED_CARD liars.game 0
scoreboard players set ROUND_NUMBER liars.game 0
scoreboard players set TURN_COUNT liars.game 0
scoreboard players set IS_PREV_LIE liars.game 0

# -- アイテムをクリア ----------------------

clear @a[tag=liars.participant]

# -- エンティティを削除 ----------------------

kill @e[tag=liars.seat]

# -- タグをクリア ----------------------

# すべてのエンティティからゲーム関連タグを削除
tag @e remove liars.participant
tag @e remove liars.card_selected
tag @e remove liars.phase_loser
tag @e remove liars.winner
tag @e remove liars.seat
tag @e remove occupied

# -- ゲームモードをリセット ----------------------

# スペクテイターモードのプレイヤーをアドベンチャーモードに戻す
gamemode adventure @a[gamemode=spectator]


# 完了メッセージ
tellraw @a [{"text":"■ ","color":"gray"},{"text":"ゲームがリセットされました","color":"green"}]
