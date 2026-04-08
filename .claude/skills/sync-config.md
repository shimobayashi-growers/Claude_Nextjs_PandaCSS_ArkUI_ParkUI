---
name: sync-config
description: Audit Claude Code config files for freshness and propose updates
---

# Sync Config

Run a comprehensive consistency check across all config files and propose updates.

## Checks

### 1. CLAUDE.md Freshness
- Review `git log --oneline -20` for recent commits
- Detect new design decisions or lessons not yet reflected in CLAUDE.md
- Propose updates as diffs if needed

### 2. rules/ Consistency
- Scan all components in `src/components/ui/arc/`
- Detect drift between current code patterns and rules/ documentation
- Propose additions for new patterns (e.g., multi-slot `sva()` introduction)
- Verify globs match current directory structure

### 3. settings.json Permissions
- Cross-reference `package.json` scripts for unpermitted new scripts
- Propose allow additions for new devDependency CLI tools
- Verify deny list meets current security requirements

### 4. skills/ Coverage
- Identify frequent workflows not yet captured as skills
- Verify existing skills align with current file structure
- Reflect new component or page structure patterns

### 5. hooks/ Verification
- Confirm `session-start-check.sh` and `pre-commit-sync-check.sh` work with current project structure
- Propose script updates if needed

## Output Format

Per check item:
- **OK**: No issues
- **UPDATE NEEDED**: Specific change proposal in diff format
- **NEW**: New addition required
