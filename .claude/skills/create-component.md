---
name: create-component
description: Scaffold a new UI component following the ArkUI anatomy pattern
---

# Create Component

`/create-component {name}` scaffolds a new UI component.

## Steps

1. **Verify recipe exists**
   - Check `ls styled-system/recipes/{name}.*`
   - If missing, run `pnpm prepare` and re-check
   - If still missing, inform user the Park UI preset does not include this recipe

2. **Create 4-file structure in `src/components/ui/arc/{name}/`**

   **`{name}-anatomy.ts`:**
   ```typescript
   import { createAnatomy } from "@ark-ui/react/anatomy";
   export const {name}Anatomy = createAnatomy("{name}").parts("root");
   ```
   Note: check Ark UI docs for the component's actual anatomy parts.

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

3. **Run `pnpm lint` to verify**

4. **Report what was created**
