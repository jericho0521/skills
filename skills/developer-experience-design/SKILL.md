---
name: developer-experience-design
description: Design frontend interfaces for developer experience rather than general consumer UX. Use when building or reviewing devtools, admin tools, dashboards, consoles, IDE-like interfaces, API explorers, observability views, CLIs with web UIs, docs-adjacent apps, or any frontend where the primary user is a developer/operator and the goal is efficient comprehension, debugging, configuration, or workflow execution. Combine tasteful visual direction with dense, scan-friendly, technically precise interaction design.
---

# Developer Experience Design

## Core Stance

Design for expert cognition first. Favor clarity, state legibility, trust, speed, and composability over delight, storytelling, or broad onboarding.

Use frontend design taste skills for craft, hierarchy, typography, spacing, and visual distinctiveness, but reinterpret them through a developer's working day: repeated use, high information density, precise labels, inspectable state, and fast recovery from mistakes.

## Workflow

1. Identify the developer job.
   - Name the actual work: debug, deploy, configure, compare, inspect, query, approve, migrate, triage, test, or monitor.
   - Identify the artifact being manipulated: code, logs, traces, schema, environment variable, secret, token, API request, build, branch, deployment, job, queue, database row, config, or permission.
   - Optimize the first screen for the most frequent or highest-risk job, not for product explanation.

2. Choose the interface posture.
   - Use console-style density for operational views, observability, logs, job queues, permissions, and deployment status.
   - Use editor-style layouts for code, JSON, YAML, schemas, prompts, templates, and transformations.
   - Use docs-adjacent layouts for API explorers, SDK examples, setup flows, and configuration references.
   - Use dashboard layouts only when comparison and monitoring are the main task.

3. Make system state impossible to miss.
   - Show environment, branch, region, account, project, resource id, version, and permissions near the relevant controls.
   - Distinguish draft, unsaved, running, queued, failed, stale, partial, destructive, and production states visually and textually.
   - Surface timestamps, actor, source, retry count, latency, cost, token usage, diff, or trace id when they affect developer decisions.

4. Prioritize developer affordances.
   - Provide copy buttons for commands, ids, URLs, errors, tokens, traces, request bodies, and config snippets.
   - Prefer tabs, split panes, resizable panels, filters, search, sorting, keyboard-friendly controls, and persistent selection.
   - Include raw and formatted views for structured data.
   - Preserve context when navigating between list, detail, logs, traces, diffs, and settings.
   - Make destructive actions explicit and reversible when possible.

5. Write interface copy like technical UI, not marketing.
   - Use exact nouns from the domain.
   - Prefer "Deploy failed", "Missing DATABASE_URL", or "3 retries left" over vague status language.
   - Put the cause, impact, and next action in error states.
   - Keep labels stable and searchable; avoid cute synonyms for technical concepts.

6. Apply visual taste with restraint.
   - Use strong hierarchy, alignment, type scale, spacing, and contrast to make complex information scannable.
   - Keep decoration subordinate to workflow comprehension.
   - Use color semantically: success, warning, danger, info, environment, diff additions/removals, and selection.
   - Avoid landing-page composition, oversized hero areas, decorative gradients, or empty card-heavy layouts unless the user explicitly asks for a marketing surface.

7. Verify the DX result.
   - Confirm the primary workflow is reachable without reading explanatory text.
   - Confirm dense data remains scannable on desktop and usable on mobile when mobile support matters.
   - Confirm copied commands and snippets are complete and executable.
   - Confirm empty, loading, failed, unauthorized, partial-data, long-text, and many-row states have intentional layouts.
   - Confirm production or destructive actions have clear context and safeguards.

## Useful Patterns

- Resource table plus detail drawer for services, deployments, jobs, tokens, users, and database records.
- Split-pane editor plus preview/output for configs, templates, API requests, transformations, and prompts.
- Timeline plus log stream plus metadata sidebar for deployments, builds, traces, incidents, and background jobs.
- Command palette or quick switcher for large technical surfaces.
- Inline diff for config changes, generated code, schema migrations, permissions, and environment changes.
- "Copy command", "Copy as cURL", "Copy JSON", "Open trace", "View raw", and "Retry" actions near the artifact they affect.

## Completion Criteria

Finish only when the interface feels like a tool a developer could keep open all day: information-dense without being chaotic, visually intentional without being decorative, precise about state, and efficient for repeat workflows.
