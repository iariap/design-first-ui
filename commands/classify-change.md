# Command: classify-change

Classify a change request and point to the correct artifact to edit.

## Inputs

- Change description (e.g., overlap, spacing, alignment, missing data)

## Output

- Classification label
- Target file to update
- Rationale for choosing the earliest artifact
- Downstream update list (all dependent steps to update after the fix)

## Notes

- Classification and propagation are internal steps; the user only describes the issue.

## Classification map

- System change: `01_canvas_system.md` or `02_ui_tokens.md`
- Structure change: `03_structure.md`
- Layout change: `04_wireframe.md`
- Canvas mapping change: `05_canvas_applied.md`
- Mock change: `06_ui_mock.md` (only if upstream is correct)
