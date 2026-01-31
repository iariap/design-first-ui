# Design-First UI Process

This process defines how UI is designed, refined, and implemented using a system-first, design-first approach.

## Global artifacts (authoritative)

These must exist before any screen work begins:

- `01_canvas_system.md`
- `02_ui_tokens.md`
- `02a_navigation_map.md`

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
   - No wireframe layout changes; applying canvas breakpoint/responsive rules here is allowed

4) `06_ui_mock.md`
   - Static UI mock description
   - Token-constrained
   - Implementable without interpretation

## Rules

- Do not skip steps.
- Do not duplicate global artifacts in screen files.
- Fix errors upstream, never in the final mock.
- Screens inherit the system; they do not redefine it.
- Overlays and modals are designed inside the parent screen’s 03–06 artifacts.
- Only navigable full screens get a dedicated per-screen folder with 03–06.

## Change classification

All change requests must be classified before any edits are made. Manual edits to final mock files are not allowed because they hide the root cause.
Classification and propagation are internal steps and should be transparent to the user.

Classify the change by where the fix belongs:

- **System change:** Update the global canvas or token system when the issue is systemic (spacing scale, layout grid, global constraints).
- **Screen structure:** Update `03_structure.md` when the information hierarchy or flow is wrong.
- **Screen layout:** Update `04_wireframe.md` when the layout or placement is wrong.
- **Canvas mapping:** Update `05_canvas_applied.md` when the canvas mapping is wrong without changing layout.
- **Mock output:** Update `06_ui_mock.md` only when all upstream artifacts are correct and the issue is in the final visual description.

If a UI defect is observed (e.g., overlap, truncation, spacing), trace it upstream and fix the earliest artifact that caused it.

After fixing upstream, propagate the change downstream so all dependent artifacts stay consistent.
The change is not complete until every downstream artifact is updated.

Behavior changes are part of the spec. If user-visible behavior changes (flows, mechanisms, toasts, dialogs), classify it and update upstream artifacts (structure/mock) before implementation.

## Propagation order

When changing or adding behavior or layout:

1. Classify where the change belongs (system, structure, layout, canvas mapping, or mock).
2. Update the **earliest** affected artifact first (e.g. 03 for behavior/structure).
3. Then update the **next** artifact downstream (04, then 05, then 06). Do not skip steps.
4. Do **not** edit a downstream artifact until its immediate upstream artifact is updated.
5. Implement (code) only **after** 06_ui_mock.md is updated.

Order: 03 → 04 → 05 → 06 → implementation. One direction only; never update downstream before upstream.

If SVG UI mocks exist, regenerate them after any upstream change.

## Completion criteria

A screen is complete when:

- It follows the canvas system.
- It uses only defined tokens.
- It can be implemented without interpretation.
