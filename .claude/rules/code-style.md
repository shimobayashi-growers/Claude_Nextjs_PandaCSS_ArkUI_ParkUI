---
description: PandaCSS, ArkUI, and ParkUI coding conventions
globs: ["src/**/*.{ts,tsx}"]
---

# Code Style Rules

## PandaCSS
- ALWAYS use PandaCSS tokens via `css()` or recipes. NEVER use `style={{}}` or raw CSS values
- Import `css` from relative path to `styled-system/css`, not from a package
- Use PandaCSS patterns (stack, hstack, vstack, flex, grid) for layout where appropriate
- Token values are strings: `css({ p: "4", gap: "3" })` — not numbers `css({ p: 4 })`
- Do not create `.css` or `.module.css` files except `globals.css`

## Biome
- Indent with tabs (configured in biome.json)
- Double quotes for strings (configured in biome.json)
- Do not add eslint, prettier, or any other formatter config
- Check: `pnpm lint` / Auto-fix: `pnpm format`

## TypeScript
- Strict mode enabled. Never use `any` — use `unknown` and narrow
- Prefer `type` over `interface` for props (project convention)
- Use type-only imports: `import type { X } from "y"`
