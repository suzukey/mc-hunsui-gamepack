# マッチング中、全プレイヤーに対して現在選択中のゲームを表示
execute if score GAME_TYPE sui.configs = GAME_TYPE_NONE sui.constants run title @a actionbar {text:"ゲームを選択してください",color:"white"}

execute if score GAME_TYPE sui.configs = GAME_TYPE_LIARS sui.constants run title @a actionbar {text:"選択中のゲーム: Liars",color:"white"}

execute if score GAME_TYPE sui.configs = GAME_TYPE_PLAYOUT sui.constants run title @a actionbar {text:"選択中のゲーム: PlayOut",color:"white"}
