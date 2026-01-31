# Design-First UI Process

This process defines how UI is designed, refined, and implemented using a system-first, design-first approach.

## Global artifacts (authoritative)

These must exist before any screen work begins:

- `01_canvas_system.md`
- `02_ui_tokens.md`

Screens inherit the system; they do not redefine it.

## Per-screen workflow (in order)

1) `03_structure.md`
   - Screen purpose
   - User goal
   - Information hierarchy

2) `04_wireframe.md`
   - Low-fidelity layout
   - Structure only
   - No visuals

3) `05_canvas_applied.md`
   - Apply canvas system
   - No layout changes

4) `06_ui_mock.md`
   - Static UI mock description
   - Token-constrained
   - Implementable without interpretation

## Rules

- Do not skip steps.
- Do not duplicate global artifacts in screen files.
- Fix errors upstream, never in the final mock.
- Screens inherit the system; they do not redefine it.

## Change classification

All change requests must be classified before any edits are made. Manual edits to final mock files are not allowed because they hide the root cause.

Classify the change by where the fix belongs:

- **System change:** Update the global canvas or token system when the issue is systemic (spacing scale, layout grid, global constraints).
- **Screen structure:** Update `03_structure.md` when the information hierarchy or flow is wrong.
- **Screen layout:** Update `04_wireframe.md` when the layout or placement is wrong.
- **Canvas mapping:** Update `05_canvas_applied.md` when the canvas mapping is wrong without changing layout.
- **Mock output:** Update `06_ui_mock.md` only when all upstream artifacts are correct and the issue is in the final visual description.

If a UI defect is observed (e.g., overlap, truncation, spacing), trace it upstream and fix the earliest artifact that caused it.

After fixing upstream, propagate the change downstream so all dependent artifacts stay consistent.

## Completion criteria

A screen is complete when:

- It follows the canvas system.
- It uses only defined tokens.
- It can be implemented without interpretation.
