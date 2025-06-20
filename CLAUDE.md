# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 言語設定

**重要**: このプロジェクトでは、すべてのコメント、ドキュメント、コミットメッセージを**日本語**で記述してください。

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
    |    ├── <command>.mcfunction # 呼び出される関数たちはトップレベルに配置
    |    └── zzz_games/           # ゲーム関連 内部処理
    |         ├── _common/        # 共通処理
    |         ├── liars/          # Liars ゲームの実装
    |         └── playout/        # PlayOut ゲームの実装
    ├── advancement/              # プレイヤーの進行状況追跡
    ├── predicate/                # 条件判定
    └── loot_table/               # カード配布メカニクス
```

## アーキテクチャ指針

### カードゲームシステムの実装パターン

1. **スコアボード変数**: ゲーム状態、プレイヤーの手札、得点などを管理
2. **エンティティタグ**: プレイヤーの役割やカードの状態を追跡
3. **predicate**: 複雑な条件判定（手札の確認、ゲーム状態など）
4. **カスタムアイテム**: カードをアイテムとして実装する場合は CustomModelData を使用

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
