---
name: check-health
description: Run all project health checks (types, lint, build)
---

# Check Health

Run these checks in sequence, stopping on first failure:

1. `npx tsc --noEmit` — TypeScript type check
2. `pnpm lint` — Biome lint + format check
3. `pnpm build` — Production build

## Report Format

```
- [x] TypeScript: pass (error count)
- [x] Biome: pass (error count)
- [x] Build: pass
```

If all pass, confirm the project is healthy.
If any fail, provide specific errors and suggested fixes.
