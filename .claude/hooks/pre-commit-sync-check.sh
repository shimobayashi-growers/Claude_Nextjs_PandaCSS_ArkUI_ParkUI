#!/bin/bash
# コミット時に設定ファイルの同期漏れをリマインドする（ブロックはしない）
staged=$(git diff --cached --name-only)

# 新コンポーネントが追加されたがrules/が更新されていない
if echo "$staged" | grep -q "src/components/ui/arc/" && ! echo "$staged" | grep -q ".claude/rules/"; then
  echo "REMINDER: New component files staged. Consider updating .claude/rules/component-design.md if new patterns were introduced."
fi

# package.jsonが変更されたがsettings.jsonが更新されていない
if echo "$staged" | grep -q "package.json" && ! echo "$staged" | grep -q ".claude/settings.json"; then
  echo "REMINDER: package.json changed. Review .claude/settings.json permissions if new scripts/tools were added."
fi

# 新しいページ構造が追加された
if echo "$staged" | grep -q "src/app/" && ! echo "$staged" | grep -q ".claude/skills/"; then
  echo "REMINDER: App routes changed. Consider if .claude/skills/add-page.md needs updating."
fi
