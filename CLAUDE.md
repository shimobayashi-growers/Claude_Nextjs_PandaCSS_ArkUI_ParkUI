# CLAUDE.md

## Design Intent

This project builds UI with a "headless + recipe + preset" three-layer approach:
- **Ark UI** — Headless behavior (accessibility, keyboard navigation, state management)
- **PandaCSS recipes** — Visual styling as type-safe variant maps
- **Park UI preset** — Default recipe implementations

Park UI recipes are wrapped in `src/components/ui/arc/` rather than used directly.
This provides a seam for project-specific variant overrides and anatomy extensions
without modifying generated code. `styled-system/` is generated output — never hand-edit.

## Key Design Decisions

### Why PandaCSS
Build-time type-safe token enforcement. The `css()` utility and recipe system prevent
arbitrary values, ensuring design consistency. Trade-off: `pnpm prepare` must be run
after any token or recipe config change.

### Why forwardRef Is Required
All UI components use `forwardRef`. Ark UI headless components use ref-based composition
(focus control, measurement, portal anchoring). Removing `forwardRef` breaks Ark UI integration.

### Component Placement Strategy
- Page-specific code goes in `_sections/` and `_components/` under route groups
- Only truly reusable UI primitives go in `src/components/ui/arc/`
- Threshold: promote only when used on 2+ pages. Prevents premature abstraction

### Park UI Neutral Theme
Both accent and gray intentionally use `neutral` for a monochrome base. Color accents
are added per-feature via recipe variant overrides, not at the preset level.

## Lessons Learned

- After adding a new Park UI component, **always run `pnpm prepare`** before importing its recipe. The recipe file won't exist in `styled-system/recipes/` until codegen runs
- `globals.css` must declare `@layer reset, base, tokens, recipes, utilities;` in exactly that order. Changing the layer order breaks recipe specificity
- Biome's `organizeImports` assist reorders imports automatically. Do not fight it with manual import ordering
- `styled-system/` import paths are relative from components (e.g., `../../../../../styled-system/recipes`). The `@/*` alias maps to `./src/*` and does not cover project-root `styled-system/`

## Conventions

- User-facing text in Japanese (`lang="ja"` set in layout)
- Commit messages in English, imperative mood (see git log)
- No default exports except Next.js pages/layouts (framework requirement)
- Minimize `"use client"` — prefer Server Components
