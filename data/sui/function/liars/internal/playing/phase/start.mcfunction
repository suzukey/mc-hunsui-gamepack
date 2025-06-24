# フェーズ開始処理
# エントリーポイント: 各フェーズの開始時に呼ばれる

# -- 勝利判定 ----------------------

# アクティブなプレイヤー数をカウント
execute store result score ACTIVE_PLAYERS liars.game if entity @a[tag=liars.participant,gamemode=!spectator]

# 1人以下の場合は勝利処理して終了
execute if score ACTIVE_PLAYERS liars.game matches ..1 run function sui:liars/internal/playing/phase/declare_winner
execute if score ACTIVE_PLAYERS liars.game matches ..1 run return 0

# -- メインカード決定 ----------------------

# Q(1), K(2), A(3) からランダムに選択
execute store result score DECLARED_CARD liars.game run random value 1..3

# -- 手札リセット＆カード配布 ----------------------

function sui:liars/internal/playing/deal/deal_all

# -- フェーズ番号を増加 ----------------------

scoreboard players add CURRENT_PHASE liars.game 1

# -- フェーズ開始アナウンス ----------------------

function sui:liars/internal/playing/phase/announce_phase
