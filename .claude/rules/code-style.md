---
description: PandaCSS、ArkUI、ParkUIのコーディング規約
globs: ["src/**/*.{ts,tsx}"]
---

# コードスタイルルール

## PandaCSS
- 必ずPandaCSSトークンを `css()` またはrecipe経由で使用する。`style={{}}` や生のCSS値は禁止
- `css` は `styled-system/css` からの相対パスインポート。パッケージからのインポートではない
- レイアウトにはPandaCSSパターン（stack, hstack, vstack, flex, grid）を適宜使用する
- トークン値は文字列: `css({ p: "4", gap: "3" })` — 数値 `css({ p: 4 })` ではない
- `globals.css` 以外の `.css` / `.module.css` ファイルを作成しない

## Biome
- インデントはタブ（biome.jsonで設定済み）
- 文字列はダブルクォート（biome.jsonで設定済み）
- eslint、prettier、その他のフォーマッタ設定を追加しない
- チェック: `pnpm lint` / 自動修正: `pnpm format`

## TypeScript
- strictモード有効。`any` は禁止 — `unknown` を使って型を絞り込む
- propsには `interface` より `type` を優先（プロジェクト規約）
- 型のみのインポートは `import type { X } from "y"` を使用
