# プロジェクトコンテキスト

## ゲームコンセプト

このデータパックは、Minecraft 内で複数のトランプゲームを実装するプロジェクトです。

プレイヤーは Minecraft の世界でカードゲームを楽しむことができます。

## 技術的背景

### Minecraft バージョン

- **対象バージョン**: 1.21.6（pack_format: 80）
- **使用機能**: スコアボード、カスタムアイテム、predicate、advancement

### ゲームシステムの基盤

- カードの表現: カスタムアイテム（CustomModelData 使用）
- ゲーム状態管理: スコアボードシステム
- プレイヤー検出: エンティティタグと predicate
- コマンド実行: trigger システムで権限不要の操作

### 技術的制約

- コマンドの実行頻度によるパフォーマンスへの配慮
- アイテムエンティティの数の管理（ラグ防止）
- スコアボードの表示制限

## 開発の焦点

1. **直感的な UI**: Minecraft の標準的なインターフェースを活用
2. **公平性**: ランダム性と戦略性のバランス
3. **拡張性**: 新しいゲームルールやカードの追加が容易

## アーキテクチャ

### ディレクトリ構成

```
data/
└── sui/                          # ゲーム固有の名前空間
    └── function/                 # コマンド関数
        ├── common/               # 共通初期化・tick関数
        │   ├── init.mcfunction   # 全ゲームの初期化を呼び出し
        │   └── tick.mcfunction   # 全ゲームのtickを呼び出し
        └── <game_name>/          # 各ゲームの実装（例: liars, playout）
            ├── README.md         # ゲーム固有のドキュメント
            ├── cmd/              # プレイヤーが使用するコマンド
            │   ├── control/      # ゲーム制御コマンド
            │   │   ├── start.mcfunction   # ゲーム開始
            │   │   └── reset.mcfunction   # ゲームリセット
            │   └── matching/     # マッチングコマンド
            │       ├── join.mcfunction    # 参加
            │       └── leave.mcfunction   # 退出
            ├── internal/         # 内部ロジック
            │   ├── init.mcfunction        # ゲーム初期化
            │   ├── tick.mcfunction        # メインループ
            │   ├── matching/              # マッチングフェーズ
            │   │   └── tick.mcfunction
            │   └── playing/               # プレイフェーズ
            │       └── tick.mcfunction
            └── trigger/          # ゲーム固有のトリガーシステム
                ├── init.mcfunction        # トリガー初期化
                └── tick.mcfunction        # トリガー処理
```
