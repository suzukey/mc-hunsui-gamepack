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
    ├── function/                 # コマンド関数
    │   ├── game/                 # ゲーム関連の実装
    │   │   ├── _common/          # 共通処理
    │   │   │   ├── loader/       # 初期化・tick処理
    │   │   │   └── player/       # プレイヤー管理
    │   │   ├── liars/            # Liars ゲームの実装
    │   │   │   ├── loader/       # ゲーム固有の初期化・tick
    │   │   │   └── select.mcfunction
    │   │   └── playout/          # PlayOut ゲームの実装
    │   │       ├── loader/       # ゲーム固有の初期化・tick
    │   │       └── select.mcfunction
    │   ├── trigger/              # トリガーシステム
    │   ├── join.mcfunction       # プレイヤー参加コマンド
    │   └── leave.mcfunction      # プレイヤー退出コマンド
    ├── advancement/              # プレイヤーの進行状況追跡
    ├── predicate/                # 条件判定
    └── loot_table/               # カード配布メカニクス
```

### game ディレクトリの分類ルール

`game/` は内部実装を格納する特別なディレクトリです。以下の分類ルールに従ってください：

#### `_common/` に配置するもの

- **2 つ以上のゲームで共有される機能**
- ゲームに依存しない汎用的な処理
- 例: loader（初期化・tick）、カード操作の共通処理、プレイヤー管理の基本機能

#### 各ゲームディレクトリ（`liars/`, `playout/` など）に配置するもの

- **特定のゲームでのみ使用される機能**
- ゲーム固有のルールやロジック
- 必須ファイル: `select.mcfunction`
- 必須ディレクトリ: `loader/`（`init.mcfunction` と `tick.mcfunction` を含む）

## アーキテクチャ指針

### カードゲームシステムの実装パターン

1. **スコアボード変数**: ゲーム状態、プレイヤーの手札、得点などを管理
2. **エンティティタグ**: プレイヤーの役割やカードの状態を追跡
3. **predicate**: 複雑な条件判定（手札の確認、ゲーム状態など）
4. **カスタムアイテム**: カードをアイテムとして実装する場合は CustomModelData を使用

### 命名規則

#### スコアボード名

- すべてのスコアボードに `sui.` プレフィックスを付ける
- 例: `sui.configs`, `sui.constants`, `sui.participants`
- ゲーム固有のスコアボードは `sui.<game>.<name>` 形式を推奨

#### 関数名

- 明確で動詞から始まる名前を使用
- 内部関数は `game/` 内に配置
- プレイヤーが使用するコマンドは簡潔に

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
