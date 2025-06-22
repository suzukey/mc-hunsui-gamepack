# Liars

## プレイヤー要件

- 最小プレイヤー数: 2 人
- 最大プレイヤー数: 4 人

## ゲーム概要

Liar's bar のマインクラフト版

2~4 人で遊ぶことができる、ライアーズデッキを使ったロシアンルーレットゲームです。

ライアーズデッキは、Q,K,A が 6 枚、ジョーカーが 2 枚の計 20 枚から構成されているデッキを利用する。

ラウンド開始時にジョーカー以外の絵柄が宣言され、その絵柄を裏向きに最大 3 枚まで順番に出していく。

出されたカードが嘘だと思った場合、次の手番のプレイヤーが嘘であることを宣言できる。

嘘であることがばれた、もしくは宣言が間違いだった場合は、ロシアンルーレットをプレイすることになる。

最後まで生き残ることができれば勝利となる。

## 実装構造

### ディレクトリ構成

```
liars/
├── README.md         # このファイル
├── cmd/              # プレイヤーが使用するコマンド
│   ├── control/      # ゲーム制御
│   │   ├── start.mcfunction   # ゲーム開始
│   │   └── reset.mcfunction   # ゲームリセット
│   └── matching/     # マッチング機能
│       ├── join.mcfunction    # ゲーム参加
│       └── leave.mcfunction   # ゲーム退出
├── internal/         # 内部実装
│   ├── init.mcfunction        # 初期化処理
│   ├── tick.mcfunction        # メインループ
│   ├── matching/              # マッチングフェーズ
│   │   └── tick.mcfunction
│   └── playing/               # プレイフェーズ
│       └── tick.mcfunction
└── trigger/          # トリガーシステム
    ├── init.mcfunction        # トリガー初期化
    └── tick.mcfunction        # トリガー処理
```

### 使用するスコアボード

- `liars.configs`: ゲーム設定（MIN_PLAYERS, MAX_PLAYERS, GAME_STARTED）
- `liars.participants`: 参加者管理
- `liars.trigger`: トリガーシステム（join, leave, start, reset）

### コマンド使用方法

プレイヤーは以下のトリガーコマンドを使用できます：

- `/trigger liars.join`: ゲームに参加
- `/trigger liars.leave`: ゲームから退出
- `/trigger liars.start`: ゲームを開始（要件を満たす場合）
- `/trigger liars.reset`: ゲームをリセット
