# Design-First UI Rules

These rules define a system-first, design-first workflow that must be followed for every UI screen.

## Global requirements

- Global artifacts must exist before any screen work begins.
- The system defines the canvas, tokens, and constraints. Screens inherit it.
- Do not redefine global artifacts inside a screen.

## Global artifacts (in order)

1) 01_canvas_system.md
2) 02_ui_tokens.md

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
