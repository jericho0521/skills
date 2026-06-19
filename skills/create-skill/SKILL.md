---
name: create-skill
description: Create or improve skills in this personal skills repository. Use when the user asks to add a new skill, scaffold a skill folder, update an existing skill, organize skill ideas, or make this repository easier to install and reuse in Codex.
---

# Create Skill

## Overview

Use this skill to keep the repository useful over time: every new skill should be easy for Codex to discover, easy for a human to understand, and easy to validate.

## Workflow

1. Clarify the skill's trigger with concrete examples.
   - Ask what future user prompts should activate the skill.
   - Ask what output or behavior would count as success.
   - Stop when the skill has a clear purpose and at least two realistic prompts.

2. Choose the skill shape.
   - Use a workflow when order matters.
   - Use reference sections when the skill teaches standards or vocabulary.
   - Use `references/` for branch-specific or long material.
   - Use `scripts/` only for repeatable deterministic work.
   - Use `assets/` for files the skill copies or transforms.

3. Create or edit the skill folder.
   - Put installable skills directly under `skills/<skill-name>/`.
   - Do not create category folders under `skills/`.
   - Prefer `scripts/new-skill.ps1` for new local scaffolds when PowerShell is available.
   - Otherwise copy `templates/skill/` and replace every placeholder.

4. Write the skill.
   - Keep frontmatter to `name` and `description`.
   - Put all trigger language in the description.
   - Use imperative steps and concrete completion criteria.
   - Remove placeholder text before finishing.

5. Update repository indexes.
   - Add or move the skill entry in `docs/catalog.md`.
   - Update `CONTEXT.md` only when introducing new shared language.
   - Add a decision to `docs/repo-decisions.md` only when changing repository structure.

6. Validate.
   - Run the skill validator for the changed skill when available.
   - Run the plugin validator from the repository root when available.
   - If validation cannot run, inspect the changed files manually and say why validation was skipped.

## Local Commands

Create a new skill:

```powershell
.\scripts\new-skill.ps1 -Name review-pr -WithReferences
```

This creates `skills/review-pr/` with `SKILL.md`, `agents/openai.yaml`, and a `references/` folder. It is safe for a new name because the script refuses to overwrite an existing skill.

Preview a scaffold without writing files:

```powershell
.\scripts\new-skill.ps1 -Name review-pr -DryRun
```

This prints the normalized name and target path without creating files. It is safe because it does not write to disk.

## Quality Bar

Read `../../docs/quality-bar.md` before calling a new or edited skill ready.
