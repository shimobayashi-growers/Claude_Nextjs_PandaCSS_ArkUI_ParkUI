---
description: UI component design rules using ArkUI anatomy pattern
globs: ["src/components/ui/arc/**/*.{ts,tsx}"]
---

# Component Design Rules

## File Structure (mandatory 4-file pattern)
Every component in `src/components/ui/arc/` MUST have:

1. `{name}-anatomy.ts` — `createAnatomy("{name}").parts(...)` slot definitions
2. `{name}-recipe.ts` — Re-export recipe from `styled-system/recipes` + type alias
3. `{name}.tsx` — Component with forwardRef, recipe applied via className
4. `index.ts` — Barrel exports (component, props type, anatomy, recipe, variant props)

## Implementation Rules
- Use `forwardRef` on all components (required for Ark UI ref composition)
- Extract variant props from recipe type, merge with HTML element attributes for props type
- Call recipe function ONCE at component top, apply result via `className`
- NO `css()` calls inside component files — all styling through recipe variants
- Use `sva()` (slot variant API) for multi-slot components instead of single recipe

## Adding a New Component
1. Check if recipe exists: `ls styled-system/recipes/{name}.*`
2. If not, ensure panda.config.ts includes it and run `pnpm prepare` to regenerate
3. Create the 4-file structure above
4. Available Park UI preset recipes: accordion, alert, avatar, badge, button, card,
   carousel, checkbox, clipboard, code, collapsible, color-picker, combobox, date-picker,
   dialog, drawer, editable, field, fieldset, file-upload, form-label, hover-card, icon,
   input, kbd, link, menu, number-input, pagination, pin-input, popover, progress, qr-code,
   radio-button-group, radio-group, rating-group, segment-group, select, signature-pad,
   skeleton, slider, spinner, splitter, switch-recipe, table, tabs, tags-input, text,
   textarea, toast, toggle-group, tooltip, tree-view
