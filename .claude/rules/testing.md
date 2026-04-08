---
description: Testing conventions (expand when test framework is added)
globs: ["**/*.test.{ts,tsx}", "**/*.spec.{ts,tsx}"]
---

# Testing Rules

## Current State
No test framework installed yet. When adding tests:
- Use Vitest (compatible with PandaCSS build pipeline)
- Co-locate test files next to source: `button.test.tsx` alongside `button.tsx`
- Use React Testing Library for component tests
- Test behavior (click, keyboard nav) not visual styling

## Naming
- File: `{component-name}.test.tsx`
- Describe block: component display name
- Test names: "should {expected behavior} when {condition}"
