---
name: review-fix-loop
description: Run an iterative Codex code review and fix loop for repository changes while keeping fixes scoped to the relevant GitHub issue, PR, branch diff, or user-requested objective. Use when asked to run /review, review a branch against a base branch, review uncommitted changes or a commit, compare work against a GitHub issue or PR, fix actionable review findings, rerun review until clean, or keep looping on Codex review findings until no actionable in-scope changes remain.
---

# Review Fix Loop

## Goal

Use Codex review mode as a second-pass reviewer, fix actionable findings with minimal scoped edits, and repeat until review reports no actionable in-scope findings. Compare the diff against the GitHub issue, PR description, branch intent, or user-requested objective before fixing so unrelated improvements do not make the repository messy. Leave final changes uncommitted unless the user separately asks to commit.

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

## Establish The Intent Scope

Before fixing any review finding, identify the objective the diff is supposed to satisfy.

1. Prefer explicit user-provided context.
   - GitHub issue URL or number.
   - Pull request URL or number.
   - Branch name and base branch.
   - Written task objective in the current thread.

2. When a GitHub issue is available, read its title, body, acceptance criteria, labels, linked PRs, and relevant comments if accessible.
   - Treat the issue as the strongest relevance boundary.
   - Extract a short issue intent summary and concrete acceptance criteria.
   - Note explicit non-goals or deferred work.

3. When a PR is available, read its title, description, linked issues, changed files, and review comments if accessible.
   - Treat the PR description and linked issue together as the relevance boundary.
   - If the PR claims to close an issue, compare the implementation against that issue before accepting broader fixes.

4. When no issue or PR context is available, infer intent from the branch name, commit messages, changed files, and user request.
   - State that the relevance boundary is inferred.
   - Ask for clarification only when the inferred boundary would make fixing risky.

5. Keep an "in-scope / out-of-scope" note for the loop.
   - In scope: changes required to satisfy the issue/PR objective, fix regressions introduced by the diff, or address tests directly covering that objective.
   - Out of scope: drive-by refactors, unrelated cleanup, style churn, broad dependency changes, unrelated failing tests, and enhancements not requested by the issue/PR.

## Loop Workflow

1. Prepare the workspace.
   - Read relevant `AGENTS.md` guidance before editing.
   - Check current Git status so user-owned changes are visible.
   - Establish the intent scope before running or acting on review findings.
   - Do not discard or revert unrelated changes.

2. Run the first review.
   - Invoke `/review` with the chosen scope.
   - Capture the findings in the thread or review pane.
   - If `/review` cannot run in the current surface, explain the limitation and perform a standard code-review pass over the same diff.

3. Triage findings.
   - Classify each item as actionable, non-actionable, duplicate, already addressed, or blocked.
   - Classify each actionable item as in-scope, out-of-scope, or uncertain based on the issue/PR objective.
   - Fix only actionable findings supported by the diff, repository context, and intent scope.
   - Do not implement speculative enhancements that were not raised as review findings.
   - Do not fix out-of-scope findings unless they are direct regressions introduced by the reviewed diff or the user explicitly expands scope.
   - For uncertain findings, inspect the issue/PR context again; if still uncertain and the change would broaden the PR, stop and ask.

4. Fix findings.
   - Make the smallest coherent changes that address the finding.
   - Keep edits near files already touched by the branch unless the issue/PR objective requires a different file.
   - Preserve public behavior unless the finding requires a behavior change.
   - Add or update tests when the finding exposes missing coverage and the repo has a clear local test pattern.
   - Avoid opportunistic formatting, renames, dependency updates, or architectural cleanup outside the issue/PR boundary.

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
- Remaining findings are actionable but outside the GitHub issue, PR, branch, or user-requested objective.
- The same blocker repeats and cannot be resolved without user input.
- A finding requires a product, UX, security, or compatibility decision not present in the repo.
- Further fixes would require touching unrelated user-owned changes.
- Further fixes would expand the PR beyond the linked issue without explicit approval.

Do not stop merely because the loop took more than one pass if actionable findings remain and can be safely fixed.

## Final Response

Report:

- Review scope used.
- Intent scope used, including issue/PR reference when available.
- Number of review passes.
- Actionable findings fixed.
- Findings intentionally left unfixed because they were out of scope.
- Checks run and their result.
- Remaining blocked or non-actionable findings, if any.
- Files changed.

Do not stage or commit changes unless the user explicitly asks for that after the loop.

## Completion Criteria

- The selected review scope has been reviewed at least once.
- The issue/PR/user objective has been compared against the diff and used to filter fixes.
- All actionable in-scope findings from the latest review pass are fixed or clearly blocked.
- Out-of-scope findings are reported without expanding the PR.
- Verification appropriate to the changed files has run or been explicitly skipped with a reason.
- Final changes remain available for user inspection in the working tree.
