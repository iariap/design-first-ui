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
