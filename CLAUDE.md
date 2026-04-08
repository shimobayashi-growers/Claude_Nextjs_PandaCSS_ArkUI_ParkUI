# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
pnpm dev          # Start dev server
pnpm build        # Production build
pnpm lint         # Biome check (lint + format check)
pnpm format       # Biome format (auto-fix)
pnpm prepare      # PandaCSS codegen + lefthook install (run after token/recipe changes)
```

Pre-commit hooks (via Lefthook) run `biome check` and `tsc --noEmit` in parallel.

## Stack

- **Next.js 16** (App Router) + **React 19** + **TypeScript 6**
- **PandaCSS** for styling — all styles via `css()` utility or recipes, no inline styles or hardcoded values
- **Ark UI** for headless interactive components
- **Park UI** panda-preset for pre-built component recipes (button, dialog, tabs, etc.)
- **Biome** for linting/formatting (tab indent, double quotes)

## Styling Rules

- Use PandaCSS tokens only: `css({ bg: "bg.default", p: "4" })` — never `style={{}}` or raw hex values
- `styled-system/` is generated (gitignored) — run `pnpm prepare` after changing `panda.config.ts` or tokens
- Import from relative paths to `styled-system/`: `import { css } from "../../styled-system/css"`
- Path alias `@/*` maps to `./src/*`

## Component Pattern

UI components in `src/components/ui/arc/` **must** follow this structure:

```
button/
├── button-anatomy.ts    # createAnatomy() slot definitions
├── button-recipe.ts     # Recipe import from styled-system + type exports
├── button.tsx           # Component — NO inline css() calls, use recipe only
└── index.ts             # Barrel exports
```

- Use `sva()` for multi-slot components, single recipe for simple ones
- Call recipe once, apply via `className`
- Re-export Park UI generated recipes from `styled-system/recipes` in the recipe file

## Page Structure

Pages use route groups with private folders for co-located code:

```
src/app/(top)/
├── page.tsx              # Composes sections
├── _sections/            # Page-level layout sections
│   └── hero-section.tsx
└── _components/          # Page-specific components
    └── button-showcase.tsx
```

- `_sections/` = layout composition units for the page
- `_components/` = small parts used within sections
- Shared UI lives in `src/components/ui/arc/`
