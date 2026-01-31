# Change Classification

All change requests must be classified before edits. This prevents patching the final mock and keeps the system consistent.
Classification and propagation are internal steps; the user only describes the issue.

## Classification map

- System change: `01_canvas_system.md` or `02_ui_tokens.md`
- Structure change: `03_structure.md`
- Layout change: `04_wireframe.md`
- Canvas mapping change: `05_canvas_applied.md`
- Mock change: `06_ui_mock.md` (only if upstream is correct)

## Examples

- Overlapping elements: usually a structure or layout issue, fix in `03_structure.md` or `04_wireframe.md`.
- Wrong spacing scale: system issue, fix in `02_ui_tokens.md`.
- Canvas mapping mismatch: fix in `05_canvas_applied.md`.

## Rule of thumb

Always fix the earliest artifact that introduced the issue.

After fixing upstream, update downstream artifacts so the final mock stays consistent.
The change is not done until every dependent artifact is updated.
