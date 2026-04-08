---
description: ファイル名・コード命名規則
globs: ["src/**/*"]
---

# 命名規則

## ファイル名
- すべてkebab-case: `button-showcase.tsx`, `hero-section.tsx`
- サフィックスパターン: `-anatomy.ts`, `-recipe.ts`, `.tsx`（コンポーネント）, `.test.tsx`
- ページ固有フォルダ: `_` プレフィックス（`_components/`, `_sections/`）

## コード
- PascalCase: コンポーネント、型（`Button`, `ButtonProps`, `ButtonVariantProps`）
- camelCase: 関数、変数、recipeインスタンス（`buttonRecipe`, `buttonAnatomy`）
- UPPER_SNAKE_CASE: 真の定数のみ（環境キー、マジックナンバー）

## エクスポート
- すべてnamed export。default exportはNext.jsのpage/layoutのみ（フレームワーク要件）
- 各コンポーネントフォルダにbarrel `index.ts` — ファイルではなくフォルダからインポート
- 共有UIは `@/components/ui/arc/button` のようにエイリアスでインポート
- styled-systemは相対パスでインポート（`src/` 外にあるため）
