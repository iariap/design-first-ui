---
description: "Enforce the design-first UI workflow, artifact order, and change propagation rules"
alwaysApply: false
---

# Design-First UI Rules

These rules define a system-first, design-first workflow that must be followed for every UI screen.

## Global requirements

- Global artifacts must exist before any screen work begins.
- The system defines the canvas, tokens, and constraints. Screens inherit it.
- Do not redefine global artifacts inside a screen.

## Global artifacts (in order)

1) 01_canvas_system.md
2) 02_ui_tokens.md
3) 02a_navigation_map.md

## Per-screen workflow (in order)

1) 03_structure.md
2) 04_wireframe.md
3) 05_canvas_applied.md
4) 06_ui_mock.md

## Non-negotiables

- Do not skip steps.
- Fix errors upstream, never in the final mock.
- Use tokens only. No arbitrary values.
- The final UI mock must be implementable without interpretation.
- Overlays and modals are designed inside the parent screen’s 03–06 artifacts; only navigable full screens get their own per-screen folder.
- Step 05 does not change wireframe layout; applying canvas breakpoint/responsive rules is allowed.

## Change classification

Every change request must be classified before edits. Do not edit files manually in the final mock to patch issues.
This process is transparent to the user; they only describe the issue or goal.

- If the issue is systemic, update `01_canvas_system.md` or `02_ui_tokens.md`.
- If the issue is structural, update `03_structure.md`.
- If the issue is layout, update `04_wireframe.md`.
- If the issue is canvas mapping, update `05_canvas_applied.md`.
- Only update `06_ui_mock.md` when all upstream artifacts are correct.

After fixing upstream, update downstream artifacts to keep the chain consistent.
Do not consider a change complete until every dependent step has been updated.

- **Upstream first, then downstream:** When making a change, update artifacts in order: 03 → 04 → 05 → 06 → implementation. Complete each step before editing the next. Do not edit 04 before 03, 05 before 04, 06 before 05, or code before 06.

User-visible behavior changes (flows, mechanisms, toasts, dialogs) must be classified, then reflected in structure (03), then propagated through wireframe (04), canvas applied (05), and mock (06), in that order, before any code changes.
