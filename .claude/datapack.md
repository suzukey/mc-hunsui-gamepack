# Minecraft データパックリファレンス

このドキュメントは Minecraft Wiki から収集したデータパックに関する包括的な知識をまとめたものです。

## データパックとは

データパック（Data Pack）は、Minecraft Java Edition で様々なゲーム要素を設定・カスタマイズするためのデータの集合体です。フォルダまたは .zip ファイル形式で提供され、`pack.mcmeta` ファイルを必ず含みます。

### 主な用途

- 進捗（Advancements）の定義
- ディメンション（Dimensions）の設定
- エンチャント（Enchantments）のカスタマイズ
- ルートテーブル（Loot Tables）の調整
- レシピ（Recipes）の追加・変更
- 構造物（Structures）の配置
- バイオーム（Biomes）の定義
- その他多数のゲーム要素の設定

## ファイル構造

### 基本構造

```
<データパック名>/
├── pack.mcmeta (必須)
├── pack.png (任意: 64x64px のアイコン)
└── data/
    └── <名前空間>/
        ├── advancement/      # 進捗の定義
        ├── banner_pattern/   # 旗の模様
        ├── chat_type/        # チャットタイプ
        ├── damage_type/      # ダメージタイプ
        ├── dimension/        # ディメンション設定
        ├── dimension_type/   # ディメンションタイプ
        ├── enchantment/      # エンチャント
        ├── enchantment_provider/ # エンチャントプロバイダー
        ├── function/         # コマンド関数
        ├── item_modifier/    # アイテム修飾子
        ├── jukebox_song/     # ジュークボックスの曲
        ├── loot_table/       # ルートテーブル
        ├── painting_variant/ # 絵画の種類
        ├── predicate/        # 条件判定
        ├── recipe/           # レシピ
        ├── structure/        # 構造物
        ├── tag/              # タグ定義
        ├── trial_spawner/    # トライアルスポナー
        ├── trim_material/    # 装飾材料
        ├── trim_pattern/     # 装飾パターン
        ├── wolf_variant/     # オオカミの種類
        └── worldgen/         # ワールド生成設定
```

### pack.mcmeta の構成

```json
{
  "pack": {
    "description": "データパックの説明文",
    "pack_format": 80, // バージョン互換性を示す数値
    "supported_formats": [80, 81] // 任意: サポートする形式の範囲
  },
  "filter": {
    // 任意: ファイルフィルター
    "block": [
      {
        "namespace": "minecraft",
        "path": "recipe/.*"
      }
    ]
  },
  "overlays": {
    // 任意: オーバーレイ設定
    "entries": [
      {
        "formats": [80],
        "directory": "overlay_80"
      }
    ]
  }
}
```

## Pack Format バージョン対応表

### 最新バージョン

| Pack Format | Minecraft バージョン | 主な変更点                                                 |
| ----------- | -------------------- | ---------------------------------------------------------- |
| 80          | 1.21.6               | `cloud_height` フィールド追加、`/datapack create` コマンド |
| 71          | 1.21.4               | テキストコンポーネントと NBT の大幅変更                    |
| 61          | 1.21.2               | エンチャントとバイオームのデータ駆動化                     |
| 48          | 1.20.5               | データ駆動型エンチャント、アイテムコンポーネント           |
| 41          | 1.20.2               | エンチャント名変更、アイテム述語変更                       |
| 26          | 1.20.0               | 新機能多数追加                                             |
| 18          | 1.19.4               | damage_type 追加                                           |
| 15          | 1.19.0               | ワールド生成設定の変更                                     |
| 10          | 1.18.2               | タグファイルの構造変更                                     |
| 8           | 1.18.0               | 大規模な内部変更                                           |
| 7           | 1.17.0               | レシピとタグの追加                                         |
| 6           | 1.16.2               | 各種機能追加                                               |
| 5           | 1.15.0               | predicate 条件の追加                                       |
| 4           | 1.13.0               | データパック初登場                                         |

## 関数（Function）システム

### ファイル形式

- 拡張子: `.mcfunction`
- エンコーディング: UTF-8
- 配置場所: `data/<名前空間>/function/`

### 基本ルール

