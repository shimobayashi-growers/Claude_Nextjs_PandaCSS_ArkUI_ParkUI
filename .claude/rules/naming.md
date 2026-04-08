---
description: File and code naming conventions
globs: ["src/**/*"]
---

# Naming Conventions

## Files
- All kebab-case: `button-showcase.tsx`, `hero-section.tsx`
- Suffix patterns: `-anatomy.ts`, `-recipe.ts`, `.tsx` (component), `.test.tsx`
- Page-private folders: `_` prefix (`_components/`, `_sections/`)

## Code
- PascalCase: components, types (`Button`, `ButtonProps`, `ButtonVariantProps`)
- camelCase: functions, variables, recipe instances (`buttonRecipe`, `buttonAnatomy`)
- UPPER_SNAKE_CASE: true constants only (env keys, magic numbers)

## Exports
- Named exports everywhere. Default exports ONLY for Next.js pages/layouts (framework requirement)
- Barrel `index.ts` in each component folder — import from folder, not file
- Import shared UI via alias: `@/components/ui/arc/button`
- Import styled-system via relative paths (it's outside `src/`)
