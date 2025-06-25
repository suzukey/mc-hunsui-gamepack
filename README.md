# MC-Hunsui GamePack

ゲーム詰め合わせマインクラフトデータパック

minecraft version: 1.21.6

## 不足

- データパックとリソースパックのモデル紐づけ
- 4人以下の場合のカードの偏り修正
- ダウトした際の表示処理の改善

**開発停止しています**

## 内容

- Liars: Liar's Bar のマインクラフト版

## 導入方法

1. データパックをワールドのデータパックフォルダに配置
2. 以下のコマンドを実行：

```minecraft
/reload
```

## 使用方法

サーバーに参加した全てのプレイヤーが以下の trigger コマンドで操作可能です：

```minecraft
# ゲーム操作
/trigger liars.join   # ゲームに参加
/trigger liars.leave  # ゲームから離脱
/trigger liars.start  # ゲーム開始
/trigger liars.reset  # ゲームリセット
```

## 参考・Tools

- [Misode's Data Pack Generators](https://misode.github.io)
- [Claude Code 版 Orchestaror で複雑なタスクをステップ実行する](https://zenn.dev/mizchi/articles/claude-code-orchestrator)
- [Windows 上の DevContainer で簡単に Claude Code 動かす方法](https://zenn.dev/taichi/articles/a4ea249f7d0f6b)
