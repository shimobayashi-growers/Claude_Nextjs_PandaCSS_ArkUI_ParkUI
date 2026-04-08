---
name: sync-config
description: Claude Code設定ファイルの鮮度チェックと更新提案を行う
---

# Sync Config

全設定ファイルの包括的な整合性チェックを実行し、更新が必要な箇所を提案する。

## チェック項目

### 1. CLAUDE.md 鮮度チェック
- `git log --oneline -20` で最近のコミットを確認
- 新しい設計判断や教訓がCLAUDE.mdに反映されていないか検出
- 更新が必要な場合はdiffで提案

### 2. rules/ 整合性チェック
- `src/components/ui/arc/` 配下の全コンポーネントをスキャン
- 現在のコードパターンと rules/ の記述の乖離を検出
- 新しいパターン（例: multi-slot `sva()` の導入）があれば追記提案
- globs設定が現在のディレクトリ構造と合っているか確認

### 3. settings.json 権限チェック
- `package.json` の scripts と照合し、未許可の新スクリプトを検出
- 新しい devDependencies のCLIツールがあれば allow 追加を提案
- deny リストが最新のセキュリティ要件を満たしているか確認

### 4. skills/ カバレッジチェック
- 頻出するワークフローでスキル化されていないものを提案
- 既存スキルが現在のファイル構造と整合しているか確認
- 新しいコンポーネントやページ構造パターンの反映

### 5. hooks/ 動作確認
- `session-start-check.sh` と `pre-commit-sync-check.sh` が現在のプロジェクト構造で正しく動作するか確認
- 必要に応じてスクリプトの更新を提案

## 出力フォーマット

各チェック項目について:
- **OK**: 問題なし
- **UPDATE NEEDED**: 具体的な変更提案をdiff形式で提示
- **NEW**: 新規追加が必要な項目
