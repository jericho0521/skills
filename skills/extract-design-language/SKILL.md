---
name: extract-design-language
description: Extract and document the design language of a frontend repository so another agent can replicate its UI. Use when asked to analyze a frontend codebase's visual system, create or update DESIGN_LANGUAGE.md, capture components, colors, typography, spacing, layout patterns, CSS conventions, assets, interaction states, or produce an agent-readable design reference similar to AGENTS.md or CLAUDE.md.
---

# Extract Design Language

## Goal

Create or update a root-level `DESIGN_LANGUAGE.md` that explains how to reproduce the repository's UI style from evidence in the codebase. Favor concrete source-backed observations over generic design advice.

## Workflow

1. Locate the frontend surface.
   - Inspect package manifests, app directories, component folders, style configs, global CSS, theme files, Storybook files, and design-token sources.
   - Identify the framework, styling approach, UI libraries, icon libraries, animation libraries, and asset pipeline.

2. Inventory foundations.
   - Extract colors from theme config, CSS variables, Tailwind config, Sass/Less files, component classes, inline styles, and design-token files.
   - Extract typography from font imports, framework font helpers, CSS font stacks, text components, heading/body class patterns, and line-height/weight usage.
   - Extract spacing, radius, shadow, border, breakpoint, z-index, and motion conventions from shared tokens and repeated component patterns.
   - Note semantic usage, such as which colors mean primary action, danger, muted text, surface, border, focus, and disabled.

3. Inventory components and patterns.
   - Identify reusable components, page shells, navigation, forms, tables, cards, modals, empty states, loading states, error states, and data display patterns.
   - For each important component family, record its visual anatomy, variants, states, composition rules, and the source files that demonstrate it.
   - Capture recurring layout patterns such as dashboards, marketing sections, sidebars, grids, forms, detail pages, and responsive behavior.

4. Inspect assets and visual dependencies.
   - Document icon sets, image treatment, logos, illustrations, chart libraries, maps, embeds, gradients, backgrounds, and media sizing rules.
   - Include where assets live and how they are imported or referenced.

5. Synthesize implementation guidance.
   - Explain how a future agent should build new UI in this repo without drifting from the existing design language.
   - Include preferred primitives, class naming patterns, component composition patterns, and styling constraints.
   - Call out anti-patterns only when the repo provides evidence, such as one-off colors that should not be copied.

6. Write `DESIGN_LANGUAGE.md`.
   - Create the file at the repository root unless the user explicitly asks for another location.
   - Use concise Markdown with enough examples and file references for another agent to act on.
   - If the file already exists, update it in place and preserve useful existing guidance that is still accurate.

## `DESIGN_LANGUAGE.md` Contract

Use this section order unless the repository strongly suggests a better structure:

1. `# Design Language`
2. `## Overview`
   - State the product feel, primary UI archetypes, framework, styling system, and main design primitives.
3. `## Source Map`
   - List the key files and folders that define the design language.
4. `## Foundations`
   - Cover colors, typography, spacing, radius, shadows, borders, motion, breakpoints, and accessibility cues.
5. `## Components`
   - Document major component families, variants, states, and source examples.
6. `## Layout Patterns`
   - Document page shells, grids, navigation, responsive behavior, and common compositions.
7. `## Assets and Iconography`
   - Document icon libraries, logos, images, illustrations, charts, and media treatment.
8. `## Implementation Notes`
   - Explain how to extend the UI consistently, including preferred APIs, styling conventions, and common pitfalls.
9. `## Replication Checklist`
   - Provide a short checklist an agent can use before building new UI in the same style.

## Evidence Rules

- Cite source files for specific claims whenever practical.
- Prefer exact token names, CSS variables, utility classes, component props, and imported assets over prose-only descriptions.
- Include representative examples, not every repeated instance.
- Mark uncertain findings as inferred and explain the evidence.
- Do not invent brand values, design tokens, or component variants that are not present in the repo.

## Completion Criteria

- `DESIGN_LANGUAGE.md` exists and is useful without needing the original chat.
- The document covers foundations, components, patterns, assets, and implementation guidance.
- Claims are grounded in repository files, not generic frontend best practices.
- Another agent could build a new screen that visually belongs in the app by following the document.