1. **1 行に 1 コマンド**（先頭の `/` は不要）
2. **コメント**: `#` で開始
3. **空行**: 無視される
4. **行継続**: 行末に `\` を配置
5. **インデント**: スペースまたはタブ（推奨: 一貫性を保つ）

### 実行権限

- **シングルプレイヤー**: 権限レベル 2（デフォルト）
- **マルチプレイヤー**: `server.properties` の `function-permission-level` で設定
- **最大実行コマンド数**: 65,536（`maxCommandChainLength` で設定可能）

### マクロ機能

関数に引数を渡して動的にコマンドを生成：

```mcfunction
# 呼び出し例
function namespace:give_item {item:"minecraft:diamond",count:5}

# 関数内での使用
give @s $(item) $(count)
```

### 特殊コマンド

#### return コマンド

```mcfunction
# 値なしで関数を終了
return

# 値を返して終了
return 42

# 関数の結果を返す
return run function namespace:calculate_score
```

#### 関数の呼び出し方法

1. **直接実行**: `/function namespace:function_name`
2. **タグ経由**: 関数タグを使用
3. **進捗の報酬**: advancement の reward として
4. **スケジュール**: `/schedule` コマンドで遅延実行
5. **他の関数から**: `function` コマンドで呼び出し

## タグ（Tag）システム

### タグの用途

タグは複数の要素をグループ化し、一括で参照するための仕組みです。

### 対応するタグの種類

- `block/` - ブロックタグ
- `entity_type/` - エンティティタイプタグ
- `fluid/` - 流体タグ
- `function/` - 関数タグ
- `game_event/` - ゲームイベントタグ
- `item/` - アイテムタグ
- `worldgen/biome/` - バイオームタグ
- その他多数

### JSON 形式

```json
{
  "replace": false, // 任意: true の場合、既存のタグを完全に置換
  "values": [
    "minecraft:stone", // 直接指定
    "#minecraft:wooden_doors", // 他のタグを参照（# プレフィックス）
    {
      "id": "minecraft:oak_log",
      "required": false // 任意: false の場合、要素が存在しなくてもエラーにならない
    }
  ]
}
```

### 重要な関数タグ

#### #minecraft:load

- **実行タイミング**: データパック読み込み時（ワールド開始、`/reload` コマンド実行時）
- **用途**: 初期化処理、スコアボード作成など

```json
{
  "values": ["sui:game/_common/loader/init"]
}
```

#### #minecraft:tick

- **実行タイミング**: 毎ゲームティック（1 秒間に 20 回）
- **用途**: 継続的な処理、ゲームロジックの更新

```json
{
  "values": ["sui:game/_common/loader/tick"]
}
```

## 進捗（Advancement）システム

### 基本構造

```json
{
  "parent": "namespace:parent/advancement", // 任意: 親進捗
  "display": {
    // 任意: UI表示設定
    "icon": {
      "id": "minecraft:diamond",
      "components": {
        // 任意: アイテムコンポーネント
        "minecraft:custom_model_data": 1
      }
    },
    "title": {
      "text": "進捗のタイトル",
      "color": "gold"
    },
    "description": {
      "text": "進捗の説明文"
    },
    "frame": "task", // task, goal, challenge のいずれか
    "background": "minecraft:textures/block/stone.png", // ルート進捗のみ
    "show_toast": true, // 達成時のトースト表示
    "announce_to_chat": true, // チャットへの通知
    "hidden": false // 未達成時の表示
  },
  "criteria": {
    // 必須: 達成条件
    "requirement_name": {
      "trigger": "minecraft:inventory_changed",
      "conditions": {
        "items": [
          {
            "items": "minecraft:diamond",
            "count": {
              "min": 1
            }
          }
        ]
      }
    }
  },
  "requirements": [["requirement_name"]], // 任意: 条件の組み合わせ
  "rewards": {
    // 任意: 達成報酬
    "experience": 100,
    "loot": ["namespace:loot_table"],
    "recipes": ["namespace:recipe"],
    "function": "namespace:function"
  }
}
```

### 主要なトリガー

1. **プレイヤー関連**

   - `tick` - 毎ティック
   - `location` - 特定の場所
   - `enter_block` - ブロックに入る
   - `inventory_changed` - インベントリ変更
   - `player_hurt_entity` - エンティティにダメージ
   - `player_killed_entity` - エンティティを倒す

2. **アイテム関連**

   - `consume_item` - アイテム使用
   - `enchanted_item` - エンチャント
   - `item_durability_changed` - 耐久値変更
   - `item_used_on_block` - ブロックに使用

3. **その他**
   - `impossible` - 達成不可（コマンドでのみ）
   - `minecraft:recipe_crafted` - レシピ作成
   - カスタムトリガー作成可能

### 進捗の管理

```mcfunction
# 進捗の付与
advancement grant @a only namespace:advancement_name

