---
name: add-page
description: ルートグループ構造を持つ新しいページの雛形を生成する
---

# Add Page

`/add-page {route-name}` で新しいページを作成する。

## 手順

1. **ルートグループ構造を作成:**
   ```
   src/app/({route-name})/
   ├── page.tsx
   ├── _sections/
   └── _components/
   ```

2. **`page.tsx`** はServer Component（`"use client"` なし）として作成。セクションを合成する構造:
   ```typescript
   import { css } from "../../../../styled-system/css";

   export default function {RouteName}Page() {
     return (
       <main className={css({ maxW: "breakpoint-xl", mx: "auto", p: "6" })}>
         {/* sections をここに配置 */}
       </main>
     );
   }
   ```

3. ユーザーがセクションを指定した場合、`_sections/` に `hero-section.tsx` パターンに従って作成（named export、`css()` でレイアウト）

4. **`pnpm lint` で検証**
