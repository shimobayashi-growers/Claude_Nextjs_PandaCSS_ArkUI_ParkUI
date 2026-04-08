---
description: ArkUI anatomyパターンによるUIコンポーネント設計ルール
globs: ["src/components/ui/arc/**/*.{ts,tsx}"]
---

# コンポーネント設計ルール

## ファイル構成（必須4ファイルパターン）
`src/components/ui/arc/` 配下のすべてのコンポーネントは以下を持つこと:

1. `{name}-anatomy.ts` — `createAnatomy("{name}").parts(...)` でslot定義
2. `{name}-recipe.ts` — `styled-system/recipes` からrecipeをre-export + 型エイリアス
3. `{name}.tsx` — forwardRefを使ったコンポーネント実装、recipeでclassName適用
4. `index.ts` — barrel exports（コンポーネント、props型、anatomy、recipe、variant props）

## 実装ルール
- すべてのコンポーネントで `forwardRef` を使用（Ark UIのref合成に必須）
- recipe型からバリアントpropsを抽出し、HTML要素の属性とマージしてprops型を定義
- recipeの呼び出しはコンポーネントのトップで1回のみ、結果を `className` で適用
- コンポーネントファイル内で `css()` を呼ばない — スタイリングはすべてrecipeバリアント経由
- マルチスロットコンポーネントには単一recipeではなく `sva()`（slot variant API）を使用

## 新コンポーネント追加手順
1. recipeの存在確認: `ls styled-system/recipes/{name}.*`
2. なければ panda.config.ts にrecipeが含まれていることを確認し `pnpm prepare` で再生成
3. 上記の4ファイル構成を作成
4. Park UIプリセットで利用可能なrecipe: accordion, alert, avatar, badge, button, card,
   carousel, checkbox, clipboard, code, collapsible, color-picker, combobox, date-picker,
   dialog, drawer, editable, field, fieldset, file-upload, form-label, hover-card, icon,
   input, kbd, link, menu, number-input, pagination, pin-input, popover, progress, qr-code,
   radio-button-group, radio-group, rating-group, segment-group, select, signature-pad,
   skeleton, slider, spinner, splitter, switch-recipe, table, tabs, tags-input, text,
   textarea, toast, toggle-group, tooltip, tree-view