# 進捗の剥奪
advancement revoke @a only namespace:advancement_name

# 条件の個別管理
advancement grant @a only namespace:advancement_name requirement_name
```

## 述語（Predicate）システム

### 用途

複雑な条件判定を JSON で定義し、コマンドやルートテーブルで使用。

### 基本構造

```json
{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "type": "minecraft:player",
    "nbt": "{SelectedItem:{id:\"minecraft:diamond_sword\"}}",
    "location": {
      "biome": "minecraft:plains",
      "light": {
        "light": {
          "min": 10
        }
      }
    }
  }
}
```

### 複合条件

```json
{
  "condition": "minecraft:alternative", // OR条件
  "terms": [
    {
      "condition": "minecraft:weather_check",
      "raining": true
    },
    {
      "condition": "minecraft:time_check",
      "value": {
        "min": 12000,
        "max": 24000
      }
    }
  ]
}
```

### コマンドでの使用

```mcfunction
# execute if で条件判定
execute if predicate namespace:is_holding_diamond run say ダイヤモンドを持っています！

# ルートテーブルでの使用例も可能
```

## ベストプラクティス

### 1. 命名規則

- **名前空間**: プロジェクト固有の識別子を使用（例: `sui`）
- **ファイル名**: 小文字とアンダースコアのみ（`snake_case`）
- **階層構造**: 機能別に整理（例: `game/`, `ui/`, `util/`）

### 2. パフォーマンス最適化

- **セレクタの最適化**: `@e` より `@a` や具体的なタイプを指定
- **スコアボード演算**: エンティティ NBT 操作より高速
- **関数の分割**: 長い処理は複数の関数に分割
- **条件判定**: predicate を活用して効率化

### 3. デバッグとテスト

```mcfunction
# デバッグ用メッセージ
tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"処理開始"}]

# スコアボード表示
scoreboard objectives setdisplay sidebar sui.debug

# 実行時間計測
function namespace:start_timer
function namespace:heavy_process
function namespace:end_timer
```

### 4. エラーハンドリング

```mcfunction
# 条件チェック
execute unless score @s sui.initialized matches 1 run function sui:initialize

# フェイルセーフ
execute if score @s sui.state matches 999 run function sui:reset_state
```

## インストールと配布

### インストール方法

1. **ワールド作成時**

   - 「データパック」ボタンから選択
   - ドラッグ＆ドロップで追加

2. **既存ワールドへの追加**

   - `.minecraft/saves/<ワールド名>/datapacks/` に配置
   - ゲーム内で `/reload` コマンド実行

3. **コマンドでの管理**
   ```
   /datapack list                    # 一覧表示
   /datapack enable "file/pack_name" # 有効化
   /datapack disable "file/pack_name" # 無効化
   ```

### 配布形式

- **フォルダ形式**: 開発・テスト用
- **ZIP 形式**: 配布用（フォルダを直接圧縮）

## トラブルシューティング

### よくある問題

1. **データパックが認識されない**

   - `pack.mcmeta` の形式を確認
   - pack_format がバージョンに対応しているか確認
   - ファイル名に特殊文字が含まれていないか確認

2. **関数が実行されない**

   - 名前空間とパスが正しいか確認
   - 権限レベルを確認
   - `/datapack list` で有効化されているか確認

3. **パフォーマンス問題**
   - `#minecraft:tick` の処理を最適化
   - セレクタの範囲を限定
   - 不要な NBT 操作を削減

## 参考リンク

- [Minecraft Wiki - Data pack](https://minecraft.wiki/w/Data_pack)
- [Minecraft Wiki - Function](<https://minecraft.wiki/w/Function_(Java_Edition)>)
- [Minecraft Wiki - Tag](https://minecraft.wiki/w/Tag)
- [Minecraft Wiki - Advancement](https://minecraft.wiki/w/Advancement/JSON_format)
- [Minecraft Wiki - Predicate](https://minecraft.wiki/w/Predicate)
- [Misode's Data Pack Generators](https://misode.github.io/)
