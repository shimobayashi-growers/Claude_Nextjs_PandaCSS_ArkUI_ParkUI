---
name: deploy
description: Deploy to Vercel (preview or production)
disable-model-invocation: true
---

# Deploy

Model auto-invocation disabled for safety.

## Steps

1. Run `pnpm build` to verify build succeeds
2. If build fails, **STOP** and report errors
3. If argument is "prod" or "production":
   - Run `vercel --prod`
4. Otherwise:
   - Run `vercel` (preview deployment)
5. Report the deployment URL
