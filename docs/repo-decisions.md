# Repository Decisions

## 2026-06-19: Flat Install Path

The reference repository groups skills by category folders such as engineering and productivity. This repo keeps installable Codex skills directly under `skills/` because the local plugin validator checks each direct child as a skill folder.

Categories live in `docs/catalog.md`. If Codex later supports recursive skill manifests or explicit skill path arrays for this workflow, this can be revisited.

## 2026-06-19: Root-Level Plugin

The current directory is the plugin root. `.codex-plugin/plugin.json` lives here instead of inside a nested package so the repository can be installed or shared as one skill collection.
