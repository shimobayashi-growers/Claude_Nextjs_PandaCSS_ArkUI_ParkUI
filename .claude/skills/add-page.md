---
name: add-page
description: Scaffold a new page with route group, sections, and components folders
---

# Add Page

`/add-page {route-name}` scaffolds a new page.

## Steps

1. **Create route group structure:**
   ```
   src/app/({route-name})/
   ├── page.tsx
   ├── _sections/
   └── _components/
   ```

2. **`page.tsx`** must be a Server Component (no `"use client"`), composing sections:
   ```typescript
   import { css } from "../../../../styled-system/css";

   export default function {RouteName}Page() {
     return (
       <main className={css({ maxW: "breakpoint-xl", mx: "auto", p: "6" })}>
         {/* sections go here */}
       </main>
     );
   }
   ```

3. If user specifies sections, create them in `_sections/` following the `hero-section.tsx` pattern (named export, `css()` for layout)

4. **Run `pnpm lint` to verify**
