#!/bin/bash
echo "=== Claude Code Config Freshness Check ==="

# 1. CLAUDE.mdの最終更新日
if [ -f CLAUDE.md ]; then
  last_mod=$(git log -1 --format="%ci" -- CLAUDE.md 2>/dev/null || stat -f "%Sm" -t "%Y-%m-%d" CLAUDE.md)
  echo "CLAUDE.md last updated: $last_mod"
fi

# 2. 最近追加されたコンポーネント（rules未反映の可能性）
new_components=$(git diff --name-only HEAD~10 -- src/components/ui/arc/ 2>/dev/null | grep -oE "src/components/ui/arc/[^/]+" | sort -u)
if [ -n "$new_components" ]; then
  echo "NEW COMPONENTS (check if rules/component-design.md covers them):"
  echo "$new_components"
fi

# 3. package.json変更の検知（settings.json権限更新が必要かも）
pkg_changed=$(git diff --name-only HEAD~5 -- package.json 2>/dev/null)
if [ -n "$pkg_changed" ]; then
  echo "NOTICE: package.json changed recently - review .claude/settings.json permissions"
fi

# 4. 現在のスクリプト一覧
scripts=$(node -e "const p=require('./package.json'); console.log(Object.keys(p.scripts).join(', '))" 2>/dev/null)
if [ -n "$scripts" ]; then
  echo "Current scripts: $scripts"
fi
