# インベントリ変更時の処理

# プレイヤーが変更する場合はリセット、システムからの変更であれば許可
tellraw @s {text:"■ インベントリの変更が検知されました。",color:"gray"}

# 検知用実績のリセット
advancement revoke @s only sui:liars/inventory_changed
