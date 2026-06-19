# AGENTS.md

## Repository Intent

This repository is a local Codex plugin for personal skills. Keep installable skills directly under `skills/<skill-name>/` so `.codex-plugin/plugin.json` can expose them with `skills: "./skills/"`.

Do not create category folders directly under `skills/`; the Codex plugin validator treats every direct child of `skills/` as an installable skill. Track categories in `docs/catalog.md` instead.

## Command Safety

When giving terminal commands to run in bash, PowerShell, Command Prompt, or any other shell, include a concise explanation of what the command does and whether it is safe to run in the current circumstance.

## Adding Skills

Use `skills/create-skill/SKILL.md` when creating or updating skills in this repo.

Each skill folder must contain:

- `SKILL.md` with only `name` and `description` in YAML frontmatter.
- Optional `agents/openai.yaml` with UI metadata.
- Optional `scripts/`, `references/`, and `assets/` only when they support the skill directly.

Use lowercase hyphen-case names. Prefer short, action-oriented names such as `review-pr`, `plan-release`, or `audit-docs`.

## Validation

After creating or editing a skill, run the validators when available:

```powershell
& 'C:\Users\User\AppData\Local\Programs\Python\Python314\python.exe' C:\Users\User\.codex\skills\.system\skill-creator\scripts\quick_validate.py .\skills\<skill-name>
```

This checks the skill frontmatter and naming. It is safe when pointed at a skill folder because it reads files and reports problems.

```powershell
& 'C:\Users\User\AppData\Local\Programs\Python\Python314\python.exe' C:\Users\User\.codex\skills\.system\plugin-creator\scripts\validate_plugin.py .
```

This checks the plugin manifest and every direct skill under `skills/`. It is safe because it reads the repository and reports validation errors.
