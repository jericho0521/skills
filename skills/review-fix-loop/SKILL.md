---
name: review-fix-loop
description: Run an iterative Codex code review and fix loop for repository changes. Use when asked to run /review, review a branch against a base branch, review uncommitted changes or a commit, fix actionable review findings, rerun review until clean, or keep looping on Codex review findings until no actionable changes remain.
---

# Review Fix Loop

## Goal

Use Codex review mode as a second-pass reviewer, fix actionable findings with minimal scoped edits, and repeat until review reports no actionable findings. Leave final changes uncommitted unless the user separately asks to commit.

## Review Command

Use the documented Codex `/review` command for the review pass. If the current Codex surface exposes an equivalent `/code-review` command instead, use that available review command with the same scope and stopping rules.

Treat `/review` as a reviewer, not as the fixer. The reviewer reports prioritized findings; this skill handles triage, fixes, verification, and reruns.

## Choose The Review Scope

1. Use the user's requested scope when provided.
   - Base branch named: review branch changes against that base branch.
   - Local or working-tree changes requested: review uncommitted changes.
   - Commit SHA or commit reference named: review that commit.
   - Pull request context requested: review the current PR branch against its base when available.

2. If scope is unspecified, inspect Git state before choosing.
   - Prefer uncommitted changes when staged, unstaged, or untracked files exist.
   - Otherwise, review branch changes against the likely base branch when discoverable.
   - If no reviewable diff exists, stop and report that there is nothing to review.

3. Keep the chosen scope stable across the loop unless the user changes it.

## Loop Workflow

1. Prepare the workspace.
   - Read relevant `AGENTS.md` guidance before editing.
   - Check current Git status so user-owned changes are visible.
   - Do not discard or revert unrelated changes.

2. Run the first review.
   - Invoke `/review` with the chosen scope.
   - Capture the findings in the thread or review pane.
   - If `/review` cannot run in the current surface, explain the limitation and perform a standard code-review pass over the same diff.

3. Triage findings.
   - Classify each item as actionable, non-actionable, duplicate, already addressed, or blocked.
   - Fix only actionable findings supported by the diff and repository context.
   - Do not implement speculative enhancements that were not raised as review findings.

4. Fix findings.
   - Make the smallest coherent changes that address the finding.
   - Preserve public behavior unless the finding requires a behavior change.
   - Add or update tests when the finding exposes missing coverage and the repo has a clear local test pattern.

5. Verify locally.
   - Run relevant checks discovered from package scripts, project docs, or `AGENTS.md`.
   - If checks are expensive or unavailable, run the smallest reliable verification and say what was skipped.

6. Rerun review.
   - Run `/review` again with the same scope.
   - Repeat triage, fixes, and verification while actionable findings remain.

## Stopping Rules

Stop when one of these is true:

- `/review` reports no actionable findings.
- Remaining findings are non-actionable, duplicates, or already addressed, with evidence.
- The same blocker repeats and cannot be resolved without user input.
- A finding requires a product, UX, security, or compatibility decision not present in the repo.
- Further fixes would require touching unrelated user-owned changes.

Do not stop merely because the loop took more than one pass if actionable findings remain and can be safely fixed.

## Final Response

Report:

- Review scope used.
- Number of review passes.
- Actionable findings fixed.
- Checks run and their result.
- Remaining blocked or non-actionable findings, if any.
- Files changed.

Do not stage or commit changes unless the user explicitly asks for that after the loop.

## Completion Criteria

- The selected review scope has been reviewed at least once.
- All actionable findings from the latest review pass are fixed or clearly blocked.
- Verification appropriate to the changed files has run or been explicitly skipped with a reason.
- Final changes remain available for user inspection in the working tree.
