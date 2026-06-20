# Personal Skills

A local Codex skills repository for the workflows, references, and helper tools you want to reuse later.

This repository keeps skills small, composable, and organized with a clear catalog. Installable skills are kept flat under `skills/` so the plugin manifest can validate cleanly.

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

## Install with npx

After this repository is pushed to GitHub, install one of its skills into Codex with:

```powershell
npx skills add jericho0521/skills --skill <skill-name> --agent codex --global
```

This downloads the named skill from the GitHub repository and installs it into Codex's global skills directory. It is safe when you trust the repository contents, but it does run an npm package through `npx` and downloads files from GitHub.

This repository is published as `jericho0521/skills`. Restart Codex after installing so the new skill is loaded.

## How Skills Function

Skills are reusable Codex workflows. Each skill lives in `skills/<skill-name>/` and has a `SKILL.md` file with trigger language and step-by-step instructions. Codex can use a skill when your prompt matches its description, or you can invoke it explicitly by mentioning `$skill-name`.

This repository keeps skills flat under `skills/` so they can be exposed by the plugin manifest and installed one at a time.

## Available Skills

| Skill | What it does | Install command | Safety |
| --- | --- | --- | --- |
| `create-skill` | Creates or improves skills in this repository, including scaffolding, catalog updates, and validation guidance. | `npx skills add jericho0521/skills --skill create-skill --agent codex --global` | Safe when you trust the repository; it downloads this skill and installs it into Codex globally. |
| `extract-design-language` | Extracts a frontend repository's design language into `DESIGN_LANGUAGE.md`, covering components, colors, typography, layout patterns, assets, and implementation notes. | `npx skills add jericho0521/skills --skill extract-design-language --agent codex --global` | Safe when you trust the repository; it downloads this skill and installs it into Codex globally. |
| `review-fix-loop` | Runs an iterative Codex `/review` loop, fixes actionable findings, reruns review, and stops when no actionable findings remain. | `npx skills add jericho0521/skills --skill review-fix-loop --agent codex --global` | Safe when you trust the repository; it downloads this skill and installs it into Codex globally. |

