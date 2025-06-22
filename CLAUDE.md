# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 言語設定

**重要**: このプロジェクトでは、思考は**英語**で行い、すべてのコメント、ドキュメント、コミットメッセージを**日本語**で記述してください。

## プロジェクト概要

これは Minecraft データパックプロジェクトで、新しいトランプゲームシステムを実装することを目的としています。

## 開発環境

- **pack_format**: 80 (Minecraft 1.21.6 バージョン用)
- **Datapack Helper Plus**: 拡張機能、データパックの構文ハイライトと検証を提供
- **Misode's Data Pack Generators** (https://misode.github.io): predicate や advancement の生成に必須

## プロジェクト構造

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

### ディレクトリ構造の設計原則

#### `common/` ディレクトリ

- 全ゲームの初期化とtick処理を統括
- 各ゲームの `internal/init.mcfunction` と `internal/tick.mcfunction` を呼び出す
- ゲーム固有のロジックは含まない

#### ゲーム固有ディレクトリ（`liars/`, `playout/` など）

各ゲームは完全に独立した構造を持ち、以下の要素で構成されます：

##### `cmd/` - プレイヤー向けコマンド

- **control/**: ゲームの開始・リセットなどの制御コマンド
- **matching/**: 参加・退出などのマッチングコマンド
- プレイヤーが直接実行可能なコマンドのみを配置

##### `internal/` - 内部実装

- ゲームロジックの中核部分
- `init.mcfunction`: ゲーム固有の初期化処理
- `tick.mcfunction`: メインゲームループ
- フェーズ別のサブディレクトリ（matching/, playing/ など）

##### `trigger/` - トリガーシステム

- Minecraft の `/trigger` コマンドを使用したプレイヤーインタラクション
- `init.mcfunction`: トリガー用スコアボードの作成
- `tick.mcfunction`: トリガーの処理とリセット

## アーキテクチャ指針

### カードゲームシステムの実装パターン

1. **スコアボード変数**: ゲーム状態、プレイヤーの手札、得点などを管理
2. **エンティティタグ**: プレイヤーの役割やカードの状態を追跡
3. **predicate**: 複雑な条件判定（手札の確認、ゲーム状態など）
4. **カスタムアイテム**: カードをアイテムとして実装する場合は CustomModelData を使用

### 命名規則

#### スコアボード名

- ゲーム固有のスコアボードは `<game>.<category>` 形式を使用
- 例: `liars.configs`, `liars.participants`, `liars.trigger`
- カテゴリ例:
  - `configs`: ゲーム設定（MIN_PLAYERS, MAX_PLAYERS など）
  - `participants`: プレイヤー状態管理
  - `trigger`: トリガーシステム用

#### 関数名

- 明確で動詞から始まる名前を使用
- プレイヤー向けコマンドは `cmd/` 内に配置し、簡潔な名前に
- 内部実装は `internal/` 内に配置し、詳細な名前を使用

#### トリガー名

- ゲーム名をプレフィックスとして使用
- 例: `liars.join`, `liars.leave`, `liars.start`, `liars.reset`

## 重要な注意事項

- データパック開発では、すべての関数は `.mcfunction` 拡張子を使用
- JSON ファイル（advancement、predicate など）は Misode's Generators で生成することを推奨
- 名前空間の衝突を避けるため、独自の名前空間を使用すること

## 知見管理システム

このプロジェクトでは以下のファイルで知見を体系的に管理しています：

### `.claude/context.md`

- ゲームの背景、コンセプト、ゲームプレイの目的
- 使用する Minecraft のバージョンと機能
- ゲームデザインの制約（プレイヤー数、必要アイテムなど）

### `.claude/project-knowledge.md`

- 実装パターンや設計決定の知見
- アーキテクチャの選択理由
- 避けるべきパターンやアンチパターン

### `.claude/project-improvements.md`

- 過去の試行錯誤の記録
- 失敗した実装とその原因
- 改善プロセスと結果

### `.claude/common-patterns.md`

- 頻繁に使用するコマンドパターン
- 定型的な実装テンプレート

**重要**: 新しい実装や重要な決定を行った際は、該当するファイルを更新してください。
