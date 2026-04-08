---
name: check-health
description: プロジェクトのヘルスチェック（型チェック、lint、ビルド）を実行する
---

# Check Health

以下のチェックを順番に実行し、最初の失敗で停止する:

1. `npx tsc --noEmit` — TypeScript型チェック
2. `pnpm lint` — Biome lint + フォーマットチェック
3. `pnpm build` — プロダクションビルド

## 結果報告フォーマット

```
- [x] TypeScript: pass (エラー数)
- [x] Biome: pass (エラー数)
- [x] Build: pass
```

すべて通過した場合はプロジェクトが健全であることを確認。
失敗した場合は具体的なエラーと修正案を提示する。
