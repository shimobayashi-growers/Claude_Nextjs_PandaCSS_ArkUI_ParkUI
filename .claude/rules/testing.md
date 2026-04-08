---
description: テスト規約（テストフレームワーク追加時に拡張）
globs: ["**/*.test.{ts,tsx}", "**/*.spec.{ts,tsx}"]
---

# テストルール

## 現状
テストフレームワーク未導入。テスト追加時の方針:
- Vitest を使用（PandaCSSビルドパイプラインと互換性あり）
- テストファイルはソースと同階層に配置: `button.test.tsx` を `button.tsx` の隣に
- コンポーネントテストには React Testing Library を使用
- ビジュアルスタイリングではなく振る舞い（クリック、キーボード操作）をテスト

## 命名規則
- ファイル: `{component-name}.test.tsx`
- describeブロック: コンポーネントの表示名
- テスト名: 「should {期待される振る舞い} when {条件}」
