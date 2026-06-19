# Personal Skills

A local Codex skills repository for the workflows, references, and helper tools you want to reuse later.

This layout borrows the spirit of [mattpocock/skills](https://github.com/mattpocock/skills): small, composable skills with a clear catalog. The Codex-specific adjustment is that installable skills are kept flat under `skills/` so the plugin manifest can validate cleanly.

## Layout

```text
.codex-plugin/plugin.json       Codex plugin manifest
skills/create-skill/            Starter skill for adding future skills
docs/catalog.md                 Active skill index and backlog
docs/quality-bar.md             Skill review checklist
docs/repo-decisions.md          Repository design notes
templates/skill/                Copyable starter template
scripts/new-skill.ps1           Optional local scaffold helper
```

## Workflow

1. Capture the idea in `docs/catalog.md`.
2. Create a new folder under `skills/<skill-name>/`.
3. Write a compact `SKILL.md` with strong trigger language in the description.
4. Add `references/`, `scripts/`, or `assets/` only when the skill needs them.
5. Validate the skill and plugin before treating it as ready.

You can also run:

```powershell
.\scripts\new-skill.ps1 -Name review-pr -WithReferences
```

This creates `skills/review-pr/` from the template and adds a `references/` folder. It is safe when the skill name is new because it refuses to overwrite an existing skill.

## Current Skills

- `create-skill`: Add or improve skills in this repository.
