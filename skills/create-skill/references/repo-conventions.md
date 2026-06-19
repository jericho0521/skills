# Repository Conventions

Use this reference when changing the repository structure or explaining why skills are organized this way.

## Install Path

Installable Codex skills live directly under `skills/<skill-name>/`.

Do not place category folders under `skills/`; the plugin validator treats each direct child as a skill.

## Category Model

Use `docs/catalog.md` for categories and planning. A skill can move between categories without changing its install path.

## Root Files

- `.codex-plugin/plugin.json` exposes this repo as a local Codex plugin.
- `AGENTS.md` gives future agents repository rules.
- `CONTEXT.md` stores shared language.
- `docs/quality-bar.md` defines readiness checks.
- `templates/skill/` is a copyable starter.
