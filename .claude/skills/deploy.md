---
name: deploy
description: Vercelへのデプロイ（プレビューまたはプロダクション）
disable-model-invocation: true
---

# Deploy

このスキルは安全のためAIによる自律実行を無効化している。

## 手順

1. `pnpm build` でビルドが成功することを確認
2. ビルド失敗時は **停止** してエラーを報告
3. 引数が "prod" または "production" の場合:
   - `vercel --prod` を実行
4. それ以外:
   - `vercel` を実行（プレビューデプロイ）
5. デプロイURLを報告
