# Personal Skills Context

## Language

**Skill**: A self-contained folder that teaches Codex a reusable workflow, reference, or tool pattern.

**Skill repository**: This repo, which collects personal skills as a local Codex plugin.

**Plugin manifest**: `.codex-plugin/plugin.json`, the file that tells Codex where the installable skills live.

**Catalog**: `docs/catalog.md`, the human planning index for active skills, categories, and backlog ideas.

**Quality bar**: `docs/quality-bar.md`, the checklist a skill should pass before it is considered ready.

## Decisions

- Installable skills live directly under `skills/<skill-name>/`.
- Categories are documented in `docs/catalog.md` instead of represented as folders under `skills/`.
- Root documentation is allowed; individual skill folders should stay lean.
- Reusable scripts should be added only when they remove repeated, error-prone work.
