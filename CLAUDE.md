# CLAUDE.md

## 設計意図

このプロジェクトは「headless + recipe + preset」の3層アプローチでUIを構築する:
- **Ark UI** — ヘッドレスな振る舞い（アクセシビリティ、キーボード操作、状態管理）を提供
- **PandaCSS recipes** — 型安全なバリアントマップとしてビジュアルスタイリングを定義
- **Park UI preset** — デフォルトのrecipe実装を供給

Park UIのrecipeを直接使わず `src/components/ui/arc/` でラップしている理由:
プロジェクト固有のバリアントオーバーライドやanatomy拡張を、生成コードを変更せずに行うための継ぎ目が必要。`styled-system/` は生成出力であり、手動編集は禁止。

## 重要な設計判断

### なぜ PandaCSS か
ビルド時の型安全トークン強制が目的。`css()` ユーティリティとrecipeシステムにより任意の値を防ぎ、デザインの一貫性を保証する。トレードオフとして、トークンやrecipe設定の変更後は `pnpm prepare` による再生成が必須。

### なぜ forwardRef が必須か
すべてのUIコンポーネントは `forwardRef` を使用する。Ark UIのヘッドレスコンポーネントはrefベースの合成パターン（フォーカス制御、寸法計測、ポータルアンカリング）を使用しており、`forwardRef` を削除するとArk UI統合が壊れる。

### コンポーネント配置戦略
- ページ固有のコードは、ルートグループ配下の `_sections/` と `_components/` に配置
- 真に再利用可能なUIプリミティブのみ `src/components/ui/arc/` に配置
- 閾値: 2ページ以上で使われるコンポーネントのみ昇格。早すぎる抽象化を防ぐ

### Park UI Neutral テーマ
accentとgrayの両方に `neutral` を意図的に使用し、モノクロームのベースを実現。カラーアクセントはpreset層ではなく、機能ごとのrecipeバリアントオーバーライドで追加する。

## 過去の教訓

- 新しいPark UIコンポーネント追加後、recipeをインポートする前に **必ず `pnpm prepare` を実行すること**。codegen実行まで `styled-system/recipes/` にrecipeファイルは存在しない
- `globals.css` は `@layer reset, base, tokens, recipes, utilities;` の順序で宣言すること。レイヤー順序を変更するとrecipeの詳細度が壊れる
- Biomeの `organizeImports` アシストがインポートを自動並替えする。手動でのインポート順序調整と戦わないこと
- `styled-system/` のインポートパスはコンポーネントから相対パス（例: `../../../../../styled-system/recipes`）。`@/*` エイリアスは `./src/*` にマップされており、プロジェクトルートの `styled-system/` には適用されない

## 規約

- ユーザー向けテキストは日本語（layoutで `lang="ja"` 設定済み）
- コミットメッセージは英語、命令形（git log参照）
- Next.jsのpage/layout以外はdefault exportを使わない（named exportのみ）
- `"use client"` の使用は最小限に — Server Componentsを優先
