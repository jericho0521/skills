# Skill Quality Bar

Use this checklist before calling a skill ready.

## Required

- The skill folder is named in lowercase hyphen-case.
- `SKILL.md` starts with YAML frontmatter containing only `name` and `description`.
- The description says what the skill does and when Codex should use it.
- The body tells Codex what to do, in order, without re-explaining generic agent behavior.
- The skill has no placeholder text.
- The skill is listed in `docs/catalog.md`.

## Good Skills

- Give Codex concrete completion criteria.
- Use examples when they change behavior.
- Move branch-specific or long reference material into `references/`.
- Add scripts only for deterministic work that would otherwise be rewritten often.
- Keep root docs about the repository and skill docs about the skill.

## Avoid

- Category folders under `skills/`.
- Long prose that does not change Codex behavior.
- Multiple files saying the same thing.
- Scripts that have not been run at least once.
- Assets or references that are not pointed to from `SKILL.md`.
