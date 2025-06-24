# ターン管理のメインループ
# playing/tick.mcfunction から呼ばれる

# -- アクション可能な表示 ----------------------

# 現在のターンプレイヤーに行動を促す
title @a[tag=!liars.current_turn] actionbar [{"text":"現在のターン: ","color":"gray"},{"selector":"@a[tag=liars.current_turn]","color":"yellow"}]
title @a[tag=liars.current_turn] actionbar [{"text":"▶ ","color":"yellow","bold":true},{"text":"あなたのターンです","color":"white","bold":true}]

# -- ターン制限 ----------------------

# 現在のターンプレイヤー以外のアクションを制限
# ※ カード選択は可能だが、プレイやダウトはターンプレイヤーのみ