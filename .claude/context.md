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
data/sui/function/
├── game/              # ゲームロジック
│   ├── _common/       # 共通処理
│   ├── liars/         # Liars ゲーム
│   └── playout/       # PlayOut ゲーム
├── trigger/           # trigger コマンド処理
├── join.mcfunction    # 参加コマンド
└── leave.mcfunction   # 離脱コマンド
```

### スコアボード構成

- `sui.configs` - ゲーム設定（game_type など）
- `sui.constants` - 定数管理
- `sui.participants` - 参加者管理
- `sui.select.liars` - Liars 選択用 trigger
- `sui.select.playout` - PlayOut 選択用 trigger
- `sui.join` - 参加用 trigger
- `sui.leave` - 離脱用 trigger
