---
name: create-component
description: ArkUI anatomyパターンに従ったUIコンポーネントの雛形を生成する
---

# Create Component

`/create-component {name}` で新しいUIコンポーネントを作成する。

## 手順

1. **recipeの存在確認**
   - `ls styled-system/recipes/{name}.*` で確認
   - なければ `pnpm prepare` を実行して再チェック
   - それでもなければ Park UI プリセットにこのrecipeが含まれていないことをユーザーに通知

2. **4ファイル構成を `src/components/ui/arc/{name}/` に作成**

   **`{name}-anatomy.ts`:**
   ```typescript
   import { createAnatomy } from "@ark-ui/react/anatomy";
   export const {name}Anatomy = createAnatomy("{name}").parts("root");
   ```
   ※ Ark UIドキュメントで実際のanatomyパーツを確認すること

   **`{name}-recipe.ts`:**
   ```typescript
   import { type {Name}VariantProps, {name} } from "../../../../../styled-system/recipes";
   export type { {Name}VariantProps };
   export { {name} as {name}Recipe };
   ```

   **`{name}.tsx`:**
   ```typescript
   import { type {Element}HTMLAttributes, forwardRef } from "react";
   import { type {Name}VariantProps, {name}Recipe } from "./{name}-recipe";

   export type {Name}Props = {Element}HTMLAttributes<HTML{Element}Element> & {Name}VariantProps;

   export const {Name} = forwardRef<HTML{Element}Element, {Name}Props>(
     ({ variant, size, className, ...props }, ref) => {
       const classes = {name}Recipe({ variant, size });
       return <{element} ref={ref} className={classes} {...props} />;
     },
   );
   {Name}.displayName = "{Name}";
   ```

   **`index.ts`:**
   ```typescript
   export { {Name}, type {Name}Props } from "./{name}";
   export { {name}Anatomy } from "./{name}-anatomy";
   export { type {Name}VariantProps, {name}Recipe } from "./{name}-recipe";
   ```

3. **`pnpm lint` で検証**

4. **作成結果を報告**
