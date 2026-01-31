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

## Completion criteria

A screen is complete when:

- It follows the canvas system.
- It uses only defined tokens.
- It can be implemented without interpretation.
